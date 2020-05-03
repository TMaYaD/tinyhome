require "rails_helper"

RSpec.describe DeviceConfigurationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/device_configurations").to route_to("device_configurations#index")
    end

    it "routes to #new" do
      expect(get: "/device_configurations/new").to route_to("device_configurations#new")
    end

    it "routes to #show" do
      expect(get: "/device_configurations/1").to route_to("device_configurations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/device_configurations/1/edit").to route_to("device_configurations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/device_configurations").to route_to("device_configurations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/device_configurations/1").to route_to("device_configurations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/device_configurations/1").to route_to("device_configurations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/device_configurations/1").to route_to("device_configurations#destroy", id: "1")
    end
  end
end
