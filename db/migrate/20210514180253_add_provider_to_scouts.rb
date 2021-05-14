class AddProviderToScouts < ActiveRecord::Migration[6.1]
  def change
    add_column :scouts, :provider, :string
  end
end
