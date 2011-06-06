class CreateBodyParts < ActiveRecord::Migration
  def self.up
    create_table :body_parts do |t|
      t.string :name
    end
    

  end

  def self.down

  end
end
