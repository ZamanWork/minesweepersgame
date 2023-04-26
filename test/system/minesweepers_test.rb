require "application_system_test_case"

class MinesweepersTest < ApplicationSystemTestCase
  setup do
    @minesweeper = minesweepers(:one)
  end

  test "visiting the index" do
    visit minesweepers_url
    assert_selector "h1", text: "Minesweepers"
  end

  test "should create minesweeper" do
    visit minesweepers_url
    click_on "New minesweeper"

    fill_in "Email", with: @minesweeper.email
    fill_in "Height", with: @minesweeper.height
    fill_in "Mines", with: @minesweeper.mines
    fill_in "Name", with: @minesweeper.name
    fill_in "Width", with: @minesweeper.width
    click_on "Create Minesweeper"

    assert_text "Minesweeper was successfully created"
    click_on "Back"
  end

  test "should update Minesweeper" do
    visit minesweeper_url(@minesweeper)
    click_on "Edit this minesweeper", match: :first

    fill_in "Email", with: @minesweeper.email
    fill_in "Height", with: @minesweeper.height
    fill_in "Mines", with: @minesweeper.mines
    fill_in "Name", with: @minesweeper.name
    fill_in "Width", with: @minesweeper.width
    click_on "Update Minesweeper"

    assert_text "Minesweeper was successfully updated"
    click_on "Back"
  end

  test "should destroy Minesweeper" do
    visit minesweeper_url(@minesweeper)
    click_on "Destroy this minesweeper", match: :first

    assert_text "Minesweeper was successfully destroyed"
  end
end
