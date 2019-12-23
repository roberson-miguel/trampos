class CreateProfilejobs < ActiveRecord::Migration[5.2]
  def change
    create_table :profilejobs do |t|
      t.integer :profile_id
      t.integer :job_id
      t.string :comments

      t.timestamps
    end
  end
end
