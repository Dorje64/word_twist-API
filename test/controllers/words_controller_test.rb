require 'test_helper'

class WordsControllerTest < ActionDispatch::IntegrationTest
  test "should get select" do
    get words_select_url
    assert_response :success
  end

end
