user = User.create!(handle: "Tink", email: "tink@tinkerbell.com", password: "password", password_confirmation: "password", zipcode: "12345")
# user2 = User.create!(handle: "Erick", email: "e.gist2@gmail.com", password: "password", password_confirmation: "password", zipcode: "12345")

# group = Group.create!(name: 'SF Fireflies', admin_id: 1)

# user_group = group.user_groups.create!(user_id: user.id)
# user_group = group.user_groups.create!(user_id: user2.id)
	
# topic = group.topics.create!(title: 'Rails Asset Pipeline')
# topic = group.topics.create!(title: 'Active Record Migrations')
# topic = group.topics.create!(title: 'Controllers')
# topic = group.topics.create!(title: 'RESTful Routes')

# ust = UserSelectedTopic.create!(user_id: '1', topic_id: '1')
# ust2 = UserSelectedTopic.create!(user_id: '1', topic_id: '2')
# ust3 = UserSelectedTopic.create!(user_id: '1', topic_id: '3')
# ust4 = UserSelectedTopic.create!(user_id: '1', topic_id: '4')
# # ust4 = UserSelectedTopic.create!(user_id: '1', topic_id: '1')
# # ust5 = UserSelectedTopic.create!(user_id: '1', topic_id: '2')
# # ust6 = UserSelectedTopic.create!(user_id: '1', topic_id: '3')

# # # if ust.save
# 	# hour1 = user.hours.create!(hr: 1, day: 30, month:9)
# 	# hour2 = user.hours.create!(hr: 8, day: 2, month:10)
# 	# hour3 = user.hours.create!(hr: 4, day: 1, month:10)
# 	# avail = ust.availabilities.create!(hour_id: hour1.id)
# # # end

# 	hour = user.hours.create!(hr: 8, day: 30, month:9)
# 	hour2 = user.hours.create!(hr: 11, day: 30, month:9)
# 	hour3 = user.hours.create!(hr: 12, day: 30, month: 9)
# 	# hour4 = user.hours.create!(hr: 13, day: 1, month:10)
# 	# hour5 = user.hours.create!(hr: 14, day: 1, month:10)
# 	# hour6 = user.hours.create!(hr: 17, day: 1, month:10)

# if ust.save
# 	avail1 = ust.availabilities.create!(hour_id: hour.id)
# 	avail2 = ust.availabilities.create!(hour_id: hour2.id)
# 	avail3 = ust.availabilities.create!(hour_id: hour3.id)
# 	avail1.potential_pairs.create(user1_accepted: true)
# 	avail2.potential_pairs.create(user1_accepted: true)
# 	avail3.potential_pairs.create(user1_accepted: true)
# end
# if ust2.save
# 	avail4 = ust2.availabilities.create!(hour_id: hour.id)
# 	avail5 = ust2.availabilities.create!(hour_id: hour2.id)
# 	avail6 = ust2.availabilities.create!(hour_id: hour3.id)
# 	# avail4.potential_pairs.create(user1_accepted: true)
# 	# avail5.potential_pairs.create(user1_accepted: true)
# 	# avail6.potential_pairs.create(user1_accepted: true)
# end
# if ust3.save
# 	avail7 = ust3.availabilities.create!(hour_id: hour.id)
# 	avail8 = ust3.availabilities.create!(hour_id: hour2.id)
# 	avail9 = ust3.availabilities.create!(hour_id: hour3.id)
# 	# avail7.potential_pairs.create(user1_accepted: true)
# 	# avail8.potential_pairs.create(user1_accepted: true)
# 	# avail9.potential_pairs.create(user1_accepted: true)
# end
# if ust4.save
# 	avail7 = ust4.availabilities.create!(hour_id: hour.id)
# 	avail8 = ust4.availabilities.create!(hour_id: hour2.id)
# 	avail9 = ust4.availabilities.create!(hour_id: hour3.id)
# 	# avail7.potential_pairs.create(user1_accepted: true)
# 	# avail8.potential_pairs.create(user1_accepted: true)
# 	# avail9.potential_pairs.create(user1_accepted: true)
# end
