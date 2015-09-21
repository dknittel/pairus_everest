class CreatePotentialPairs < ActiveRecord::Migration
  def change
    create_table :potential_pairs do |t|
      t.boolean :user1_accepted
      t.boolean :user2_accepted
      t.integer :availability1_id, index: true, foreign_key: true
      t.integer :availability2_id
      t.references :topic, index: true, foreign_key: true
      t.references :hour, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
