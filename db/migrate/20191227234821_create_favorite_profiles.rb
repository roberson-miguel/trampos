class CreateFavoriteProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_profiles do |t|
      t.integer :profile_id
      t.integer :user_id

      t.timestamps
    end
  end
end
