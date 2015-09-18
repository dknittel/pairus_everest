class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :hours
  has_many :user_selected_topics
  has_many :topics, through: :user_selected_topics 
  has_many :user_groups
  has_many :groups, through: :user_groups 
end
