require 'rails_helper'
require_relative "../../support/devise"

RSpec.describe My::ThoughtsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET #index" do
    let!(:user) { create(:user, :with_thoughts) }
    before { sign_in user }

    subject { get :index }
    it "returns a success response" do
      expect(subject).to render_template(:index)
      expect(subject).to have_http_status(:success)
      expect(controller.current_user).to eq(user)
      expect(controller.current_user.thoughts.count).to eq(2)
    end
  end
end
