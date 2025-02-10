/* Copyright 2019 Thomas Baart <thomas@splitkb.com>
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
//#include MKYRIA_H
#include QMK_KEYBOARD_H
#include "keymap_steno.h"
#include "quantum.h"
#include "raw_hid.h"

enum layers {
    _MTGAP = 0,
};

// void matrix_init_user() {
  // steno_set_mode(STENO_MODE_GEMINI); // or STENO_MODE_BOLT
// }

enum custom_keycodes {
    KC_??? = SAFE_RANGE,
};

// Aliases for readability
#define MTGAP    TO(_MTGAP)

// clang-format off
const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

    [_MTGAP] = LAYOUT(
     _______,  KC_Y  ,  KC_P  ,  KC_O  ,  KC_U  ,  KC_J  ,                                      KC_K  ,  KC_D  ,  KC_L  ,  KC_C  ,  KC_W  , _______,
     _______,  KC_I  ,  KC_N  ,  KC_E  ,  KC_A  , KC_DOT ,                                      KC_M  ,  KC_H  ,  KC_T  ,  KC_S  ,  KC_R  , _______,
     _______,  KC_Q  ,  KC_Z  , KC_QUOT, KC_COMM, KC_SCLN, _______, _______, _______, _______,  KC_B  ,  KC_F  ,  KC_G  ,  KC_V  ,  KC_X  , _______,
                                _______, _______, nav pad, KC_SPC , mirror, _______, KC_BSPC, _______, _______, _______
    ),

	[_NPAD] = LAYOUT(
      _______, _______, _______, _______, _______, _______,                                     _______, _______, _______, _______, _______, _______,
      _______, _______, _______, _______, _______, _______,                                     _______, _______, _______, _______, _______, _______,
      _______, _______, _______, _______, _______, _______, tg sym , _______, _______, _______, _______, _______, _______, _______, _______, _______,
                                 _______, _______, nav pad, _______, mirnopad, _______, _______, _______, _______, _______
    ),
	
	
// /*
//  * Layer template
//  *
//  * ,-------------------------------------------.                              ,-------------------------------------------.
//  * |        |      |      |      |      |      |                              |      |      |      |      |      |        |
//  * |--------+------+------+------+------+------|                              |------+------+------+------+------+--------|
//  * |        |      |      |      |      |      |                              |      |      |      |      |      |        |
//  * |--------+------+------+------+------+------+-------------.  ,-------------+------+------+------+------+------+--------|
//  * |        |      |      |      |      |      |      |      |  |      |      |      |      |      |      |      |        |
//  * `----------------------+------+------+------+------+------|  |------+------+------+------+------+----------------------'
//  *                        |      |      |      |      |      |  |      |      |      |      |      |
//  *                        `----------------------------------'  `----------------------------------'
//  */
//     [_LAYERINDEX] = LAYOUT(
//       _______, _______, _______, _______, _______, _______,                                     _______, _______, _______, _______, _______, _______,
//       _______, _______, _______, _______, _______, _______,                                     _______, _______, _______, _______, _______, _______,
//       _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
//                                  _______, _______, _______, _______, _______, _______, _______, _______, _______, _______
//     ),
};

void raw_hid_receive(uint8_t *data, uint8_t length) {
    uint8_t *command_id = &(data[0]);
    switch (*command_id) {
        case 0:
          layer_on(_GAMING);
          break;
        case 1:
          layer_off(_GAMING);
          break;
		case 2:
          layer_on(_RARW);
          break;
		case 3:
          layer_off(_RARW);
          break;
	}
}