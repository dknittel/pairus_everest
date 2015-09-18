class Schedule < ActiveRecord::Base
  belongs_to :user
  has_many :hours
end
