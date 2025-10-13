class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.date :date
      t.integer :created_by

      t.timestamps
    end
  end
end
