class UserToExercise < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise

  def self.switch_exercise(ute1, ute2, current_user)
    one = UserToExercise.find_by_id(ute1)
    two = UserToExercise.find_by_id(ute2)
    return false unless current_user.id == one.user_id && current_user.id == one.user_id 
    x = one.exercise_id
    one.exercise_id = two.exercise_id
    two.exercise_id = x
    one.save
    two.save
  end
end
