class AddDescriptionToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :description, :text
  end
end
