require "test_helper"

class ViviendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vivienda = viviendas(:one)
  end

  test "should get index" do
    get viviendas_url
    assert_response :success
  end

  test "should get new" do
    get new_vivienda_url
    assert_response :success
  end

  test "should create vivienda" do
    assert_difference("Vivienda.count") do
      post viviendas_url, params: { vivienda: { direccion: @vivienda.direccion, superficie: @vivienda.superficie, user_id: @vivienda.user_id } }
    end

    assert_redirected_to vivienda_url(Vivienda.last)
  end

  test "should show vivienda" do
    get vivienda_url(@vivienda)
    assert_response :success
  end

  test "should get edit" do
    get edit_vivienda_url(@vivienda)
    assert_response :success
  end

  test "should update vivienda" do
    patch vivienda_url(@vivienda), params: { vivienda: { direccion: @vivienda.direccion, superficie: @vivienda.superficie, user_id: @vivienda.user_id } }
    assert_redirected_to vivienda_url(@vivienda)
  end

  test "should destroy vivienda" do
    assert_difference("Vivienda.count", -1) do
      delete vivienda_url(@vivienda)
    end

    assert_redirected_to viviendas_url
  end
end
