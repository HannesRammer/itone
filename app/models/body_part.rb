class BodyPart < ActiveRecord::Base
  has_many :exercise_to_muscles, :order=> 'id asc'
  has_many :muscles, :through => :exercise_to_muscles

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
    p=0
    s=0
    a=0
    list = []
    all_m = ExerciseToMuscle.fabbpi(self.id).collect { |x| x.muscle }.uniq
    all_occurrences = all_m
    all_occurrences.each do |o|
        p = ExerciseToMuscle.fabmtabpiami('primary', self.id,o.id).length
        s = ExerciseToMuscle.fabmtabpiami('secondary', self.id,o.id).length
      #  a = ExerciseToMuscle.fabmtabpiami('antagonistic', self.id,o.id).length

     list << o if m_type == 'primary' && p >= s #&& p >= a
     list << o if m_type == 'secondary' && s > p #&& s > a
     #list << o if m_type == "antagonistic" && a > p && a > s
    end
     list.sort!{|t1,t2|t1.name <=> t2.name}
    #ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id(m_type, self.id).collect { |x| x.muscle }.uniq.sort! { |t1, t2| t1.name <=> t2.name }
  end

  def x_ercise
    ExerciseToMuscle.fabbpi(self.id).collect { |x| x.exercise }.uniq.sort!{|t1,t2|t1.name <=> t2.name}
  end



end
