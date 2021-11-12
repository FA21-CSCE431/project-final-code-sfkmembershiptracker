class CreateParticipations < ActiveRecord::Migration[6.1]
  def change
    create_table :participations do |t|
      t.bigint :event_id
      t.string :member_email
      t.string :user_code

      t.timestamps
    end
  end
end
