# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Application root', type: :routing do
  describe 'routing' do
    it 'routes root path' do
      expect(get: '/').to route_to('patients#index')
    end
  end
end
