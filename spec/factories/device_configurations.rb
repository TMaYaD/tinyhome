# frozen_string_literal: true

# == Schema Information
#
# Table name: device_configurations
#
#  id          :integer          not null, primary key
#  name        :string
#  location    :string
#  module_type :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :device_configuration do
    name { 'MyString' }
    location { 'MyString' }
    module_type { 1 }
  end
end
