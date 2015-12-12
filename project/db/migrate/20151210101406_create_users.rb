class CreateUsers < ActiveRecord::Migration
    def change

    create_table :companies do |t|
    	t.string :name
        t.string :email , :unique => true
        t.string :mobile_number
    	t.string :password_digest
    end

    create_table :students do |t|
    	t.string :first_name
    	t.string :last_name
        t.string :email , :unique => true
        t.string :mobile_number
    	t.string :university
    	t.string :password_digest
    end

  end
end
