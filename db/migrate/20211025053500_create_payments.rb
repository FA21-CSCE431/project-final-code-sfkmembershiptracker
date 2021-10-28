class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.belongs_to :member, foreign_key: true
      t.date :date
      t.decimal :amount
      t.string :description

      t.timestamps
    end
  end
end
