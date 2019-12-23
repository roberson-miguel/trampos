class RemoveCommentsFromProfilejob < ActiveRecord::Migration[5.2]
  def change
    remove_column :profilejobs, :comments, :string
  end
end
