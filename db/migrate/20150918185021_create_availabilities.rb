class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.references :user, index: true, foreign_key: true
      t.references :hour, index: true, foreign_key: true
      t.belongs_to :user_topic

      t.timestamps null: false
    end
  end
end
