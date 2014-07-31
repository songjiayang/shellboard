class AddSomeColumnsToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :email, :string
    add_column :jobs, :confirm, :boolean

    add_index :jobs, :confirm
  end
end
