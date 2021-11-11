class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.string :role, null: false
      t.boolean :can_change_positions, null: false, default: 'false'
      t.boolean :can_change_events, null: false, default: 'false'
      t.boolean :can_change_roster, null: false, default: 'false'
      t.boolean :member, null: false, default: 'true'
      t.boolean :officer, null: false, default: 'false'

      t.timestamps
    end
  end
end
