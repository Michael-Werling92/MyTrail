class CreateScouts < ActiveRecord::Migration[6.1]
  def change
    create_table :scouts do |t|

      t.timestamps
    end
  end
end
