class Student < ActiveRecord::Base
	has_many :skills
	has_many :applications
	has_many :jobs, :through => :applications
    has_secure_password	

	validates :first_name , presence: true
	validates :last_name , presence: true
	validates :email , format: {/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}
	validates :mobile_number , numericality: { only_integer: true }
	validates :university , presence true
	validates :password_digest , presence: true

end
