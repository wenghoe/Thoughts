require "rails_helper"

RSpec.describe RegistrationsControllersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/registrations_controllers").to route_to("registrations_controllers#index")
    end

    it "routes to #new" do
      expect(:get => "/registrations_controllers/new").to route_to("registrations_controllers#new")
    end

    it "routes to #show" do
      expect(:get => "/registrations_controllers/1").to route_to("registrations_controllers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/registrations_controllers/1/edit").to route_to("registrations_controllers#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/registrations_controllers").to route_to("registrations_controllers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/registrations_controllers/1").to route_to("registrations_controllers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/registrations_controllers/1").to route_to("registrations_controllers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/registrations_controllers/1").to route_to("registrations_controllers#destroy", :id => "1")
    end
  end
end
