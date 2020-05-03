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

class DeviceConfiguration < ApplicationRecord
  enum module_type: {
    'Sonoff Basic'   => 1,
    'Sonoff RF'      => 2,
    'Sonoff SV'      => 3,
    'Sonoff TH'      => 4,
    'Sonoff Dual'    => 5,
    'Sonoff Pow'     => 6,
    'Sonoff 4CH'     => 7,
    'Sonoff S2X'     => 8,
    'Slampher'       => 9,
    'Sonoff Touch'   => 10,
    'Sonoff LED'     => 11,
    '1 Channel'      => 12,
    '4 Channel'      => 13,
    'Motor C/AC'     => 14,
    'ElectroDragon'  => 15,
    'EXS Relay(s)'   => 16,
    'WiOn'           => 17,
    'Generic'        => 18,
    'Sonoff Dev'     => 19,
    'H801'           => 20,
    'Sonoff SC'      => 21,
    'Sonoff BN-SZ'   => 22,
    'Sonoff 4CH Pro' => 23,
    'Huafan SS'      => 24,
    'Sonoff Bridge'  => 25,
    'Sonoff B1'      => 26,
    'AiLight'        => 27,
    'Sonoff T1 1CH'  => 28,
    'Sonoff T1 2CH'  => 29,
    'Sonoff T1 3CH'  => 30,
    'Supla Espablo'  => 31,
    'Witty Cloud'    => 32,
    'Yunshan Relay'  => 33,
    'MagicHome'      => 34,
    'Luani HVIO'     => 35,
    'KMC 70011'      => 36,
    'Arilux LC01'    => 37,
    'Arilux LC11'    => 38,
    'Sonoff Dual R2' => 39,
    'Arilux LC06'    => 40,
    'Sonoff S31'     => 41,
    'Zengge WF017'   => 42,
    'Sonoff Pow R2'  => 43,
    'Sonoff iFan02'  => 44,
    'BlitzWolf SHP'  => 45,
    'Shelly 1'       => 46,
    'Shelly 2'       => 47,
    'Xiaomi Philips' => 48,
    'Neo Coolcam'    => 49,
    'ESP Switch'     => 50,
    'OBI Socket'     => 51,
    'Teckin'         => 52,
    'AplicWDP303075' => 53,
    'Tuya MCU'       => 54,
    'Gosund SP1 v23' => 55,
    'ARMTR Dimmer'   => 56,
    'SK03 Outdoor'   => 57,
    'PS-16-DZ'       => 58,
    'Teckin US'      => 59,
    'Manzoku strip'  => 60,
    'OBI Socket 2'   => 61,
    'YTF IR Bridge'  => 62,
    'Digoo DG-SP202' => 63,
    'KA10'           => 64,
    'Luminea ZX2820' => 65,
    'SP10'           => 67,
    'WAGA CHCZ02MB'  => 68,
    'SYF05'          => 69,
    'Sonoff L1'      => 70,
    'Sonoff iFan03'  => 71,
    'EXS Dimmer'     => 72,
    'PWM Dimmer'     => 73,
    'Sonoff D1'      => 74
  }
end
