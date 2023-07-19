class AddStatusToAdoptionAppPets < ActiveRecord::Migration[7.0]
  def change
    add_column :adoption_app_pets, :status, :string
  end
end
