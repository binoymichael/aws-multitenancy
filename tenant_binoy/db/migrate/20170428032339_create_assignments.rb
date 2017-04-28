class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.references :tenant, index: true
      t.references :user, index: true
      t.string :student_id, null: false, default: ''
      t.string :assignment_type, null: false, default: ''
      t.string :description, null: false, default: ''
      t.jsonb :grades, default: {}
    end
  end
end
