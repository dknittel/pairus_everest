class Hour < ActiveRecord::Base
  belongs_to :user
  has_many :availabilities, dependent: :destroy

end
