class RemoveJobLevelFromJob < ActiveRecord::Migration[5.2]
  def change
    remove_reference :jobs, :job_level, foreign_key: true
  end
end
