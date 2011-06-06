class CreateUserToExercises < ActiveRecord::Migration
  def self.up
    create_table :user_to_exercises do |t|
      t.integer :user_id
      t.integer :exercise_id

      t.timestamps
    end
  end

  def self.down

  end
end
