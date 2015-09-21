user = User.create(handle: "asdf", email: "asdf@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", zipcode: "12345")
user2 = User.create(handle: "asdf2", email: "asdf2@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", zipcode: "12345")

group = Group.create(name: 'g')

user_group = group.user_groups.create(user_id: user.id)
user_group2 = group.user_groups.create(user_id: user2.id)

topic = group.topics.create(title: 't')

ust = UserSelectedTopic.create(user_id: '1', topic_id: '1')
ust2 = UserSelectedTopic.create(user_id: '2', topic_id: '1')

hour = Hour.create(hr: 1, day: 1)
if ust.save
avail = ust.availabilities.create(hour_id: hour.id)
end
if ust2.save
avail2 = ust2.availabilities.create(hour_id: hour.id)
end




