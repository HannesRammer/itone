class MainController < ApplicationController

  before_filter :login_required, :except => [:index, :muscle, :body_part, :exercise, :hide_exercise, :search_string]

  def index
    @liste = []
    @muscles = Muscle.all_with_pic
    @body_parts = BodyPart.all
    @muscles = []
    @p_muscles = []
    @s_muscles = []
    #@a_muscles = []
    @current_user if logged_in?
  end

  def muscle
    p '##################################'
    p '##################################'
    p '##################################'
    p '##################################'
    p params[:muscle]['name']
    @muscles = Muscle.find_all_by_name(params[:muscle]['name'].gsub('Ae', "Ä"))
    p @muscles
    render :update do |page|
      name = normal_name(params[:muscle]['name'])
      p name
      page["muscle_selected"].replace :partial=>"main/muscle_selected"
      page["exercises_text_header"].replace_html "Alle Übungen des #{params[:muscle]['name']}'s"
      page['muscle_text_selected'].replace_html name
      page['exercise_selected'].replace '<div id="exercise_selected"></div>'
      page['exercises_text'].replace_html :partial=> 'main/exercises_text'
    end
  end

  def body_part
    body_part = BodyPart.find_by_name(params[:name])
    @p_muscles = body_part.primary_muscles
    @s_muscles = body_part.secondary_muscles
   # @a_muscles = body_part.antagonist_muscles
    @exercises = body_part.x_ercise

    render :update do |page|
      page["muscles"].replace :partial=>"main/muscle"
      page["body_part_selected"].replace :partial=>"main/body_part_selected"
      page["body_part_text_selected"].replace_html params[:name]
      page["muscle_text_header"].replace_html "Muskeln aller #{params[:name]}übungen"
      page["muscle_selected"].replace '<div id="muscle_selected"></div>'
      page["exercise_selected"].replace '<div id="exercise_selected"></div>'
      page["exercises_text_header"].replace_html "Alle #{params[:name]}übungen"
      page["exercises_text"].replace_html :partial=>"main/exercises_text"
    end
  end

  def search_string

    if params[:name] == "Gerät"
      @exercises = Exercise.non_free_exercise
    elsif params[:name] == "Freigewicht"
      @exercises = Exercise.free_exercise
    else

      exercises1 = Exercise.find(:all, :conditions => ["name LIKE ?", "%#{params[:name]}%"])
      exercises2 = Exercise.find(:all, :conditions => ["name LIKE ?", "%#{params[:name].downcase}%"])

      exercises = exercises1 + exercises2
      @exercises = exercises.uniq
    end
    render :update do |page|
      page["exercise_selected"].replace '<div id="exercise_selected"></div>'
      page["exercises_text_header"].replace_html "Alle #{params[:name]}übungen"
      page["exercises_text"].replace_html :partial=>"main/exercises_text"
    end
  end

  def exercise
    @exercise = Exercise.find_by_name(params[:exercise]['name'])
    @p_muscles = @exercise.primary_muscles
    @s_muscles = @exercise.secondary_muscles
   # @a_muscles = @exercise.antagonist_muscles

    render :update do |page|
      page["body_part_selected"].replace_html ""
      page["exercise_selected"].replace :partial=>"main/exercise_selected"
      page["exercise_text_selected"].replace_html params[:exercise]['name']
      page["open_exercise"].replace_html vertical_text(params[:exercise]['name'])
      page["exercise"].replace_html :partial=>"exercises/show"
    end
  end

  def add_exercise
    @current_user.exercises << Exercise.find_by_id(params[:exercise])
    render :update do |page|
      page["user_selected"].replace :partial=>"main/user_selected"
    end
  end


  def hide_exercise
    render :update do |page|
      page["exercise"].replace_html ""
    end
  end

  def remove_exercise
    ute = UserToExercise.find_by_id(params[:ute_id])
    ute.destroy if @current_user.id == ute.user_id
    render :update do |page|
      page["user_selected"].replace :partial=>"main/user_selected"
    end
  end

  def switch_exercise
    return unless UserToExercise.switch_exercise(params[:ute_id_1], params[:ute_id_2], @current_user)
    render :update do |page|
      page["user_selected"].replace :partial=>"main/user_selected"
    end
  end


end