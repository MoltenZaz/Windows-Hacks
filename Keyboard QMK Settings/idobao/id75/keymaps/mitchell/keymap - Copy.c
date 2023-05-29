#include QMK_KEYBOARD_H
#include "keymap_steno.h"

#define _LAYER0 0
#define _FRENCH 1
#define _LAYER2 2
#define _LAYER3 3
#define _LAYER4 4
#define _LAYER5 5
#define _LAYER6 6
#define _LAYER7 7
#define _LAYER8 8
#define _LAYER9 9
#define _PLOVER 10
#define _LAYER11 11
#define _LAYER12 12
#define _LAYER13 13
#define _LAYER14 14
#define _LAYER15 15
#define _LAYER16 16
#define RGBLIGHT_EFFECT_STATIC_GRADIENT

// enum {
	// M_DV = SAFE_RANGE,
	// M_QW,
// };
enum custom_keycodes {
    LAYER0 = SAFE_RANGE,
    FRENCH,
    LAYER2,
    LAYER3,
    LAYER4,
    LAYER5,
    LAYER6,
    LAYER7,
	LAYER8,
	LAYER9,
	PLOVER,
	LAYER11,
	LAYER12,
	LAYER13,
	LAYER14,
	LAYER15,
	LAYER16
};

enum unicode_names {
	FCEDILLAC,
	FCEDILLACC,
	FACCUTEE,
	FACCUTEEC,
	FCIRCUMFLEXA,
	FCIRCUMFLEXAC,
	FCIRCUMFLEXE,
	FCIRCUMFLEXEC,
	FCIRCUMFLEXI,
	FCIRCUMFLEXIC,
	FCIRCUMFLEXO,
	FCIRCUMFLEXOC,
	FCIRCUMFLEXU,
	FCIRCUMFLEXUC,
	FGRAVEA,
	FGRAVEAC,
	FGRAVEE,
	FGRAVEEC,
	FGRAVEU,
	FGRAVEUC,
	FDIERESISE,
	FDIERESISEC,
	FDIERESISI,
	FDIERESISIC,
	FDIERESISU,
	FDIERESISUC,
	FDIERESISY,
	FDIERESISYC,
	FLIGATUREOE,
	FLIGATUREOEC,
	FLIGATUREAE,
	FLIGATUREAEC
};

const uint32_t PROGMEM unicode_map[] = {
	[FCEDILLAC] = 0x00E7, // ç
	[FCEDILLACC] = 0x00C7, // Ç
	[FACCUTEE] = 0x00E9, // é
	[FACCUTEEC] = 0x00C9, // É
	[FCIRCUMFLEXA] = 0x00E2, // â
	[FCIRCUMFLEXAC] = 0x00C2, // Â
	[FCIRCUMFLEXE] = 0x00EA, // ê
	[FCIRCUMFLEXEC] = 0x00CA, // Ê
	[FCIRCUMFLEXI] = 0x00EE, // î
	[FCIRCUMFLEXIC] = 0x00CE, // Î
	[FCIRCUMFLEXO] = 0x00F4, // ô
	[FCIRCUMFLEXOC] = 0x00D4, // Ô
	[FCIRCUMFLEXU] = 0x00FB, // û
	[FCIRCUMFLEXUC] = 0x00DB, // Û
	[FGRAVEA] = 0x00E0, // à
	[FGRAVEAC] = 0x00C0, // À
	[FGRAVEE] = 0x00E8, // è
	[FGRAVEEC] = 0x00C8, // È
	[FGRAVEU] = 0x00F9, // ù
	[FGRAVEUC] = 0x00D9, // Ù
	[FDIERESISE] = 0x00EB, // ë
	[FDIERESISEC] = 0x00CB, // Ë
	[FDIERESISI] = 0x00EF, // ï
	[FDIERESISIC] = 0x00CF, // Ï
	[FDIERESISU] = 0x00FC, // ü
	[FDIERESISUC] = 0x00DC, // Ü
	[FDIERESISY] = 0x00FF, // ÿ
	[FDIERESISYC] = 0x0178, // Ÿ
	[FLIGATUREOE] = 0x0153, // œ
	[FLIGATUREOEC] = 0x0152, // Œ
	[FLIGATUREAE] = 0x00E6, // æ
	[FLIGATUREAEC] = 0x00C6 // Æ
};

