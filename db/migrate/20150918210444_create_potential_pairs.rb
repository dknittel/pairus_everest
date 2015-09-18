class CreatePotentialPairs < ActiveRecord::Migration
  def change
    create_table :potential_pairs do |t|
      t.boolean :user1_accepted
      t.boolean :user2_accepted
      t.references :user2_availability
      t.references :user1_availability

      t.timestamps null: false
    end
  end
end
