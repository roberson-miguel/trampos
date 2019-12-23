class AddCommentToProfilejob < ActiveRecord::Migration[5.2]
  def change
    add_column :profilejobs, :comment, :string
  end
end
