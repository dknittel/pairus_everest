class PotentialPair < ActiveRecord::Base
  belongs_to :availability
  belongs_to :availability1, class_name: "Availability"
end
