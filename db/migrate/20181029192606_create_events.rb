class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :web_source
      t.string :item_id
      t.datetime :date
      t.string :title

      t.timestamps
    end
  end
end
