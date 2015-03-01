class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :charity
	has_many :donations
end
