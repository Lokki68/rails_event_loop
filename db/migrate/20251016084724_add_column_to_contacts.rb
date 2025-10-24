class AddColumnToContacts < ActiveRecord::Migration[8.0]
  def change
    add_column :contacts, :accepted, :string, default: 'waiting'
    add_column :contacts, :requested_by, :integer
  end
end
