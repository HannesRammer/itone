class CreateMuscles < ActiveRecord::Migration
  def self.up
    create_table :muscles do |t|
      t.column :name, :text
    end
  end

  def self.down

  end
end
