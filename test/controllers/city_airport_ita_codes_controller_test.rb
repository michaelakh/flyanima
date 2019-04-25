require 'test_helper'

class CityAirportItaCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city_airport_ita_code = city_airport_ita_codes(:one)
  end

  test "should get index" do
    get city_airport_ita_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_city_airport_ita_code_url
    assert_response :success
  end

  test "should create city_airport_ita_code" do
    assert_difference('CityAirportItaCode.count') do
      post city_airport_ita_codes_url, params: { city_airport_ita_code: { airport: @city_airport_ita_code.airport, city: @city_airport_ita_code.city, code: @city_airport_ita_code.code, country: @city_airport_ita_code.country, searches: @city_airport_ita_code.searches } }
    end

    assert_redirected_to city_airport_ita_code_url(CityAirportItaCode.last)
  end

  test "should show city_airport_ita_code" do
    get city_airport_ita_code_url(@city_airport_ita_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_city_airport_ita_code_url(@city_airport_ita_code)
    assert_response :success
  end

  test "should update city_airport_ita_code" do
    patch city_airport_ita_code_url(@city_airport_ita_code), params: { city_airport_ita_code: { airport: @city_airport_ita_code.airport, city: @city_airport_ita_code.city, code: @city_airport_ita_code.code, country: @city_airport_ita_code.country, searches: @city_airport_ita_code.searches } }
    assert_redirected_to city_airport_ita_code_url(@city_airport_ita_code)
  end

  test "should destroy city_airport_ita_code" do
    assert_difference('CityAirportItaCode.count', -1) do
      delete city_airport_ita_code_url(@city_airport_ita_code)
    end

    assert_redirected_to city_airport_ita_codes_url
  end
end
