class CreateSfkInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :sfk_infos do |t|
      t.string :mission
      t.string :history
      t.string :ig_link

      t.timestamps
    end
  end
end
