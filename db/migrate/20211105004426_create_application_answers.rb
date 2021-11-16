class CreateApplicationAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :application_answers do |t|
      t.text :answer
      t.text :question
      t.string :member_email

      t.timestamps
    end
    add_foreign_key :application_answers, :members, column: :member_email, primary_key: "email"
  end
end