void matrix_init_user() {
  steno_set_mode(STENO_MODE_GEMINI); // or STENO_MODE_BOLT
}

 const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

[_LAYER0] = LAYOUT_ortho_5x15(
KC_ESC,           KC_1,            KC_2,            KC_3,   KC_4,   KC_5,   TO(0),   TG(1),  KC_SLEP,  KC_6,    KC_7,    KC_8,  KC_9,            KC_0,   KC_DEL,  \
KC_TAB,           KC_QUOT,         KC_COMM,         KC_DOT, KC_P,   KC_Y,   KC_HOME, KC_BSLS, KC_PGUP, KC_F,    KC_G,    KC_C,  KC_R,            KC_L,   KC_SLSH, \
KC_MINS,          KC_A,            KC_O,            KC_E,   KC_U,   KC_I,   KC_END,  KC_UP,   KC_PGDN, KC_D,    KC_H,    KC_T,  KC_N,            KC_S,   KC_ENT,  \
KC_LSPO,          KC_SCLN,         KC_Q,            KC_J,   KC_K,   KC_X,   KC_LEFT, KC_DOWN, KC_RGHT, KC_B,    KC_M,    KC_W,  KC_V,            KC_Z,   KC_RSPC, \
LM(2, MOD_LCTL),  LM(2, MOD_LGUI), LM(2, MOD_LALT), TT(5),  KC_SPC, KC_SPC, TT(4),   TG(2),   MO(6),   KC_BSPC, KC_BSPC, TT(7), LM(2, MOD_RALT), KC_APP, LM(2, MOD_RCTL)  \
),

[_FRENCH] = LAYOUT_ortho_5x15(
KC_ESC,           KC_1,					 KC_2,            		  KC_3,   KC_4,   					 KC_5,	  				TO(0),   TG(1),   KC_SLEP, KC_6, 	KC_7,    KC_8,	 KC_9,			  KC_0,   KC_DEL,  		  \
KC_TAB,           KC_B,					 XP(FACCUTEE, FACCUTEEC), KC_P,   KC_O,	  					 XP(FGRAVEE, FGRAVEEC), KC_HOME, KC_BSLS, KC_PGUP, KC_W,    KC_V,    KC_D,	 KC_L,			  KC_J,   KC_SLSH, 	 	  \
KC_QUOT,          KC_A,					 KC_U,            		  KC_I,   KC_E,   					 KC_M,	  				KC_END,  KC_UP,   KC_PGDN, KC_C,    KC_T,    KC_S,	 KC_R,			  KC_N,   KC_ENT,  		  \
KC_LSPO,          XP(FGRAVEA, FGRAVEAC), KC_Y,            		  KC_X,   XP(FCEDILLAC, FCEDILLACC), KC_K,	  				KC_LEFT, KC_DOWN, KC_RGHT, KC_Z,    KC_Q,    KC_G,   KC_H,			  KC_F,   KC_RSPC, 		  \
LM(2, MOD_LCTL),  LM(2, MOD_LGUI), 		 LM(2, MOD_LALT), 		  TT(5),  KC_SPC, 					 KC_SPC, 				TT(4),   TG(2),   MO(14),  KC_BSPC, MO(15),  MO(16), LM(2, MOD_RALT), KC_APP, LM(2, MOD_RCTL)  \
),

[_LAYER2] = LAYOUT_ortho_5x15(
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, TO(0),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_TRNS, KC_TRNS, KC_TRNS, KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_QUOT, \
KC_CAPS, KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_TRNS, KC_TRNS, KC_TRNS, KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_TRNS, \
KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_TRNS, KC_TRNS, KC_TRNS, KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT, \
KC_LCTL, KC_LGUI, KC_LALT, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_RALT, KC_TRNS, KC_RCTL  \
),

