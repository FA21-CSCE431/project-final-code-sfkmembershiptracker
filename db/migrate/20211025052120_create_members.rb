class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members, id: false do |t|
      t.string :email, primary_key: true
      t.string :full_name
      t.string :phone
      t.belongs_to :position, foreign_key: true
      t.date :grad_date
      t.integer :points

      t.timestamps
    end
  end
end
