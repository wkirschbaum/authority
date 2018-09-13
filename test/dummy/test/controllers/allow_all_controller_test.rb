require 'test_helper'

class AllowAllControllerTest < ActionDispatch::IntegrationTest
  test 'it throws an exception if allow was not set' do
    assert_raises(Authority::Error) { get '/' }
  end
end
