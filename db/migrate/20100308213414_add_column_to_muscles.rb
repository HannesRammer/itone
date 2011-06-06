class AddColumnToMuscles < ActiveRecord::Migration
  def self.up
    add_column :muscles ,:picture_id ,:integer


  end

  def self.down
    
  end
end
