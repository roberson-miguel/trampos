class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :social_name
      t.string :address
      t.string :cellphone
      t.date :date_birth
      t.integer :languages
      t.integer :education_level
      t.integer :education_status
      t.string :education_institution
      t.string :education_course
      t.date :education_end_date
      t.string :experience_company
      t.text :experience_reponsibility
      t.string :experience_role
      t.references :joblevel, foreign_key: true
      t.references :skill, foreign_key: true
      t.date :experience_start_date
      t.date :experience_end_date
      t.boolean :experience_current_position

      t.timestamps
    end
  end
end
