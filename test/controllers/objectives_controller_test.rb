require "test_helper"

class ObjectivesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def index
    @objectives = current_user.objectives
  end
end
