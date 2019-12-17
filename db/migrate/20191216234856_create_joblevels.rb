class CreateJoblevels < ActiveRecord::Migration[5.2]
  def change
    create_table :joblevels do |t|
      t.string :name

      t.timestamps
    end
  end
end
