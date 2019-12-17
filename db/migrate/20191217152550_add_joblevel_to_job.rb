class AddJoblevelToJob < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :joblevel, foreign_key: true
  end
end
