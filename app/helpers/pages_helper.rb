module PagesHelper

  def add_user_to_group(group_id)
    group = Group.find(group_id)
    group.users << current_user
  end
end
