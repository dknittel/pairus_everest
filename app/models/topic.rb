class Topic < ActiveRecord::Base
  belongs_to :group
  has_many :users, through: :user_topics
end
