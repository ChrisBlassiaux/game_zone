require "application_system_test_case"

class AttractionsTest < ApplicationSystemTestCase
  setup do
    @attraction = attractions(:one)
  end

  test "visiting the index" do
    visit attractions_url
    assert_selector "h1", text: "Attractions"
  end

  test "creating a Attraction" do
    visit attractions_url
    click_on "New Attraction"

    fill_in "Description", with: @attraction.description
    fill_in "Experience points", with: @attraction.experience_points
    fill_in "Maximum size", with: @attraction.maximum_size
    fill_in "Name", with: @attraction.name
    fill_in "Park", with: @attraction.park_id
    fill_in "Video presentation", with: @attraction.video_presentation
    click_on "Create Attraction"

    assert_text "Attraction was successfully created"
    click_on "Back"
  end

  test "updating a Attraction" do
    visit attractions_url
    click_on "Edit", match: :first

    fill_in "Description", with: @attraction.description
    fill_in "Experience points", with: @attraction.experience_points
    fill_in "Maximum size", with: @attraction.maximum_size
    fill_in "Name", with: @attraction.name
    fill_in "Park", with: @attraction.park_id
    fill_in "Video presentation", with: @attraction.video_presentation
    click_on "Update Attraction"

    assert_text "Attraction was successfully updated"
    click_on "Back"
  end

  test "destroying a Attraction" do
    visit attractions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Attraction was successfully destroyed"
  end
end
