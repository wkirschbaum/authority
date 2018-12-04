require 'test_helper'

class AllowAllControllerTest < ActionDispatch::IntegrationTest
  test 'it throws an exception if allow was not set' do
    assert_raises(Authority::Error) { get '/' }
  end

  test 'it blocks the user if not allowed' do
    get '/allownotme'
    assert_response :redirect
  end
end
