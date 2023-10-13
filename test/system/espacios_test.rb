require "application_system_test_case"

class EspaciosTest < ApplicationSystemTestCase
  setup do
    @espacio = espacios(:one)
  end

  test "visiting the index" do
    visit espacios_url
    assert_selector "h1", text: "Espacios"
  end

  test "should create espacio" do
    visit espacios_url
    click_on "New espacio"

    fill_in "Nombre", with: @espacio.nombre
    click_on "Create Espacio"

    assert_text "Espacio was successfully created"
    click_on "Back"
  end

  test "should update Espacio" do
    visit espacio_url(@espacio)
    click_on "Edit this espacio", match: :first

    fill_in "Nombre", with: @espacio.nombre
    click_on "Update Espacio"

    assert_text "Espacio was successfully updated"
    click_on "Back"
  end

  test "should destroy Espacio" do
    visit espacio_url(@espacio)
    click_on "Destroy this espacio", match: :first

    assert_text "Espacio was successfully destroyed"
  end
end
