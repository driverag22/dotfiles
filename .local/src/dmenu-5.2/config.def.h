/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */
static int fuzzy = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
static int user_bh = 21;
/* static int dmx = 5, dmy = 3; /1* put dmenu at this x, y offset *1/ */
/* static unsigned int dmw = 1903; /1* make dmenu this wide *1/ */
/* static unsigned int border_width = 2; /1* Size of the window border *1/ */
static unsigned int border_width = 0; /* Size of the window border */

static const char col_bg[]          = "#020202";
static const char col_white[]       = "#eeeeee";
static const char col_pink[]        = "#CA509C";
static const char col_cyan[]        = "#32A9A6";

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static const char *fonts[] = {
	"JetBrains Mono:size=13"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { col_white, col_bg},
	[SchemeSel] = { col_bg, col_pink},
	[SchemeSelHighlight] = { col_white, col_pink},
	[SchemeNormHighlight] = { col_cyan, col_bg },
	[SchemeOut] = { col_bg, col_cyan },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
