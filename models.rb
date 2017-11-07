class User < ActiveRecord::Base 
	has_many :posts, dependent: :destroy

	def full_name
		first_name + ' ' + last_name
	end
	end

class Post < ActiveRecord::Base 
	belongs_to :user
end