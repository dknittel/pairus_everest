class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.belongs_to :schedule, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
