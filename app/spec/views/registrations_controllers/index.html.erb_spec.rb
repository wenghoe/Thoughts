require 'rails_helper'

RSpec.describe "registrations_controllers/index", type: :view do
  before(:each) do
    assign(:registrations_controllers, [
      RegistrationsController.create!(),
      RegistrationsController.create!()
    ])
  end

  it "renders a list of registrations_controllers" do
    render
  end
end
