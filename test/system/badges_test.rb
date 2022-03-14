require "application_system_test_case"

class BadgesTest < ApplicationSystemTestCase
  setup do
    @badge = badges(:one)
  end

  test "visiting the index" do
    visit badges_url
    assert_selector "h1", text: "Badges"
  end

  test "should create badge" do
    visit badges_url
    click_on "New badge"

    fill_in "Image url", with: @badge.image_url
    fill_in "Name", with: @badge.name
    fill_in "Parameter", with: @badge.parameter
    fill_in "Rule", with: @badge.rule
    click_on "Create Badge"

    assert_text "Badge was successfully created"
    click_on "Back"
  end

  test "should update Badge" do
    visit badge_url(@badge)
    click_on "Edit this badge", match: :first

    fill_in "Image url", with: @badge.image_url
    fill_in "Name", with: @badge.name
    fill_in "Parameter", with: @badge.parameter
    fill_in "Rule", with: @badge.rule
    click_on "Update Badge"

    assert_text "Badge was successfully updated"
    click_on "Back"
  end

  test "should destroy Badge" do
    visit badge_url(@badge)
    click_on "Destroy this badge", match: :first

    assert_text "Badge was successfully destroyed"
  end
end
