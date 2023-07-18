class AdoptionApp < ApplicationRecord
  validates :name, :street_address, :city, :state, :zip_code, :description, presence: true

  has_many :adoption_app_pets
  has_many :pets, through: :adoption_app_pets

  def adoption_status
    params[:status] = "In Progress"
    #if the application is submitted, it changes status to "In Progress"/defaults to "In Progress"
    #if the application is submitted AND approved, it changes status to "Approved"
    #If the application is submitted AND rejected, it changes status to "Rejected"
  end

  def shelter_finder
    # require 'pry'; binding.pry
    Shelter.find(self.pets.first.shelter_id).name
    # Pet.where(shelter_id: id).joins(:shelter).pluck("shelters.name")
  end
end