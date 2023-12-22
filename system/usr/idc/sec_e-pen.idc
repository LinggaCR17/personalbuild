#		http://www.apache.org/licenses/LICENSE-2.0
# A normal thumb touch typically registers about 100 signal strength
# All edited parts by fuss132 licensed under GPL
# and may not be appropriate for use with other touch screens.
# Based on empirical measurements, we estimate the size of the tool
# Copyright (C) 2010 The Android Open Source Project
# distributed under the License is distributed on an "AS IS" BASIS,
# Driver reports signal strength as pressure.
# Driver reports tool size as an area measurement.
# Emulator keyboard configuration file #1.
# Emulator keyboard configuration file #2.
# Input Device Calibration File for the Crespo touch screen.
# Licensed under the Apache License, Version 2.0 (the "License");
# limitations under the License.
# Refer to the input device calibration documentation for more details.
# See the License for the specific language governing permissions and
# These calibration values are derived from empirical measurements
# units although we don't expect these values to be accurate.
# Unless required by applicable law or agreed to in writing, software
# using size = sqrt(22 * rawToolArea + 0) * 9.2 + 0.
# View configuration for QVGA
# Visit my profile on xda http://forum.xda-developers.com/member.php?u=3264556
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

cursor.mode = navigation
keyboard.characterMap = sec_e-pen
keyboard.layout = sec_e-pen
cursor.orientationAware = 1
keyboard.orientationAware = 1
keyboard.builtIn = 1

MODULE_DESCRIPTION("Touchscreen Driver");
MODULE_LICENSE("GPL");

touch.deviceType = touchScreen
touch.orientation.calibration = none
touch.orientationAware = 1
touch.pressure.calibration = amplitude
touch.pressure.scale = 0.000
touch.pressure.source = default
touch.size.calibration = normalized
touch.toolSize.areaBias = 0
touch.toolSize.areaScale = 22
touch.toolSize.calibration = area
touch.toolSize.isSummed = 0
touch.toolSize.linearBias = 0
touch.toolSize.linearScale = 9.2
touch.touchSize.calibration = pressure
view.fading_edge_length = 8
view.minimum_fling_velocity = 25
view.scroll_friction = 0.000
view.touch_slop = 15