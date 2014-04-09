require 'test_helper'

class RideControllerTest < ActionController::TestCase

  #this will fail until the Ride/index view is created
  test "should get index" do
    get :index
    assert_response :success
  end

  #this will fail until the Ride/new view is created
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ride" do
    assert_difference('Ride.count') do
      post :create, :ride => {Driver_ID: 1,Start_Address: '921 2nd Ave. Eau Claire WI', End_Address: '1007 2nd Ave. Eau Claire WI', Time: Time.now}
    end
  end

end
