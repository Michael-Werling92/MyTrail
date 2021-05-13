class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :location
      t.date :date
      t.integer :scout_id

      t.timestamps
    end
  end
end
