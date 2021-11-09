class CreateApplicationAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :application_answers do |t|
      t.text :answer
      t.text :question
      t.string :member_email

      t.timestamps
    end
  end
end
