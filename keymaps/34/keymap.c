#include QMK_KEYBOARD_H
#include "keymap_swedish.h"

enum layer_indexes {
  BASE,
  SYMBOLS,
  NUMBERS,
  NAV,
  GAME,
  DIVA,
};

#define L_BASE TO(BASE)
#define L_SYM  TO(SYMBOLS)
#define L_NUM  TO(NUMBERS)
#define L_NAV  TO(NAV)
#define L_GAME TO(GAME)
#define L_DIVA TO(DIVA)

#define CTRL  OSM(MOD_LCTL)
#define SHIFT OSM(MOD_LSFT)
#define SPACE LGUI_T(KC_SPACE)

enum tap_dance_codes {
    TAP_A,
    TAP_Z,
    TAP_AE,
    TAP_OE,
    TAP_QUOT,
    TAP_MINS,
};

#define E_AE TD(TAP_AE)
#define O_OE TD(TAP_OE)

#define A_TAB TD(TAP_A)
#define Z_ESC TD(TAP_Z)

#define QUOT_ENT TD(TAP_QUOT)
#define MIN_BSPC TD(TAP_MINS)

/* Default layer
┌──────┬──────┬──────┬──────┬──────┐         ┌──────┬──────┬──────┬──────┬──────┐
│ Q    │ W    │ E    │ R    │ T    │         │ Y    │ U    │ I    │ O    │ P    │
│      │      │    Ä │      │      │         │      │      │      │    Ö │      │
├──────┼──────┼──────┼──────┼──────┤         ├──────┼──────┼──────┼──────┼──────┤
│ A    │ S    │ D    │ F    │ G    │         │ H    │ J    │ K    │ L    │ *    │
│   Tab│      │      │      │      │ ┌─────┐ │      │      │      │      │ '  ⏎ │
├──────┼──────┼──────┼──────┼──────┤ │     │ ├──────┼──────┼──────┼──────┼──────┤
│ Z    │ X    │ C    │ V    │ B    │ │     │ │ N    │ M    │ ;    │ :    │ _    │
│   Esc│      │      │      │      │ │     │ │      │      │ ,    │ .    │ -  ⌫ │
└──────┴──────┴──────┼──────┼──────┼─┘     └─┼──────┼──────┼──────┴──────┴──────┘
                     │Space │Shift │         │Ctrl  │Layer │
                     │   Gui│      │         │      │ Sym  │
                     └──────┴──────┘         └──────┴──────┘
*/
#define base_layer LAYOUT( \
    SE_Q,  SE_W, E_AE,  SE_R,  SE_T, /* | */ SE_Y, SE_U, SE_I,    O_OE,   SE_P,     \
    A_TAB, SE_S, SE_D,  SE_F,  SE_G, /* | */ SE_H, SE_J, SE_K,    SE_L,   QUOT_ENT, \
    Z_ESC, SE_X, SE_C,  SE_V,  SE_B, /* | */ SE_N, SE_M, SE_COMM, SE_DOT, MIN_BSPC, \
                       SPACE, SHIFT, /* | */ CTRL, L_SYM                             \
)

#define ALTGR (KC_RALT)

/* Symbols
            ┌──────┬──────┬──────┬──────┬──────┐         ┌──────┬──────┬──────┬──────┬──────┐
            │  !   │  "   │  #   │ $    │  %   │         │  &   │ /    │ (    │ )    │ =    │
            │      │      │      │      │      │         │      │      │      │      │      │
            ├──────┼──────┼──────┼──────┼──────┤         ├──────┼──────┼──────┼──────┼──────┤
            │ Å    │ @    │ |    │ ?    │ {    │         │ }    │ +    │ [    │ ]    │ ^    │
            │      │      │      │      │      │ ┌─────┐ │      │      │      │      │      │
            ├──────┼──────┼──────┼──────┼──────┤ │     │ ├──────┼──────┼──────┼──────┼──────┤
            │ >    │Layer │Layer │Layer │Layer │ │     │ │ ⌫    │ \    │Print │ `    │ ~    │
            │ <  | │ Diva │ Game │ Nums │ Nav  │ │     │ │      │      │Screen│      │      │
            └──────┴──────┴──────┼──────┼──────┼─┘     └─┼──────┼──────┼──────┴──────┴──────┘
                                 │Layer │Shift │         │ Ctrl │AltGr │
                                 │ Base │      │         │      │      │
                                 └──────┴──────┘         └──────┴──────┘
*/
#define symbol_layer LAYOUT( \
    SE_EXLM, SE_DQUO, SE_HASH,  SE_DLR, SE_PERC, /* | */ SE_AMPR, SE_SLSH, SE_LPRN, SE_RPRN, SE_EQL,  \
    SE_ARNG,   SE_AT, SE_PIPE, SE_QUES, SE_LCBR, /* | */ SE_RCBR, SE_PLUS, SE_LBRC, SE_RBRC, SE_CIRC, \
    KC_NUBS,  L_DIVA,  L_GAME,   L_NUM,   L_NAV, /* | */ KC_BSPC, SE_BSLS, KC_PSCR, SE_GRV,  SE_TILD, \
                                L_BASE,   SHIFT, /* | */ CTRL,    ALTGR                               \
)


