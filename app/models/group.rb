class Group < ActiveRecord::Base
	require 'dotenv'
	Dotenv.load

	belongs_to :admin, class_name: "User"
	has_many :user_groups
	has_many :users, through: :user_groups
	has_many :topics

	before_validation :shorten_url

	private
	def shorten_url
		url = Googl.shorten("http://pairus-app.herokuapp.com/?group=#{self.id}", '213.57.23.49', ENV['GOOGLE_API_TOKEN'])
		short_url = url.short_url
		self.link = short_url
	end
end