[_LAYER3] = LAYOUT_ortho_5x15(
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, TO(0),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_LSFT, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_RSFT, \
KC_LCTL, KC_LGUI, KC_LALT, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_DEL,  KC_TRNS, KC_RALT, KC_TRNS, KC_RCTL  \
),

[_LAYER4] = LAYOUT_ortho_5x15(
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, TO(0),   KC_TRNS, KC_TRNS, KC_TRNS, KC_NLCK, KC_PSLS, KC_PAST, KC_PMNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS, KC_UP,   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_P7,   KC_P8,   KC_P9,   KC_PPLS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_LEFT, KC_DOWN, KC_RGHT, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_P4,   KC_P5,   KC_P6,   KC_PPLS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_P1,   KC_P2,   KC_P3,   KC_PENT, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, TG(10),   KC_TRNS, KC_TRNS, KC_P0,   KC_P0,   KC_PDOT, KC_TRNS, KC_TRNS  \
),

[_LAYER5] = LAYOUT_ortho_5x15(
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, TO(0),   RGB_SPD,  RGB_SPI, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_MUTE, KC_VOLD, KC_VOLU, KC_TRNS, RGB_TOG, RGB_RMOD, RGB_MOD, KC_TRNS, KC_WH_U, KC_MS_U, KC_WH_D, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_MPRV, KC_MPLY, KC_MNXT, KC_TRNS, RGB_HUI, RGB_SAI,  RGB_VAI, KC_TRNS, KC_MS_L, KC_MS_D, KC_MS_R, KC_ACL2, KC_BTN2, \
KC_ACL2, KC_MAIL, KC_CALC, KC_MSEL, KC_MYCM, KC_TRNS, RGB_HUD, RGB_SAD,  RGB_VAD, KC_TRNS, KC_BTN4, KC_BTN3, KC_BTN5, KC_ACL1, KC_ACL2, \
KC_ACL1, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, TG(3),    KC_TRNS, KC_BTN1, KC_BTN1, MO(8), KC_TRNS, KC_TRNS, KC_ACL0  \
),

[_LAYER6] = LAYOUT_ortho_5x15(
KC_TRNS, KC_F1,   						KC_F2,   					    KC_F3,   			     KC_F4,   KC_F5,   TO(0),   KC_TRNS, KC_TRNS, KC_F6,   KC_F7,   KC_F8,   					KC_F9,   KC_F10,  KC_F11,  \
KC_TRNS, XP(FLIGATUREAE, FLIGATUREAEC),	XP(FLIGATUREOE, FLIGATUREOEC),  KC_TRNS, 			     KC_TRNS, KC_TRNS, KC_TRNS, KC_PAUS, KC_TRNS, KC_TRNS, KC_TRNS, XP(FCEDILLAC, FCEDILLACC),  KC_TRNS, KC_TRNS, KC_F12,  \
KC_GRV,  KC_EXLM, 						KC_AT,  						XP(FACCUTEE, FACCUTEEC), KC_DLR,  KC_PERC, KC_TRNS, KC_SLCK, KC_TRNS, KC_CIRC, KC_AMPR, KC_ASTR, 					KC_MINS, KC_EQL,  KC_TRNS, \
KC_LCPO, KC_TRNS, 						KC_TRNS, 						KC_LBRC, 			     KC_LCBR, KC_LPRN, KC_TRNS, KC_INS,  KC_TRNS, KC_RPRN, KC_RCBR, KC_RBRC, 					KC_TRNS, KC_TRNS, KC_RCPC, \
KC_TRNS, KC_TRNS, 						KC_TRNS, 						KC_TRNS, 			     KC_TRNS, KC_TRNS, KC_TRNS, TG(10),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, 					MO(12),  MO(11),  MO(13)   \
),

[_LAYER7] = LAYOUT_ortho_5x15(
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, TO(0),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_UP,   KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_LEFT, KC_DOWN, KC_RGHT, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, TG(3),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS  \
),

