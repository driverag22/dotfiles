/* See LICENSE file for copyright and license details. */ #include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 4;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappx     = 6;        /* gaps between windows */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int user_bh            = 25;
static const char *fonts[]          = { "JetBrains Mono:size=14"};
static const char dmenufont[]       = { "JetBrains Mono:size=13"};
static const char col_gray4[]       = "#31333f";
static const char col_white[]       = "#eeeeee";
static const char col_pink[]        = "#ff69b4";
static const char col_viogray[]     = "#9f92a7";

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_white, col_gray4,  col_gray4},
	[SchemeSel]  = { col_white, col_pink,  col_pink},
	[SchemeSpecial]  = { col_pink, col_gray4,  col_pink},
	[SchemeSpecial2]  = { col_pink, col_gray4,  col_pink},
};

/* tagging */
static const char *tags[] = { "", "", "", "", "", "", "", "" };
/* static const char *tags[] = { "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  " }; */

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
        { "  ",      tile },
	{ "  ",      NULL },    /* no layout function means floating behavior */
	{ " [M]",      monocle },
};
/* key definitions */
/* #define MODKEY Mod1Mask */
#define MODKEY Mod4Mask
#define ALTKEY Mod1Mask
#define CTRLKEY ControlMask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
/* static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray4, "-nf", col_white, "-sb", col_pink, "-sf", col_white, NULL }; */
static const char *dmenucmd[] = { "dmenu_run"};
/* static const char *dmenucmd[] = { "/home/diego/.local/.macros/keyBindings/rofi.sh", NULL }; */
static const char *termcmd[]  = { "alacritty", NULL };

static const char *browser[]  = { "firefox", NULL };
static const char *filebrowser[]  = { "/home/diego/.local/.macros/keyBindings/home.sh", NULL };
static const char *schoolDropbox[] = {"/home/diego/.local/.macros/keyBindings/q1.sh", NULL};
static const char *notion[] = {"/home/diego/.local/.macros/keyBindings/notion.sh", NULL};
static const char *todos[] = {"alacritty", "-e", "/usr/bin/nvim", "/home/diego/vimwiki/TODOs.wiki", NULL};

static const char *lockscreen[]  = { "/home/diego/.local/.macros/keyBindings/lock.sh", NULL };
static const char *powermenu[]  = { "/home/diego/.local/.macros/keyBindings/powermenu.sh", NULL };
static const char *batterymenu[]  = { "/home/diego/.local/.macros/keyBindings/batterymenu.sh", NULL };

static const char *brightnessUp[] = { "light", "-A", "2", NULL};
static const char *brightnessDown[] = {"light", "-U", "2", NULL};
static const char *screenshot[] = {"gscreenshot", "-s", "-c", "-o", NULL};
/* static const char *play[] = {"/home/diego/.local/.macros/keyBindings/play.sh", NULL}; */
/* static const char *stop[] = {"/home/diego/.local/.macros/keyBindings/pause.sh", NULL}; */
static const char *play[] = {"playerctl", "play-pause", NULL};
static const char *soundUp[] = {"amixer", "set", "Master",  "2%+", NULL};
static const char *soundDown[] = {"amixer", "set", "Master", "2%-", NULL};
static const char *soundToggle[] = {"amixer", "set", "Master", "toggle", NULL};

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_space,  spawn,          {.v = dmenucmd } }, // dmenu
	{ CTRLKEY,                      XK_j,      spawn,          {.v = termcmd } }, //alacritty
	{ CTRLKEY,                      XK_n,      spawn,          {.v = browser } }, //firefox
	{ CTRLKEY,                      XK_u,      spawn,          {.v = notion} }, //notion
	{ CTRLKEY,                      XK_g,      spawn,          {.v = todos} }, //notion

	{ ALTKEY,                      XK_h,      spawn,          {.v = filebrowser } }, //home
	{ CTRLKEY,                      XK_i,      spawn,          {.v = schoolDropbox } }, //tue dropbox

	{ MODKEY|ShiftMask,             XK_l,      spawn,          {.v = lockscreen } }, //lockscreen
	{ MODKEY|ShiftMask,             XK_p,      spawn,          {.v = powermenu } }, //powermenu
	{ MODKEY|ShiftMask,             XK_b,      spawn,          {.v = batterymenu } }, //powermenu


    { 0,                            XF86XK_MonBrightnessUp,    spawn, {.v=brightnessUp }}, //brightness up/down
    { 0,                            XF86XK_MonBrightnessDown,  spawn, {.v=brightnessDown }},
	{ 0,                            XK_Print,      spawn,          {.v = screenshot} }, //screenshotter
	{ CTRLKEY,                      XK_p,                      spawn, {.v = play } }, //play/pause
    { 0,                            XF86XK_AudioRaiseVolume,   spawn, {.v = soundUp}}, //sound up/down/mute
    { 0,                            XF86XK_AudioLowerVolume,   spawn, {.v = soundDown}},
    { 0,                            XF86XK_AudioMute,          spawn, {.v = soundToggle}},


	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_w,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_e,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_r,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_m,      togglefullscreen,{0} },


	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_a,      view,           {.ui = ~0 } },
	{ MODKEY,                       XK_s,      tag,            {.ui = ~0 } },
    

	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },

	{ ALTKEY,                       XK_k,      viewnexttag,        {0} },
	{ ALTKEY|ShiftMask,             XK_k,      tagnext,            {0} }, 

	{ ALTKEY,                       XK_j,      viewprevtag,        {0} },
	{ ALTKEY|ShiftMask,             XK_j,      tagprev,            {0} }, 

	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_7,                      4)
	TAGKEYS(                        XK_8,                      5)
	TAGKEYS(                        XK_9,                      6)
	TAGKEYS(                        XK_0,                      7)
    { MODKEY|ShiftMask,             XK_r,      quit,           {1} },
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
