require "rails_helper"

RSpec.describe "visiting the admin shelter index", type: :feature do 
  before(:each) do
    test_data
  end
  #user story 10
  it "will list all shelters in reverse alpha order by name" do
    visit "/admin/shelters"

    expect(@shelter_2.name).to appear_before(@shelter_1.name)

    expect(page).to have_content("RGV animal shelter")
  end

  #user story 11
  it "will display a list on Shelters with pending applications" do
    visit "/admin/shelters"

    within(".Pending_apps") do
      expect(page).to have_content("Shelters with Pending Applications")
      expect(@adoption_app_1.status).to eq("Pending")
      # adoption_app.pets.shelters.name
      # adoption_app << pet_1
      # @adoption_app_1.pets << @pet_1
      # shelter_name = Shelter.find(adoption_app_1.pets.first.shelter_id).name
    end

  end
end