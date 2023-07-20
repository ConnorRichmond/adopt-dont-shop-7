class CreateAdoptionAppPets < ActiveRecord::Migration[7.0]
  def change
    create_table :adoption_app_pets do |t|
      t.references :adoption_app, foreign_key: true
      t.references :pet, foreign_key: true
      t.string :status, default: "Pending"
      t.timestamps
    end
  end
end
