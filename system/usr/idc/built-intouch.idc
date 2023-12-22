# Copyright (C) 2023 The Silencer Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#		http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Marlin
# https://android.googlesource.com/device/google/marlin/+/refs/heads/android10-c2f2-release/synaptics_dsxv26.idc
device.internal = 1
touch.deviceType = touchScreen
touch.orientationAware = 1
touch.size.calibration = diameter
touch.size.scale = 60.216953
touch.size.bias = -60.108793
touch.size.isSummed = 0
touch.pressure.calibration = amplitude
touch.pressure.scale = 0.0125
touch.orientation.calibration = none

# Taimen
# https://android.googlesource.com/device/google/taimen/+/refs/heads/master/touchscreen.idc
device.internal = 1
touch.deviceType = touchScreen
touch.orientationAware = 1
touch.size.calibration = diameter
touch.size.scale = 1.045690
touch.size.bias = -13.924837
touch.size.isSummed = 0
touch.pressure.calibration = amplitude
touch.pressure.scale = 0.0125
touch.orientation.calibration = none

# Walleye
device.internal = 1
touch.deviceType = touchScreen
touch.orientationAware = 1
touch.filter.level=0

# Size
touch.size.calibration = diameter
touch.size.scale = 42.086933
touch.size.bias = -21.905636
touch.toolSize.isSummed = 0

# Pressure
# Driver reports signal strength as pressure.
#
# A normal thumb touch typically registers about 100 signal strength
# units although we don't expect these values to be accurate.
touch.pressure.calibration = amplitude
touch.pressure.scale = 0.0125

# Orientation
touch.orientation.calibration = none
touch.distance.calibration = none
touch.distance.scale = 0

# @Titidebin
device.internal = 1
touch.deviceType = touchScreen
touch.orientationAware = 1
touch.filter.level=2

# Size
touch.size.calibration = diameter
touch.size.scale = 1.011925
touch.size.bias = -11.988075
touch.toolSize.isSummed = 0

# Pressure
touch.pressure.calibration = physical
touch.pressure.scale = 0.001

# Orientation
touch.orientation.calibration = none
touch.distance.calibration = none
touch.distance.scale = 0.001

# @WeAreRavenS
device.internal = 1
touch.deviceType = touchScreen
touch.orientationAware = 1
touch.filter.level=0

# Size
touch.size.calibration = diameter
touch.size.scale = 1
touch.size.bias = 0
touch.size.isSummed = 0

# Pressure
touch.pressure.calibration = physical
touch.pressure.scale = 0.001

# Orientation
touch.orientation.calibration = none
touch.distance.calibration = none
touch.distance.scale = 0
touch.coverage.calibration = none