require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  test "check routing number" do
    LineItem.delete_all
    Order.delete_all
    
    visit store_index_url
    
    first('.catalog li').click_on 'Add to Cart'
    click_on 'Checkout'

    fill_in 'Name',     with: 'Dave Thomas'
    fill_in 'Address',  with: '123 Main Street'
    fill_in 'Email',    with: 'dave@example.com'
    
    #assert_no_selector "#order_routing_number[hidden]"
    #assert_selector "#order_routing_number[hidden]"
    
    select 'Check', from: 'Pay type'
    
    assert_selector "#order_routing_number:not([hidden])"
  end
end
