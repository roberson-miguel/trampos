class CreateJobLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :job_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
