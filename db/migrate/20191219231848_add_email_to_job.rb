class AddEmailToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :email, :string
  end
end
