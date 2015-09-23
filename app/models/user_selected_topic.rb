class UserSelectedTopic < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :availabilities, dependent: :destroy

  validates :user, uniqueness: {scope: :topic}
end
