class CreateOfficerPositions < ActiveRecord::Migration[6.1]
  def change
    create_table :officer_positions do |t|
      t.string :role
      t.belongs_to :member, foreign_key: true

      t.timestamps
    end
  end
end
