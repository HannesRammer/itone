class Exercise < ActiveRecord::Base
  has_many :exercise_to_muscles, :order=> 'muscle_type asc',:conditions => 'active = true'
  has_many :muscles, :through => :exercise_to_muscles

  has_many :user_to_exercises, :order=> 'id asc'
  has_many :users, :through => :user_to_exercises


  file_column :image1
  file_column :image2


  def primary_muscles
    self.x_muscles('primary')
  end

  def secondary_muscles
    self.x_muscles('secondary')
  end

  def antagonist_muscles
   # self.x_muscles('antagonistic')
  end

  def sorted_muscles
    (primary_muscles + secondary_muscles)# + antagonist_muscles)
  end

  def x_muscles(m_type)
    ExerciseToMuscle.fabeiamt(self.id,m_type).collect { |x| x.muscle }.sort!{|t1,t2|t1.name <=> t2.name}
  end

  def self.free_exercise
    Exercise.find_all_by_exercise_type('free').sort!{|t1,t2|t1.name <=> t2.name}
  end

  def self.non_free_exercise
     Exercise.find_all_by_exercise_type('gerät').sort!{|t1,t2|t1.name <=> t2.name}
  end


end
