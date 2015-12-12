class Student < ActiveRecord::Base
	has_many :skills
	has_many :applications
	has_many :jobs, :through => :applications
    has_secure_password	
end
