require 'test_helper'

class RegisteredTalksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registered_talk = registered_talks(:one)
  end

  test "should get index" do
    get registered_talks_url
    assert_response :success
  end

  test "should get new" do
    get new_registered_talk_url
    assert_response :success
  end

  test "should create registered_talk" do
    assert_difference('RegisteredTalk.count') do
      post registered_talks_url, params: { registered_talk: { speaker_id: @registered_talk.speaker_id, talk_id: @registered_talk.talk_id } }
    end

    assert_redirected_to registered_talk_url(RegisteredTalk.last)
  end

  test "should show registered_talk" do
    get registered_talk_url(@registered_talk)
    assert_response :success
  end

  test "should get edit" do
    get edit_registered_talk_url(@registered_talk)
    assert_response :success
  end

  test "should update registered_talk" do
    patch registered_talk_url(@registered_talk), params: { registered_talk: { speaker_id: @registered_talk.speaker_id, talk_id: @registered_talk.talk_id } }
    assert_redirected_to registered_talk_url(@registered_talk)
  end

  test "should destroy registered_talk" do
    assert_difference('RegisteredTalk.count', -1) do
      delete registered_talk_url(@registered_talk)
    end

    assert_redirected_to registered_talks_url
  end
end
