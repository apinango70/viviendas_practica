require "application_system_test_case"

class TipoViviendasTest < ApplicationSystemTestCase
  setup do
    @tipo_vivienda = tipo_viviendas(:one)
  end

  test "visiting the index" do
    visit tipo_viviendas_url
    assert_selector "h1", text: "Tipo viviendas"
  end

  test "should create tipo vivienda" do
    visit tipo_viviendas_url
    click_on "New tipo vivienda"

    fill_in "Nombre", with: @tipo_vivienda.nombre
    click_on "Create Tipo vivienda"

    assert_text "Tipo vivienda was successfully created"
    click_on "Back"
  end

  test "should update Tipo vivienda" do
    visit tipo_vivienda_url(@tipo_vivienda)
    click_on "Edit this tipo vivienda", match: :first

    fill_in "Nombre", with: @tipo_vivienda.nombre
    click_on "Update Tipo vivienda"

    assert_text "Tipo vivienda was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo vivienda" do
    visit tipo_vivienda_url(@tipo_vivienda)
    click_on "Destroy this tipo vivienda", match: :first

    assert_text "Tipo vivienda was successfully destroyed"
  end
end
