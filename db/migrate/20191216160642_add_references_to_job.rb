class AddReferencesToJob < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :company, foreign_key: true
    add_reference :jobs, :skill, foreign_key: true
    add_reference :jobs, :job_level, foreign_key: true
    add_reference :jobs, :benefit, foreign_key: true
  end
end
