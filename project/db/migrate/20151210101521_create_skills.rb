class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
    	t.string :name
    	t.belongs_to :student, index: true
    end
  end
end
