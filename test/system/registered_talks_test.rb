require "application_system_test_case"

class RegisteredTalksTest < ApplicationSystemTestCase
  setup do
    @registered_talk = registered_talks(:one)
  end

  test "visiting the index" do
    visit registered_talks_url
    assert_selector "h1", text: "Registered Talks"
  end

  test "creating a Registered talk" do
    visit registered_talks_url
    click_on "New Registered Talk"

    fill_in "Spea", with: @registered_talk.speaker_id
    fill_in "Talk", with: @registered_talk.talk_id
    click_on "Create Registered talk"

    assert_text "Registered talk was successfully created"
    click_on "Back"
  end

  test "updating a Registered talk" do
    visit registered_talks_url
    click_on "Edit", match: :first

    fill_in "Speaker", with: @registered_talk.speaker_id
    fill_in "Talk", with: @registered_talk.talk_id
    click_on "Update Registered talk"

    assert_text "Registered talk was successfully updated"
    click_on "Back"
  end

  test "destroying a Registered talk" do
    visit registered_talks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Registered talk was successfully destroyed"
  end
end
