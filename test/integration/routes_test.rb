require 'test_helper'

#change these tests when more custom routes are decided
#ie ride/index => rides
class RoutesTest < ActionDispatch::IntegrationTest
  
  ############################ Ride Controller ############################
  
  test "has route ride/index" do
    assert_recognizes({ controller: 'ride', action: 'index' }, { path: 'ride', method: :get })
  end
  
  test "has route ride/show/:id" do
    assert_recognizes({ controller: 'ride', action: 'show', id: '1' }, '/ride/1')
  end
  
  #change to ride/new?
  test "has route ride/create" do
    assert_recognizes({ controller: 'ride', action: 'create' }, { path: 'ride', method: :post })    
  end
  
  test "has route /ride/search/:search" do
    assert_generates "/ride/search/searchquery", { :controller => "ride", :action => "search", :search => "searchquery" }       
  end
  ############################ Index Controller ############################
end