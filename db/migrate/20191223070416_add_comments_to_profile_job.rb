class AddCommentsToProfileJob < ActiveRecord::Migration[5.2]
  def change
    add_column :profile_jobs, :comments, :string
  end
end
