class Group < ActiveRecord::Base
	has_many :topics
	has_many :users, through: :user_groups
end
