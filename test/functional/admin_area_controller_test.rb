require File.dirname(__FILE__) + '/../test_helper'
require 'admin_area_controller'

# Re-raise errors caught by the controller.
class AdminAreaController; def rescue_action(e) raise e end; end

class AdminAreaControllerTest < Test::Unit::TestCase
  def setup
    @controller = AdminAreaController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
