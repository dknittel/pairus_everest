user = User.create!(handle: "asdf", email: "daknittel11@gmail.com", password: "password", password_confirmation: "password", zipcode: "12345")
user2 = User.create!(handle: "asdf2", email: "asdf2@gmail.com", password: "password", password_confirmation: "password", zipcode: "12345")

group = Group.create!(name: 'group Name')

user_group = group.user_groups.create!(user_id: user.id)
user_group2 = group.user_groups.create!(user_id: user2.id)

topic = group.topics.create!(title: 'title')

ust = UserSelectedTopic.create!(user_id: '1', topic_id: '1')
ust2 = UserSelectedTopic.create!(user_id: '2', topic_id: '1')

if ust.save
	hour1 = user.hours.create!(hr: 1, day: 1, month:9)
	avail = ust.availabilities.create!(hour_id: hour1.id)

end
if ust2.save
	hour2 = user2.hours.create!(hr: 1, day: 1, month:9)
	avail2 = ust2.availabilities.create!(hour_id: hour2.id)
end
