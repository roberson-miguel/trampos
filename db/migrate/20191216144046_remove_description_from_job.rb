class RemoveDescriptionFromJob < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :description, :string
  end
end
