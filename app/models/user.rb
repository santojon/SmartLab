class User < ApplicationRecord
	has_many :accesses
	has_many :desks, through: :accesses
	
	has_many :incidents
	has_many :equipment
	
	has_many :incident
	attr_accessor :login
	
	devise :database_authenticatable, :validatable,
		   :authentication_keys => [:login]
	
	def to_s
	    name
	end
	
	#used to login with username into CIn domain
	def self.find_for_database_authentication(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	  	username = login.downcase
		if (!username.include? '@')
			username = username + '@cin.ufpe.br'
		end
	    where(conditions.to_h).where(["lower(email) = :value", { :value => username }]).first
	  elsif conditions.has_key?(:email)
	    where(conditions.to_h).first
	  end
	end
end
