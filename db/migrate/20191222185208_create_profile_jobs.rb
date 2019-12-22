class CreateProfileJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_jobs do |t|
      t.integer :profile_id
      t.integer :job_id

      t.timestamps
    end
  end
end
