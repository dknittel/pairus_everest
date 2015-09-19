class PotentialPair < ActiveRecord::Base
  # belongs_to :availability
  belongs_to :availability1, class_name: "Availability"
  belongs_to :availability2, class_name: "Availability"
  # has_one :availability, foreign_key: :user2_availability
  # has_one :other_availability, foreign_key: :user1_availability, class_name: "Availability"
end
