class DeviceConfigurationsController < ApplicationController
  before_action :set_device_configuration, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @device_configurations = DeviceConfiguration.all
    respond_with(@device_configurations)
  end

  def show
    respond_with(@device_configuration)
  end

  def new
    @device_configuration = DeviceConfiguration.new
    respond_with(@device_configuration)
  end

  def edit
  end

  def create
    @device_configuration = DeviceConfiguration.new(device_configuration_params)
    @device_configuration.save
    respond_with(@device_configuration)
  end

  def update
    @device_configuration.update(device_configuration_params)
    respond_with(@device_configuration)
  end

  def destroy
    @device_configuration.destroy
    respond_with(@device_configuration)
  end

  private
    def set_device_configuration
      @device_configuration = DeviceConfiguration.find(params[:id])
    end

    def device_configuration_params
      params.require(:device_configuration).permit(:name, :location, :module_type)
    end
end
