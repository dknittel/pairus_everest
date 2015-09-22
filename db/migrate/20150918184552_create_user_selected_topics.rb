class CreateUserSelectedTopics < ActiveRecord::Migration
  def change
    create_table :user_selected_topics do |t|
      t.references :user, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.boolean :selected

      t.timestamps null: false
    end
  end
end
