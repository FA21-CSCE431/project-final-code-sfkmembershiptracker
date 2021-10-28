class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.date :grad_date
      t.string :status
      t.string :question

      t.timestamps
    end
  end
end
