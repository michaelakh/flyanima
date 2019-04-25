require 'test_helper'

class AirlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @airline = airlines(:one)
  end

  test "should get index" do
    get airlines_url
    assert_response :success
  end

  test "should get new" do
    get new_airline_url
    assert_response :success
  end

  test "should create airline" do
    assert_difference('Airline.count') do
      post airlines_url, params: { airline: { comments: @airline.comments, contact_link: @airline.contact_link, iata: @airline.iata, name: @airline.name, pet_info_link: @airline.pet_info_link, phone_no: @airline.phone_no } }
    end

    assert_redirected_to airline_url(Airline.last)
  end

  test "should show airline" do
    get airline_url(@airline)
    assert_response :success
  end

  test "should get edit" do
    get edit_airline_url(@airline)
    assert_response :success
  end

  test "should update airline" do
    patch airline_url(@airline), params: { airline: { comments: @airline.comments, contact_link: @airline.contact_link, iata: @airline.iata, name: @airline.name, pet_info_link: @airline.pet_info_link, phone_no: @airline.phone_no } }
    assert_redirected_to airline_url(@airline)
  end

  test "should destroy airline" do
    assert_difference('Airline.count', -1) do
      delete airline_url(@airline)
    end

    assert_redirected_to airlines_url
  end
end
