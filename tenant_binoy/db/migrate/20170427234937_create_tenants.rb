class CreateTenants < ActiveRecord::Migration[5.0]
  def change
    create_table :tenants do |t|
      t.string :name, null: false, default: ''
      t.timestamps null: false
    end
  end
end
