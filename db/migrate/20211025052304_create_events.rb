class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :location
      t.integer :points
      t.string :confirmation_code

      t.timestamps
    end
  end
end