/* Numbers
         ┌──────┬──────┬──────┬──────┬──────┐         ┌──────┬──────┬──────┬──────┬──────┐
         │ F1   │ F2   │ F3   │ F4   │ F5   │         │ F6   │ F7   │ F8   │ F9   │ F10  │
         │      │      │      │      │      │         │      │      │      │      │      │
         ├──────┼──────┼──────┼──────┼──────┤         ├──────┼──────┼──────┼──────┼──────┤
         │ !    │ "    │ #    │ ¤    │ %    │         │ &    │ /    │ (    │ )    │ =    │
         │ 1    │ 2  @ │ 3    │ 4  $ │ 5    │ ┌─────┐ │ 6    │ 7  { │ 8  [ │ 9  ] │ 0  } │
         ├──────┼──────┼──────┼──────┼──────┤ │     │ ├──────┼──────┼──────┼──────┼──────┤
         │ Esc  │Layer │Layer │Layer │Layer │ │     │ │ Del  │ µ    │ F11  │ F12  │BkSpc │
         │      │ Diva │ Game │ Nums │ Nav  │ │     │ │      │      │      │      │      │
         └──────┴──────┴──────┼──────┼──────┼─┘     └─┼──────┼──────┼──────┴──────┴──────┘
                              │Layer │Shift │         │ Ctrl │Layer │
                              │ Base │      │         │      │ Sym  │
                              └──────┴──────┘         └──────┴──────┘
*/
#define number_layer LAYOUT( \
    KC_F1,   KC_F2,  KC_F3,   KC_F4,   KC_F5, /* | */ KC_F6,  KC_F7,   KC_F8,  KC_F9,  KC_F10,  \
    SE_1,     SE_2,   SE_3,    SE_4,    SE_5, /* | */ SE_6,   SE_7,    SE_8,   SE_9,   SE_0,    \
    KC_ESC, L_DIVA, L_GAME, KC_DOWN,  KC_F11, /* | */ KC_DEL, SE_MICR, KC_F11, KC_F12, KC_BSPC, \
                             L_BASE,   SHIFT, /* | */ CTRL,   L_SYM                             \
)

#define TAB_PREV LCTL(LSFT(KC_TAB))
#define TAB_NEXT LCTL(KC_TAB)

/* Nav layer
            ┌──────┬──────┬──────┬──────┬──────┐         ┌──────┬──────┬──────┬──────┬──────┐
            │Accel │Scroll│Mouse │Scroll│Accel │         │ Web  │ Tab  │ Tab  │ Web  │ F5   │
            │  Low │   ←  │   ↑  │   →  │ High │         │ Prev │ Prev │ Next │ Next │      │
            ├──────┼──────┼──────┼──────┼──────┤         ├──────┼──────┼──────┼──────┼──────┤
            │ Esc  │Mouse │Mouse │Mouse │ Del  │         │ Left │ Down │  Up  │Right │Enter │
            │      │   ←  │   ↓  │   →  │      │ ┌─────┐ │      │      │      │      │      │
            ├──────┼──────┼──────┼──────┼──────┤ │     │ ├──────┼──────┼──────┼──────┼──────┤
            │ Tab  │Scroll│Scroll│Scroll│Mouse │ │     │ │Mouse │PgDown│ PgUp │      │BkSpc │
            │      │ Click│   ↓  │   ↑  │ Right│ │     │ │ Left │      │      │      │      │
            └──────┴──────┴──────┼──────┼──────┼─┘     └─┼──────┼──────┼──────┴──────┴──────┘
                                 │Layer │Shift │         │ Ctrl │Layer │
                                 │ Base │      │         │      │ Sym  │
                                 └──────┴──────┘         └──────┴──────┘
*/
#define nav_layer LAYOUT( \
    KC_ACL0, KC_WH_L, KC_MS_U, KC_WH_R, KC_ACL2, /* | */ KC_BTN4, TAB_PREV, TAB_NEXT, KC_BTN5,  KC_F5,   \
    KC_ESC,  KC_MS_L, KC_MS_D, KC_MS_R,  KC_DEL, /* | */ KC_LEFT, KC_DOWN,  KC_UP,    KC_RIGHT, KC_ENT,  \
    KC_TAB,  KC_BTN3, KC_WH_D, KC_WH_U, KC_BTN2, /* | */ KC_BTN1, KC_PGDN,  KC_PGUP,  KC_NO,    KC_BSPC, \
                                L_BASE,   SHIFT, /* | */ CTRL,    L_SYM                                  \
)

