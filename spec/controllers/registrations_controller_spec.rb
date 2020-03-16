require 'rails_helper'
require_relative "../support/devise"

RSpec.describe RegistrationsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET #new" do
    subject { get :new }
    it "returns a success response" do
      expect(subject).to render_template(:new)
      expect(assigns(:user)).to be_a_new(User)
      expect(subject).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let!(:new_user) { build(:user) }

    context "with valid params" do
      subject { post :create, params: { user: attributes_for(:user) } }
      it "creates a new user" do
        expect{subject}.to change(User,:count).by(1)
        expect{subject}.to redirect_to(my_thoughts_path)
      end
    end

    context "with invalid params" do
      let!(:invalid_user) { build(:user, :invalid) }

      subject { post :create, params: { user: attributes_for(:invalid_user) } }
      it "returns a success response (i.e. to display the 'new' template)" do
        expect{subject}.to_not change(User,:count)
        expect(subject).to render_template(:new)
      end
    end
  end

end
