require 'rails_helper'

RSpec.describe "registrations_controllers/new", type: :view do
  before(:each) do
    assign(:registrations_controller, RegistrationsController.new())
  end

  it "renders new registrations_controller form" do
    render

    assert_select "form[action=?][method=?]", registrations_controllers_path, "post" do
    end
  end
end