/* Game layer
  ┌──────┬──────┬──────┬──────┬──────┐         ┌──────┬──────┬──────┬──────┬──────┐
  │ Tab  │ Q    │ W    │ E    │ R    │         │ Y    │ U    │ I    │ O    │ P    │
  │      │      │      │      │      │         │      │      │      │      │      │
  ├──────┼──────┼──────┼──────┼──────┤         ├──────┼──────┼──────┼──────┼──────┤
  │ Ctrl │ A    │ S    │ D    │ F    │         │ H    │ J    │ K    │ L    │ *    │
  │      │      │      │      │      │ ┌─────┐ │      │      │      │      │ '    │
  ├──────┼──────┼──────┼──────┼──────┤ │     │ ├──────┼──────┼──────┼──────┼──────┤
  │ Esc  │ Z    │ X    │ C    │ V    │ │     │ │ N    │ M    │ ;    │ :    │ _    │
  │      │      │      │      │      │ │     │ │      │      │ ,    │ .    │ -    │
  └──────┴──────┴──────┼──────┼──────┼─┘     └─┼──────┼──────┼──────┴──────┴──────┘
                       │Space │Shift │         │ T    │Layer │
                       │      │      │         │      │ Sym  │
                       └──────┴──────┘         └──────┴──────┘
*/
#define game_layer LAYOUT( \
    KC_TAB,  SE_Q, SE_W, SE_E,   SE_R, /* | */ SE_Y, SE_U,  SE_I,    SE_O,   SE_P,    \
    KC_LCTL, SE_A, SE_S, SE_D,   SE_F, /* | */ SE_H, SE_J,  SE_K,    SE_L,   SE_QUOT, \
    KC_ESC,  SE_Z, SE_X, SE_C,   SE_V, /* | */ SE_N, SE_M,  SE_COMM, SE_DOT, SE_MINS, \
                      KC_SPC, KC_LSFT, /* | */ SE_T, L_SYM                            \
)

/* diva layer
    ┌──────┬──────┬──────┬──────┬──────┐         ┌──────┬──────┬──────┬──────┬──────┐
    │ Q    │ W    │ E    │ R    │ T    │         │ Left │ Down │  Up  │Right │ F12  │
    │      │      │      │      │      │         │      │      │      │      │      │
    ├──────┼──────┼──────┼──────┼──────┤         ├──────┼──────┼──────┼──────┼──────┤
    │ A    │ S    │ D    │ F    │ G    │         │ H    │ J    │ K    │ L    │Enter │
    │      │      │      │      │      │ ┌─────┐ │      │      │      │      │      │
    ├──────┼──────┼──────┼──────┼──────┤ │     │ ├──────┼──────┼──────┼──────┼──────┤
    │ Esc  │ X    │ C    │ V    │ B    │ │     │ │ N    │ M    │ ;    │ :    │ _    │
    │      │      │      │      │      │ │     │ │      │      │ ,    │ .    │ -    │
    └──────┴──────┴──────┼──────┼──────┼─┘     └─┼──────┼──────┼──────┴──────┴──────┘
                         │Space │Shift │         │Ctrl  │Layer │
                         │      │      │         │      │ Sym  │
                         └──────┴──────┘         └──────┴──────┘
*/
#define diva_layer LAYOUT( \
    SE_Q,   SE_W, SE_E,   SE_R,    SE_T, /* | */ KC_LEFT, KC_DOWN, KC_UP,   KC_RIGHT, KC_F12,  \
    SE_A,   SE_S, SE_D,   SE_F,    SE_G, /* | */ SE_H,    SE_J,    SE_K,    SE_L,     KC_ENT,  \
    KC_ESC, SE_X, SE_C,   SE_V,    SE_B, /* | */ SE_N,    SE_M,    SE_COMM, SE_DOT,   SE_MINS, \
                        KC_SPC, KC_LSFT, /* | */ KC_LCTL, L_SYM                                \
)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [BASE]    = base_layer,
    [SYMBOLS] = symbol_layer,
    [NUMBERS] = number_layer,
    [NAV]     = nav_layer,
    [GAME]    = game_layer,
    [DIVA]    = diva_layer,
};

