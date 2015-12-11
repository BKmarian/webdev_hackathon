class CreateUsers < ActiveRecord::Migration
    def change
    # create_table :users do |t|
    # 	t.string :account
    # 	t.string :nume
    # end

    create_table :companies do |t|
    	t.string :account
    	t.string :nume
    	t.string :password_digest
    end

    create_table :students do |t|
    	t.string :account
    	t.string :nume
    	t.string :university
    	t.string :password_digest
    end

  end
end
