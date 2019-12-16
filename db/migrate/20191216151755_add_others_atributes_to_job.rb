class AddOthersAtributesToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :workplace, :string
    add_column :jobs, :end_date, :date
    add_column :jobs, :favorite, :boolean
  end
end
