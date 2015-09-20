class UserSelectedTopic < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :availabilities

  validates :user, uniqueness: {scope: :topic}
end
