class Availability < ActiveRecord::Base
  belongs_to :user_topic
  belongs_to :hour
end
