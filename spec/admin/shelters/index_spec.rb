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
end