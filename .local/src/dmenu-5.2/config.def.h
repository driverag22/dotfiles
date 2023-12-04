/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */
static int fuzzy = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
static int user_bh = 21;
/* static int dmx = 5, dmy = 3; /1* put dmenu at this x, y offset *1/ */
/* static unsigned int dmw = 1903; /1* make dmenu this wide *1/ */
/* static unsigned int border_width = 2; /1* Size of the window border *1/ */
static unsigned int border_width = 0; /* Size of the window border */

static const char col_gray4[] = "#31333f";
static const char col_white[] = "#eeeeee";
static const char col_pink[] = "#ff69b4";
static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static const char *fonts[] = {
	"JetBrains Mono:size=13"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { col_white, col_gray4 },
	[SchemeSel] = { col_gray4, col_pink },
	[SchemeSelHighlight] = { col_white, col_pink},
	[SchemeNormHighlight] = { col_pink, col_gray4 },
	[SchemeOut] = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
