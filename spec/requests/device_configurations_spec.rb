 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/device_configurations", type: :request do
  # DeviceConfiguration. As you add validations to DeviceConfiguration, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      DeviceConfiguration.create! valid_attributes
      get device_configurations_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      device_configuration = DeviceConfiguration.create! valid_attributes
      get device_configuration_url(device_configuration)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_device_configuration_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      device_configuration = DeviceConfiguration.create! valid_attributes
      get edit_device_configuration_url(device_configuration)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new DeviceConfiguration" do
        expect {
          post device_configurations_url, params: { device_configuration: valid_attributes }
        }.to change(DeviceConfiguration, :count).by(1)
      end

      it "redirects to the created device_configuration" do
        post device_configurations_url, params: { device_configuration: valid_attributes }
        expect(response).to redirect_to(device_configuration_url(DeviceConfiguration.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new DeviceConfiguration" do
        expect {
          post device_configurations_url, params: { device_configuration: invalid_attributes }
        }.to change(DeviceConfiguration, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post device_configurations_url, params: { device_configuration: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested device_configuration" do
        device_configuration = DeviceConfiguration.create! valid_attributes
        patch device_configuration_url(device_configuration), params: { device_configuration: new_attributes }
        device_configuration.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the device_configuration" do
        device_configuration = DeviceConfiguration.create! valid_attributes
        patch device_configuration_url(device_configuration), params: { device_configuration: new_attributes }
        device_configuration.reload
        expect(response).to redirect_to(device_configuration_url(device_configuration))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        device_configuration = DeviceConfiguration.create! valid_attributes
        patch device_configuration_url(device_configuration), params: { device_configuration: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested device_configuration" do
      device_configuration = DeviceConfiguration.create! valid_attributes
      expect {
        delete device_configuration_url(device_configuration)
      }.to change(DeviceConfiguration, :count).by(-1)
    end

    it "redirects to the device_configurations list" do
      device_configuration = DeviceConfiguration.create! valid_attributes
      delete device_configuration_url(device_configuration)
      expect(response).to redirect_to(device_configurations_url)
    end
  end
end
