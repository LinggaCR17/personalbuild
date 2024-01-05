# Copyright (C) 2010 The Android Open Source Project
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

# Emulator keyboard configuration file #2.
#
touch.deviceType = touchScreen
touch.orientationAware = 1

keyboard.layout = qwerty2
keyboard.characterMap = qwerty2
keyboard.orientationAware = 1
keyboard.builtIn = 1

cursor.mode = navigation
cursor.orientationAware = 1

MODULE_DESCRIPTION("Touchscreen Driver");
MODULE_LICENSE("GPL");

# Touch Size
touch.touchSize.calibration = pressure

# Tool Size
# Driver reports tool size as an area measurement.
#
# Based on empirical measurements, we estimate the size of the tool
# using size = sqrt(22 * rawToolArea + 0) * 9.2 + 0.
touch.toolSize.calibration = area
touch.toolSize.areaScale = 22
touch.toolSize.areaBias = 0
touch.toolSize.linearScale = 9.2
touch.toolSize.linearBias = 0
touch.toolSize.isSummed = 0

# Pressure
# Driver reports signal strength as pressure.
#
# A normal thumb touch typically registers about 100 signal strength
# units although we don't expect these values to be accurate.
touch.pressure.calibration = amplitude
touch.pressure.source = default
touch.pressure.scale = 0.000

# Size
touch.size.calibration = normalized

# Orientation
touch.orientation.calibration = none
