class AddLinkToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :link, :string
  end
end
