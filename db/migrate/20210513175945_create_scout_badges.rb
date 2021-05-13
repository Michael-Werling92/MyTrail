class CreateScoutBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :scout_badges do |t|
      t.string :name
      t.datetime :date
      t.boolean :fun
      t.belongs_to :scout, null: false, foreign_key: true
      t.belongs_to :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
