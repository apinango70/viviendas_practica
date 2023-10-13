require "application_system_test_case"

class ViviendasTest < ApplicationSystemTestCase
  setup do
    @vivienda = viviendas(:one)
  end

  test "visiting the index" do
    visit viviendas_url
    assert_selector "h1", text: "Viviendas"
  end

  test "should create vivienda" do
    visit viviendas_url
    click_on "New vivienda"

    fill_in "Direccion", with: @vivienda.direccion
    fill_in "Superficie", with: @vivienda.superficie
    fill_in "User", with: @vivienda.user_id
    click_on "Create Vivienda"

    assert_text "Vivienda was successfully created"
    click_on "Back"
  end

  test "should update Vivienda" do
    visit vivienda_url(@vivienda)
    click_on "Edit this vivienda", match: :first

    fill_in "Direccion", with: @vivienda.direccion
    fill_in "Superficie", with: @vivienda.superficie
    fill_in "User", with: @vivienda.user_id
    click_on "Update Vivienda"

    assert_text "Vivienda was successfully updated"
    click_on "Back"
  end

  test "should destroy Vivienda" do
    visit vivienda_url(@vivienda)
    click_on "Destroy this vivienda", match: :first

    assert_text "Vivienda was successfully destroyed"
  end
end
