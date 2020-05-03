# frozen_string_literal: true

require 'application_responder'

class ApplicationController < ActionController::Base # :nodoc:
  self.responder = ApplicationResponder
  respond_to :html
end
