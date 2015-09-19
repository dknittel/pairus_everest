class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.belongs_to :user_selected_topic, index: true, foreign_key: true
      t.references :hour, index: true, foreign_key: true
      t.boolean	:taken

      t.timestamps null: false
    end
  end
end