[_LAYER8] = LAYOUT_ortho_5x15(
KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, TO(0), KC_TRNS,  KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, \
KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_SLEP,  KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, \
KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_PAUSE, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, \
KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,    KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, \
KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, MO(9),    KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO  \
),

[_LAYER9] = LAYOUT_ortho_5x15(
RESET,   KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, TO(0), 			  KC_TRNS, 			 KC_NO, 			KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, \
EEP_RST, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, 			  NK_ON,   			 KC_NO, 			KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, \
KC_NO,   KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, 			  UNICODE_MODE_MAC,  KC_NO,			 	KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, \
KC_NO,   KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, UNICODE_MODE_LNX, UNICODE_MODE_WIN,  UNICODE_MODE_WINC, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, \
KC_NO,   KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, 			  KC_TRNS, 			 KC_NO, 			KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO  \
),

[_PLOVER] = LAYOUT_ortho_5x15(
STN_N1,  STN_N2,  STN_N3,  STN_N4,  STN_N5,  STN_N6,  TO(0),   KC_TRNS, KC_NO,   STN_N7,  STN_N8,  STN_N9,  STN_NA,  STN_NB,  STN_NC, \
STN_FN,  STN_S1,  STN_TL,  STN_PL,  STN_HL,  STN_ST1, KC_NO,   KC_NO,   KC_NO,   STN_ST3, STN_FR,  STN_PR,  STN_LR,  STN_TR,  STN_DR, \
KC_NO,   STN_S2,  STN_KL,  STN_WL,  STN_RL,  STN_ST2, KC_NO,   TG(10),   KC_NO,   STN_ST4, STN_RR,  STN_BR,  STN_GR,  STN_SR,  STN_ZR, \
KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,  \
KC_NO,   KC_NO,   KC_NO,   KC_NO,   STN_A,   STN_O,   KC_NO,   TG(10),   KC_NO,   STN_E,   STN_U,   KC_NO,   STN_PWR, STN_RE1, STN_RE2 \
),

[_LAYER11] = LAYOUT_ortho_5x15(
KC_TRNS, KC_TRNS, 						  KC_TRNS, 						   KC_TRNS, 						KC_TRNS, 						 KC_TRNS, 						  TO(0),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, 						  KC_TRNS, 						   KC_TRNS, 						KC_TRNS, 						 KC_TRNS, 						  KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, XP(FCIRCUMFLEXA, FCIRCUMFLEXAC), XP(FCIRCUMFLEXO, FCIRCUMFLEXOC), XP(FCIRCUMFLEXE, FCIRCUMFLEXEC), XP(FCIRCUMFLEXU, FCIRCUMFLEXUC), XP(FCIRCUMFLEXI, FCIRCUMFLEXIC), KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, 						  KC_TRNS, 						   KC_TRNS, 						KC_TRNS, 						 KC_TRNS, 						  KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, 						  KC_TRNS, 						   KC_TRNS, 						KC_TRNS, 						 KC_TRNS, 						  KC_TRNS, TG(2),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS  \
),

[_LAYER12] = LAYOUT_ortho_5x15(
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, 					KC_TRNS, 					 KC_TRNS, 					  TO(0),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,						KC_TRNS, 					 XP(FDIERESISY, FDIERESISYC), KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS, XP(FDIERESISE, FDIERESISEC), XP(FDIERESISU, FDIERESISUC), XP(FDIERESISI, FDIERESISIC), KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, 					KC_TRNS, 				 	 KC_TRNS, 					  KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, 					KC_TRNS, 					 KC_TRNS, 					  KC_TRNS, TG(3),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS  \
),

