class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members, id: false do |t|
      t.string :email, primary_key: true
      t.string :full_name, null: false
      t.string :phone
      t.belongs_to :position, null: false, foreign_key: true, default: 1
      t.date :grad_date
      t.integer :points, default: 0

      t.timestamps
    end
    add_foreign_key :members, :users, column: :email, primary_key: "email"
  end
end
