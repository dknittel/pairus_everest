class Availability < ActiveRecord::Base

  belongs_to :user_selected_topic
  belongs_to :hour
  has_many :potential_pairs, foreign_key: "availability_id", dependent: :destroy
  has_many :pending_pairing, through: :potential_pairs, source: :availability2


end
