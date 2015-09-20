class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :day
      t.integer :hr
      t.boolean :taken?

      t.timestamps null: false
    end
  end
end
