class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.string :role, null: false
      t.boolean :can_change_positions, default: 'false'
      t.boolean :can_change_events, default: 'false'
      t.boolean :can_change_roster, default: 'false'
      t.boolean :can_change_payments, default: 'false'
      t.boolean :member, default: 'true'

      t.timestamps
    end
  end
end
