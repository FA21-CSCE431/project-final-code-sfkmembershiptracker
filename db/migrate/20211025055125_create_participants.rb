class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.belongs_to :events
      t.string :member_email
      t.string :user_code

      t.timestamps
    end
    add_foreign_key :participants, :members, column: :member_email, primary_key: "email"
  end
end
