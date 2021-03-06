require 'test_helper'

class DealsControllerTest < ActionController::TestCase
  setup do
    @deal = deals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deal" do
    assert_difference('Deal.count') do

      post :create, deal: { billed_company: @deal.billed_company, offered_import: @deal.offered_import, operative_company: @deal.operative_company, protocol_number: @deal.protocol_number, real_import: @deal.real_import, shipment_mode: @deal.shipment_mode, status: @deal.status, user_id: @deal.user_id }

    end

    assert_redirected_to deal_path(assigns(:deal))
  end

  test "should show deal" do
    get :show, id: @deal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deal
    assert_response :success
  end

  test "should update deal" do

    put :update, id: @deal, deal: { billed_company: @deal.billed_company, offered_import: @deal.offered_import, operative_company: @deal.operative_company, protocol_number: @deal.protocol_number, real_import: @deal.real_import, shipment_mode: @deal.shipment_mode, status: @deal.status, user_id: @deal.user_id }

    assert_redirected_to deal_path(assigns(:deal))
  end

  test "should destroy deal" do
    assert_difference('Deal.count', -1) do
      delete :destroy, id: @deal
    end

    assert_redirected_to deals_path
  end
end
