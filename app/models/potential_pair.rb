class PotentialPair < ActiveRecord::Base
  belongs_to :availability1, class_name: "Availability"
  belongs_to :availability2, class_name: "Availability"
end
