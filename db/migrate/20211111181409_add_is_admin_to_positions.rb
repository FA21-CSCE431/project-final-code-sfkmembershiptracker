class AddIsAdminToPositions < ActiveRecord::Migration[6.1]
  def change
    add_column :positions, :is_admin, :boolean
  end
end
