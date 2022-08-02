/* Copyright 2018 MechMerlin
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

// place overrides here
#define USB_POLLING_INTERVAL_MS 1
#define QMK_KEYS_PER_SCAN 24
#define FORCE_NKRO
#define RGBLIGHT_SLEEP
#define RGBLIGHT_LAYERS
#define TAPPING_TOGGLE 3
#define LCPO_KEYS KC_LSFT, KC_TRNS, KC_LBRC
#define RCPC_KEYS KC_RSFT, KC_TRNS, KC_RBRC
// #define MOUSEKEY_INTERVAL 16

// #define MOUSEKEY_DELAY 0

// #define MOUSEKEY_TIME_TO_MAX 60

// #define MOUSEKEY_MAX_SPEED 5

// #define MOUSEKEY_WHEEL_DELAY 0

#define MK_3_SPEED
#define MK_MOMENTARY_ACCEL
