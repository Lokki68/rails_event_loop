class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.date :date
      t.integer :created_by_id

      t.timestamps
    end
  end
end
