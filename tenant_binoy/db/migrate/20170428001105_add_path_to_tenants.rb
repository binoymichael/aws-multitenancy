class AddPathToTenants < ActiveRecord::Migration[5.0]
  def change
    add_column :tenants, :path, :string
  end
end
