require "rails_helper"

RSpec.describe AdoptionApp, type: :model do
  describe "relationships" do
    it { should have_many(:adoption_app_pets) }
    it { should have_many(:pets), through: :adoption_app_pets }
  end
end