module AvailabilitiesHelper
	def user_helper(avail)
		ust = UserSelectedTopic.find(avail.user_selected_topic_id)
		user = User.find(ust.user_id)
		# p 'x' * 100
		# p user
		# return user
	end

	def hour_helper(avail)
		hour = Hour.find(avail.hour_id)
		return {day: hour.day, hour: hour.hr}
	end

	def topic_helper(avail)
		ust = UserSelectedTopic.find(avail.user_selected_topic_id)
		topic = Topic.find(ust.topic_id)
	end

end
