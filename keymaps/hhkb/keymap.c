
#include QMK_KEYBOARD_H
#include "keymap_swedish.h"

enum layer_indexes {
    BASE,
    FUNCTION,
};

/* 0: Default layer
┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
│ Esc │  1  │  2  │  3  │  4  │  5  │  6  │  7  │  8  │  9  │  0  │  +  │  ´  │  '  │  <  │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│ Tab │  Q  │  W  │  E  │  R  │  T  │  Y  │  U  │  I  │  O  │  P  │  Å  │  ¨  │BkSpc│█████│
├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│Ctrl │  A  │  S  │  D  │  F  │  G  │  H  │  J  │  K  │  L  │  Ö  │  Ä  │█████│Enter│█████│
├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│Shift│█████│  Z  │  X  │  C  │  V  │  B  │  N  │  M  │  ,  │  .  │  -  │█████│Shift│ Fn  │
└─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┘
      │ Gui │ Alt │█████│█████│Space│█████│█████│█████│█████│█████│AltGr│ Gui │█████│
      └─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┘
 */
#define base_layer LAYOUT_60_hhkb( \
KC_ESC,  SE_1,    SE_2,    SE_3, SE_4, SE_5,   SE_6, SE_7, SE_8,    SE_9,   SE_0,    SE_PLUS, SE_ACUT, SE_QUOT, SE_LABK, \
KC_TAB,  SE_Q,    SE_W,    SE_E, SE_R, SE_T,   SE_Y, SE_U, SE_I,    SE_O,   SE_P,    SE_ARNG, SE_DIAE, KC_BSPC,          \
KC_LCTL, SE_A,    SE_S,    SE_D, SE_F, SE_G,   SE_H, SE_J, SE_K,    SE_L,   SE_ODIA, SE_ADIA,          KC_ENT,           \
KC_LSFT, SE_Z,    SE_X,    SE_C, SE_V, SE_B,   SE_N, SE_M, SE_COMM, SE_DOT, SE_MINS,          KC_RSFT, MO(FUNCTION),     \
         KC_LGUI, KC_LALT,             KC_SPC,                              KC_RALT, KC_RGUI                             \
)

/* 1: Fn layer
┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
│     │ F1  │ F2  │ F3  │ F4  │ F5  │ F6  │ F7  │ F8  │ F9  │ F10 │ F11 │ F12 │ Ins │ Del │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│Caps │     │     │     │Reset│     │     │     │ Ins │     │Prtsq│ Up  │     │ Del │█████│
├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│     │ VoD │ VoU │     │     │     │     │     │Home │PgUp │Left │Right│█████│NPEnt│█████│
├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│     │█████│ Rwd │Prev │Play │Next │ Fwd │     │     │ End │PgDwn│Down │█████│     │     │
└─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┘
      │     │     │█████│█████│█████│     │█████│█████│█████│█████│     │     │█████│
      └─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┘
 */
#define function_layer LAYOUT_60_hhkb( \
KC_TRNS, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  KC_INS, KC_DEL, \
KC_CAPS, KC_TRNS, KC_TRNS, KC_TRNS, QK_RBT,  KC_TRNS, KC_TRNS, KC_TRNS, KC_INS,  KC_TRNS, KC_PSCR, KC_UP,   KC_TRNS, KC_TRNS,        \
KC_TRNS, KC_VOLD, KC_VOLU, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_HOME, KC_PGUP, KC_LEFT, KC_RGHT, KC_PENT,                 \
KC_TRNS, KC_MRWD, KC_MPRV, KC_MPLY, KC_MNXT, KC_MFFD, KC_TRNS, KC_TRNS, KC_END,  KC_PGDN, KC_DOWN,          KC_TRNS, KC_TRNS,        \
         KC_TRNS, KC_TRNS,                            KC_TRNS,                                     KC_TRNS, KC_TRNS                  \
)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [BASE]     = base_layer,
    [FUNCTION] = function_layer,
};
