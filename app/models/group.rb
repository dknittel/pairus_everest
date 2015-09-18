class Group < ActiveRecord::Base
	has_many :topics
	belongs_to :admin, class_name: "User"
	has_many :user_groups
	has_many :users, through: :user_groups
end
