require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper
  
  test "check routing number" do
    LineItem.delete_all
    Order.delete_all
    
    visit store_index_url
    
    click_on 'Add to Cart', match: :first
    click_on 'Checkout'

    fill_in 'order_name', with: 'Dave Thomas'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'dave@example.com'
    
    assert_no_selector "#order_routing_number"
    
    select 'Check', from: 'order[pay_type]'
    
    assert_selector "#order_routing_number"
  end
end
