class UpdateUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :address, :string
    remove_column :users, :hobby, :string
    add_column :users, :email, :string
    add_column :users, :message, :string
  end
end
