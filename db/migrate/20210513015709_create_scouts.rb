class CreateScouts < ActiveRecord::Migration[6.1]
  def change
    create_table :scouts do |t|
      t.string :first_name
      t.string :last_name
      t.string :rank
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
