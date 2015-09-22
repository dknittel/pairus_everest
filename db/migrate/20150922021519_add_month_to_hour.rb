class AddMonthToHour < ActiveRecord::Migration
  def change
    add_column :hours, :month, :integer
  end
end
