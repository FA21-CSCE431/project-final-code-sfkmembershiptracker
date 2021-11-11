class ChangeGradDateToString < ActiveRecord::Migration[6.1]
  def change
    change_table :members do |t|
      t.change :grad_date, :string
    end
  end
end
