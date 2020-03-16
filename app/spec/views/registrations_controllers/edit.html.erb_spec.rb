require 'rails_helper'

RSpec.describe "registrations_controllers/edit", type: :view do
  before(:each) do
    @registrations_controller = assign(:registrations_controller, RegistrationsController.create!())
  end

  it "renders the edit registrations_controller form" do
    render

    assert_select "form[action=?][method=?]", registrations_controller_path(@registrations_controller), "post" do
    end
  end
end
