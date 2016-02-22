class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.string :title
        t.string :description
    	t.belongs_to :company , index: true
    end

    create_table :applications do |t|
    	t.belongs_to :job , index: true
    	t.belongs_to :student, index: true
        t.integer :status , default: 0
    end
  end
end
