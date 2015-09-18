class Availability < ActiveRecord::Base
  belongs_to :user_topic
  belongs_to :hour
  has_many :potential_pairs
end
