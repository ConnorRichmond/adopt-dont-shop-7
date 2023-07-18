class AdoptionApp < ApplicationRecord
  validates :name, :street_address, :city, :state, :zip_code, :description, presence: true

  has_many :adoption_app_pets
  has_many :pets, through: :adoption_app_pets

  def shelter_finder
    Shelter.find(self.pets.first.shelter_id).name
  end
end