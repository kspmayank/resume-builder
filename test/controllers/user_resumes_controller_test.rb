require 'test_helper'

class UserResumesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_resume = user_resumes(:one)
  end

  test "should get index" do
    get user_resumes_url
    assert_response :success
  end

  test "should get new" do
    get new_user_resume_url
    assert_response :success
  end

  test "should create user_resume" do
    assert_difference('UserResume.count') do
      post user_resumes_url, params: { user_resume: { content: @user_resume.content, template: @user_resume.template, user_id: @user_resume.user_id } }
    end

    assert_redirected_to user_resume_url(UserResume.last)
  end

  test "should show user_resume" do
    get user_resume_url(@user_resume)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_resume_url(@user_resume)
    assert_response :success
  end

  test "should update user_resume" do
    patch user_resume_url(@user_resume), params: { user_resume: { content: @user_resume.content, template: @user_resume.template, user_id: @user_resume.user_id } }
    assert_redirected_to user_resume_url(@user_resume)
  end

  test "should destroy user_resume" do
    assert_difference('UserResume.count', -1) do
      delete user_resume_url(@user_resume)
    end

    assert_redirected_to user_resumes_url
  end
end
