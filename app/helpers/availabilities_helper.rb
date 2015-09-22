module AvailabilitiesHelper
	def user_helper(avail)
		ust = UserSelectedTopic.find(avail.user_selected_topic_id)
		user = User.find(ust.user_id)
	end

	def hour_helper(avail)
		hour = Hour.find(avail.hour_id)
		return {month: hour.month, day: hour.day, hour: hour.hr}
	end

	def avail_date(avail)
		hour = Hour.find(avail.hour_id)
		p 'HOURRRRRRRRRRRRRRRRRR'
		p hour.month
		p hour.day
		p hour.hr
		session_date = Time.new(Time.now.year, hour.month, hour.day, hour.hr)
	end

	def topic_helper(avail)
		ust = UserSelectedTopic.find(avail.user_selected_topic_id)
		topic = Topic.find(ust.topic_id)
	end

end
