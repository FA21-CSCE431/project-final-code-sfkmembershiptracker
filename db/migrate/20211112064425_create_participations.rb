class CreateParticipations < ActiveRecord::Migration[6.1]
  def change
    create_table :participations do |t|
      t.bigint :event_id
      t.string :member_email
      t.string :user_code

      t.timestamps
    end
    add_foreign_key :participations, :events, column: :event_id, primary_key: "id"
    add_foreign_key :participations, :members, column: :member_email, primary_key: "email"
  end
end
