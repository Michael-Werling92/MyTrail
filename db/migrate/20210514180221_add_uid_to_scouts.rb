class AddUidToScouts < ActiveRecord::Migration[6.1]
  def change
    add_column :scouts, :uid, :string
  end
end
