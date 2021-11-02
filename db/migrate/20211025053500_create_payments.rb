class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.date :date
      t.decimal :amount
      t.string :description

      t.timestamps
    end
  end
end
