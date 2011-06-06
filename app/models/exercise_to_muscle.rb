class ExerciseToMuscle < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :body_part
  belongs_to :muscle

  def self.fabbpi(body_part_id)
    ExerciseToMuscle.find_all_by_body_part_id_and_active(body_part_id,true)

  end

  def self.fabmtabpiami(muscle_type,body_part_id,muscle_id)
    ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id_and_muscle_id_and_active(muscle_type, body_part_id,muscle_id,true)
  end

  def self.fabmtami(muscle_type, muscle_id)
    ExerciseToMuscle.find_all_by_muscle_type_and_muscle_id_and_active(muscle_type, muscle_id, true )
  end
  def self.fabeiamt(exercise_id, muscle_type)
    ExerciseToMuscle.find_all_by_exercise_id_and_muscle_type(exercise_id,muscle_type)
  end
  def self.fabeiabpiamiamt(exercise_id, body_part_id,muscle_id,muscle_type)
    ExerciseToMuscle.find_by_exercise_id_and_body_part_id_and_muscle_id_and_muscle_type(exercise_id, body_part_id, muscle_id, muscle_type)
  end
end
