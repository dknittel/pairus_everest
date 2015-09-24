# user = User.create!(handle: "Erick", email: "e.gist2@gmail.com", password: "password", password_confirmation: "password", zipcode: "12345")
user = User.create!(handle: "Tink", email: "tink@tinkerbell.com", password: "password", password_confirmation: "password", zipcode: "12345")

group = Group.create!(name: 'SF Fireflies', admin_id: 1)

# user_group = group.user_groups.create!(user_id: user.id)
user_group2 = group.user_groups.create!(user_id: user.id)

topic = group.topics.create!(title: 'Todo List')
topic = group.topics.create!(title: 'Pad An Array')
topic = group.topics.create!(title: 'Berkshire Hathaway')

# ust = UserSelectedTopic.create!(user_id: '1', topic_id: '1')
# ust2 = UserSelectedTopic.create!(user_id: '1', topic_id: '2')
# ust3 = UserSelectedTopic.create!(user_id: '1', topic_id: '3')
ust4 = UserSelectedTopic.create!(user_id: '1', topic_id: '1')
ust5 = UserSelectedTopic.create!(user_id: '1', topic_id: '2')
ust6 = UserSelectedTopic.create!(user_id: '1', topic_id: '3')

# if ust.save
	# hour1 = user.hours.create!(hr: 1, day: 30, month:9)
	# hour2 = user.hours.create!(hr: 8, day: 2, month:10)
	# hour3 = user.hours.create!(hr: 4, day: 1, month:10)
	# avail = ust.availabilities.create!(hour_id: hour1.id)
# end

	hour4 = user.hours.create!(hr: 1, day: 30, month:9)
	hour5 = user.hours.create!(hr: 8, day: 2, month:10)
	hour6 = user.hours.create!(hr: 3, day: 1, month:10)

if ust4.save
	avail2 = ust4.availabilities.create!(hour_id: hour4.id)
	avail2 = ust4.availabilities.create!(hour_id: hour5.id)
	avail2 = ust4.availabilities.create!(hour_id: hour6.id)
	PotentialPair.create
end
if ust5.save
	avail2 = ust5.availabilities.create!(hour_id: hour4.id)
	avail2 = ust5.availabilities.create!(hour_id: hour5.id)
	avail2 = ust5.availabilities.create!(hour_id: hour6.id)
end
if ust6.save
	avail2 = ust6.availabilities.create!(hour_id: hour4.id)
	avail2 = ust6.availabilities.create!(hour_id: hour5.id)
	avail2 = ust6.availabilities.create!(hour_id: hour6.id)
end
