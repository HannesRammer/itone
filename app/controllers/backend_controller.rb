class BackendController < ApplicationController
  before_filter :admin_required
  def load
    @body_parts = BodyPart.all
    @muscles = Muscle.all.sort!{|t1,t2|t1.name <=> t2.name}
    @exercises = Exercise.all
    exercise_types = [["Please select",nil]]
    @exercises.each do |x|
      exercise_types  << [x.exercise_type,x.exercise_type]
    end
    @exercise_types = exercise_types.uniq
  end

  def index
    load
    if request.post?
      @ex = get_or_save("exercise", "Exercise")
      i = params[:info]
      if @ex
        @ex.description = i[:description] if !i[:description].blank?
        @ex.how_to = i[:how_to] if !i[:how_to].blank?
        @ex.how_not_to = i[:how_not_to] if !i[:how_not_to].blank?
        @ex.info = i[:info] if !i[:info].blank?
        ext = nil
        if i[:exercise_type] != "" || i[:exercise_type1] != ""
           i[:exercise_type] != "" ? ext = i[:exercise_type] : ext = i[:exercise_type1]
        end
        @ex.exercise_type = ext if ext
        @ex.save
      end
      @bp = get_or_save("body_part", "BodyPart")
      get_or_save_muscles

    end

  end

  def get_or_save_muscles

    %w{   primary secondary antagonistic   }.each do |type|
      par = []
      eval "par = params[:#{type}]"
      (par.length / 2).times do |i|
        tm = get_or_save(type, "Muscle", (i + 1))
        if @ex && tm && @bp
          ExerciseToMuscle.fabeiabpiamiamt(@ex.id, @bp.id, tm.id, type) ||
                  ExerciseToMuscle.create(:exercise_id => @ex.id, :body_part_id => @bp.id, :muscle_id=>tm.id, :muscle_type=>type)
        end
      end
    end

  end

  def add_muscle_select
    @muscles = Muscle.all.sort!{|t1,t2|t1.name <=> t2.name}
    type = params[:muscle_type]
    id = params[:select_id].to_i
    render :update do |page|
      page["#{type}_muscles_button"].replace muscle_part_backend_tag(type, id)
    end
  end

  def get_or_save(param_name, model, id = nil)
    var = ""
    eval "var = params[:#{param_name}]"
    new_name = ""
    eval "new_name = var[:name#{"_#{id}" if id}]"
    new_id = ""
    eval "new_id = var[:id#{"_#{id}" if id}]"
    model = model.constantize
    (
    !new_id.blank? &&
            model.find_by_id(new_id)
    )||
            (
            !new_name.blank? &&
                    (
                    model.find_by_name(new_name) ||
                            model.create(:name=>new_name)
                    )
            )
  end

end
