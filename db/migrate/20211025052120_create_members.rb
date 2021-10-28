class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :role
      t.date :grad_date
      t.integer :points
      t.belongs_to :application, foreign_key: true

      t.timestamps
    end
  end
end
