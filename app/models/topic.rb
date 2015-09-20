class Topic < ActiveRecord::Base
  belongs_to :group
  has_many :user_selected_topics
  has_many :users, through: :user_selected_topics
end
