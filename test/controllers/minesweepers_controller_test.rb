require "test_helper"

class MinesweepersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minesweeper = minesweepers(:one)
  end

  test "should get index" do
    get minesweepers_url
    assert_response :success
  end

  test "should get new" do
    get new_minesweeper_url
    assert_response :success
  end

  test "should create minesweeper" do
    assert_difference("Minesweeper.count") do
      post minesweepers_url, params: { minesweeper: { email: @minesweeper.email, height: @minesweeper.height, mines: @minesweeper.mines, name: @minesweeper.name, width: @minesweeper.width } }
    end

    assert_redirected_to minesweeper_url(Minesweeper.last)
  end

  test "should show minesweeper" do
    get minesweeper_url(@minesweeper)
    assert_response :success
  end

  test "should get edit" do
    get edit_minesweeper_url(@minesweeper)
    assert_response :success
  end

  test "should update minesweeper" do
    patch minesweeper_url(@minesweeper), params: { minesweeper: { email: @minesweeper.email, height: @minesweeper.height, mines: @minesweeper.mines, name: @minesweeper.name, width: @minesweeper.width } }
    assert_redirected_to minesweeper_url(@minesweeper)
  end

  test "should destroy minesweeper" do
    assert_difference("Minesweeper.count", -1) do
      delete minesweeper_url(@minesweeper)
    end

    assert_redirected_to minesweepers_url
  end
end
