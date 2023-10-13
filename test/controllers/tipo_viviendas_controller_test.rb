require "test_helper"

class TipoViviendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_vivienda = tipo_viviendas(:one)
  end

  test "should get index" do
    get tipo_viviendas_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_vivienda_url
    assert_response :success
  end

  test "should create tipo_vivienda" do
    assert_difference("TipoVivienda.count") do
      post tipo_viviendas_url, params: { tipo_vivienda: { nombre: @tipo_vivienda.nombre } }
    end

    assert_redirected_to tipo_vivienda_url(TipoVivienda.last)
  end

  test "should show tipo_vivienda" do
    get tipo_vivienda_url(@tipo_vivienda)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_vivienda_url(@tipo_vivienda)
    assert_response :success
  end

  test "should update tipo_vivienda" do
    patch tipo_vivienda_url(@tipo_vivienda), params: { tipo_vivienda: { nombre: @tipo_vivienda.nombre } }
    assert_redirected_to tipo_vivienda_url(@tipo_vivienda)
  end

  test "should destroy tipo_vivienda" do
    assert_difference("TipoVivienda.count", -1) do
      delete tipo_vivienda_url(@tipo_vivienda)
    end

    assert_redirected_to tipo_viviendas_url
  end
end
