class AddSettingsToTenant < ActiveRecord::Migration[5.0]
  def change
    add_column :tenants, :settings, :jsonb, default: {}
  end
end
