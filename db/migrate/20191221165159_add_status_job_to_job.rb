class AddStatusJobToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :status, :integer
  end
end
