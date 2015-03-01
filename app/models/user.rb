class User < ActiveRecord::Base
	has_many :auths
	has_many :posts
	has_many :charities, through: :posts


end