[_LAYER13] = LAYOUT_ortho_5x15(
KC_TRNS, KC_TRNS, 				KC_TRNS, 						KC_TRNS, 							KC_TRNS, 				KC_TRNS, TO(0),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, 				KC_TRNS, 						KC_TRNS, 							KC_TRNS, 				KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, XP(FGRAVEA, FGRAVEAC), KC_TRNS, 						XP(FGRAVEE, FGRAVEEC), 				XP(FGRAVEU, FGRAVEUC), 	KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, 				KC_TRNS, 						KC_TRNS, 							KC_TRNS, 				KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, 				KC_TRNS, 						KC_TRNS, 							KC_TRNS, 				KC_TRNS, KC_TRNS, TG(3),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS  \
),

[_LAYER14] = LAYOUT_ortho_5x15(
KC_TRNS, KC_F1,   						KC_F2,   			   KC_F3,   KC_F4,   					   KC_F5,   TO(0),   KC_TRNS, KC_TRNS, KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  \
KC_TRNS, KC_SCLN, 						KC_COMM, 			   KC_DOT,  XP(FLIGATUREOE, FLIGATUREOEC), KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_F12,  \
KC_TRNS, XP(FLIGATUREAE, FLIGATUREAEC), XP(FGRAVEU, FGRAVEUC), KC_TRNS, KC_TRNS, 		 			   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_CIRC, KC_AMPR, KC_ASTR, KC_MINS, KC_EQL,  KC_TRNS, \
KC_TRNS, KC_TRNS, 						KC_TRNS, 			   KC_TRNS, KC_TRNS, 					   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, 						KC_TRNS, 			   KC_TRNS, KC_TRNS, 					   KC_TRNS, KC_TRNS, TG(3),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS  \
),

[_LAYER15] = LAYOUT_ortho_5x15(
KC_TRNS, KC_TRNS, 						  KC_TRNS, 						   KC_TRNS, 							KC_TRNS, 						 KC_TRNS, TO(0),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, 						  KC_TRNS, 						   KC_TRNS, 							XP(FCIRCUMFLEXO, FCIRCUMFLEXOC), KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, XP(FCIRCUMFLEXA, FCIRCUMFLEXAC), XP(FCIRCUMFLEXU, FCIRCUMFLEXUC), XP(FCIRCUMFLEXI, FCIRCUMFLEXIC),  	XP(FCIRCUMFLEXE, FCIRCUMFLEXEC), KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, 						  KC_TRNS, 						   KC_TRNS, 							KC_TRNS, 						 KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, 						  KC_TRNS, 						   KC_TRNS, 							KC_TRNS, 						 KC_TRNS, KC_TRNS, TG(3),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS  \
),

[_LAYER16] = LAYOUT_ortho_5x15(
KC_TRNS, KC_TRNS, KC_TRNS, 					   KC_TRNS, 					KC_TRNS, 						KC_TRNS, TO(0),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS,					   KC_TRNS, 					KC_TRNS, 						KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, XP(FDIERESISU, FDIERESISUC), XP(FDIERESISI, FDIERESISIC), XP(FDIERESISE, FDIERESISEC), 	KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, XP(FDIERESISY, FDIERESISYC), KC_TRNS, 					KC_TRNS, 						KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, \
KC_TRNS, KC_TRNS, KC_TRNS, 					   KC_TRNS, 					KC_TRNS, 						KC_TRNS, KC_TRNS, TG(3),   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS  \
)

};

// bool process_record_user(uint16_t keycode, keyrecord_t *record) {
	// if (record->event.pressed) {
		// switch(keycode) {
			// case M_DV:
				// layer_invert(1);
				// rgblight_toggle();
				// wait_ms(50);
				// rgblight_toggle();
				// return false; break;
			// case M_QW:
				// layer_invert(1);
				// rgblight_toggle();
				// wait_ms(50);
				// rgblight_toggle();
				// wait_ms(100);
				// rgblight_toggle();
				// wait_ms(50);
				// rgblight_toggle();
				// return false; break;
		// }
	// }
	// return true;
// };

// uint32_t layer_state_set_user(uint32_t state) {
  // switch (biton32(state)) {
    // case _LAYER0:
      // rgblight_mode(25);
      // break;
    // case _LAYER5:
      // rgblight_mode(30);
      // break;
  // }
  // return state;
// }
