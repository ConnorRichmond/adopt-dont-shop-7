require "rails_helper"

RSpec.describe AdoptionApp, type: :model do
  before(:each) do
    test_data
  end
  describe "relationships" do
    it { should have_many(:adoption_app_pets) }
    it { should have_many(:pets), through: :adoption_app_pets }
  end

  describe "instance methods" do
    it "#shelter_finder" do

      @adoption_app_1.pets.push(@pet_3)

      expect(@adoption_app_1.shelter_finder).to eq(@pet_3.shelter.name)
    end
  end

end