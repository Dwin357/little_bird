class AddUpdateStatsToUser < ActiveRecord::Migration
  def change
    add_column :users, :status, :string
    add_column :users, :updated_by, :integer
  end
end
