require File.dirname(__FILE__) + '/../test_helper'
require 'awards_controller'

# Re-raise errors caught by the controller.
class AwardsController; def rescue_action(e) raise e end; end

class AwardsControllerTest < Test::Unit::TestCase
  def setup
    @controller = AwardsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
