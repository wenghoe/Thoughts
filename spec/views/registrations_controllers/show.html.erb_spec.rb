require 'rails_helper'

RSpec.describe "registrations_controllers/show", type: :view do
  before(:each) do
    @registrations_controller = assign(:registrations_controller, RegistrationsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
