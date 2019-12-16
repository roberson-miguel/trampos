class AddSalaryRangeToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :salary_range, :integer
  end
end
