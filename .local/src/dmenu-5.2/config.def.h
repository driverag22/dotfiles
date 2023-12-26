/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */
static int fuzzy = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
static int user_bh = 21;
/* static int dmx = 5, dmy = 3; /1* put dmenu at this x, y offset *1/ */
/* static unsigned int dmw = 1903; /1* make dmenu this wide *1/ */
/* static unsigned int border_width = 2; /1* Size of the window border *1/ */
static unsigned int border_width = 0; /* Size of the window border */

static const char col_black[] = "#000000";
static const char col_white[] = "#eeeeee";
static const char col_lBlue[] = "#2d67ad";
static const char col_bBlue[] = "#338fff";
static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static const char *fonts[] = {
	"JetBrains Mono:size=13"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { col_white, col_black},
	[SchemeSel] = { col_black, col_lBlue},
	[SchemeSelHighlight] = { col_white, col_lBlue},
	[SchemeNormHighlight] = { col_bBlue, col_black },
	[SchemeOut] = { col_black, "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
