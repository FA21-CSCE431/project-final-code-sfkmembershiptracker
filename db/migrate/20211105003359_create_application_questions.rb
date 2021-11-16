class CreateApplicationQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :application_questions do |t|
      t.text :question

      t.timestamps
    end
  end
end
