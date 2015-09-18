class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.references :hour, index: true, foreign_key: true
      t.belongs_to :user_selected_topic
      t.boolean	:taken

      t.timestamps null: false
    end
  end
end