/********************************************************************************\
* d888888b  .d8b.  d8888b.      d8888b.  .d8b.  d8b   db  .o88b. d88888b .d8888. *
* `~~88~~' d8' `8b 88  `8D      88  `8D d8' `8b 888o  88 d8P  Y8 88'     88'  YP *
*    88    88ooo88 88oodD'      88   88 88ooo88 88V8o 88 8P      88ooooo `8bo.   *
*    88    88~~~88 88~~~        88   88 88~~~88 88 V8o88 8b      88~~~~~   `Y8b. *
*    88    88   88 88           88  .8D 88   88 88  V888 Y8b  d8 88.     db   8D *
*    YP    YP   YP 88           Y8888D' YP   YP VP   V8P  `Y88P' Y88888P `8888Y' *
\********************************************************************************/

typedef struct {
    uint16_t tap;
    uint16_t hold;
    uint16_t held;
} tap_dance_tap_hold_t;


void tap_dance_tap_hold_finished(tap_dance_state_t *state, void *user_data);
void tap_dance_tap_hold_reset(tap_dance_state_t *state, void *user_data);

#define ACTION_TAP_DANCE_TAP_HOLD(tap, hold) {                             \
    .fn = { NULL, tap_dance_tap_hold_finished, tap_dance_tap_hold_reset }, \
    .user_data = (void *) &((tap_dance_tap_hold_t) { tap, hold, 0 }),      \
}

tap_dance_action_t tap_dance_actions[] = {
    [TAP_A]    = ACTION_TAP_DANCE_TAP_HOLD(SE_A,    KC_TAB),
    [TAP_Z]    = ACTION_TAP_DANCE_TAP_HOLD(SE_Z,    KC_ESC),
    [TAP_AE]   = ACTION_TAP_DANCE_TAP_HOLD(SE_E,    SE_ADIA),
    [TAP_OE]   = ACTION_TAP_DANCE_TAP_HOLD(SE_O,    SE_ODIA),
    [TAP_MINS] = ACTION_TAP_DANCE_TAP_HOLD(SE_MINS, KC_BSPC),
    [TAP_QUOT] = ACTION_TAP_DANCE_TAP_HOLD(SE_QUOT, KC_ENTER),
};

#define TAP_HOLD_CASE(IDX) case TD(IDX):                                            \
    action = &tap_dance_actions[IDX];                                               \
    if (!record->event.pressed && action->state.count && !action->state.finished) { \
        tap_dance_tap_hold_t *tap_hold = (tap_dance_tap_hold_t *)action->user_data; \
        tap_code16(tap_hold->tap);                                                  \
    }                                                                               \
    return true;

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    tap_dance_action_t *action;

    switch (keycode) {
        TAP_HOLD_CASE(TAP_A);
        TAP_HOLD_CASE(TAP_Z);
        TAP_HOLD_CASE(TAP_AE);
        TAP_HOLD_CASE(TAP_OE);
        TAP_HOLD_CASE(TAP_QUOT);
        TAP_HOLD_CASE(TAP_MINS);
    }

    return true;
}

void tap_dance_tap_hold_finished(tap_dance_state_t *state, void *user_data) {
    tap_dance_tap_hold_t *tap_hold = (tap_dance_tap_hold_t*) user_data;

    if (state->pressed) {
        if (state->count == 1) {
            register_code16(tap_hold->hold);
            tap_hold->held = tap_hold->hold;
        } else {
            register_code16(tap_hold->tap);
            tap_hold->held = tap_hold->tap;
        }
    }
}

void tap_dance_tap_hold_reset(tap_dance_state_t *state, void *user_data) {
    tap_dance_tap_hold_t *tap_hold = (tap_dance_tap_hold_t *)user_data;

    if (tap_hold->held) {
        unregister_code16(tap_hold->held);
        tap_hold->held = 0;
    }
}
