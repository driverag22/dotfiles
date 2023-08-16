/* See LICENSE file for copyright and license details. */ 
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappx     = 5;        /* gaps between windows */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int vertpad            = 5;       /* vertical padding of bar */
static const int sidepad            = 7;       /* horizontal padding of bar */
static const int user_bh            = 22;
/* static const int user_bh            = 26; */
/* static const char *fonts[]          = { "JetBrains Mono:size=13", "DejaVu Sans Mono wifi ramp:size=13"}; */
static const char *fonts[]          = { "JetBrains Mono:size=12", "DejaVu Sans Mono wifi ramp:size=11"};
/* static const char *fonts[]          = { "mononoki:size=12","JetBrains Mono:size=12", "DejaVu Sans Mono wifi ramp:size=11"}; */
/* static const char *fonts[]          = { "SourceCodePro:size=12","JetBrains Mono:size=12", "DejaVu Sans Mono wifi ramp:size=11"}; */
/* static const char *fonts[]          = { "Comic mono:size=12","JetBrains Mono:size=12", "DejaVu Sans Mono wifi ramp:size=11"}; */
/* static const char col_gray4[]       = "#31333f"; */
static const char col_grayblue[]       = "#303642";
/* static const char col_grayblue[]       = "#31333f"; */
static const char col_orange[]      = "#C97F71";
/* static const char col_difBlue[]       = "#8CB3BB"; */
static const char col_difBlue[]     = "#5E81AB";
static const char col_white[]       = "#eeeeee";
/* static const char col_pink[]        = "#ff69b4"; */
/* static const char col_blue[]        = "#81A1C1"; */
/* static const char col_viogray[]     = "#9f92a7"; */

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_white, col_grayblue,  col_grayblue},
	[SchemeSel]  = { col_white, col_orange, col_difBlue},
	[SchemeSpecial]  = { col_difBlue, col_grayblue,  col_difBlue},
	/* [SchemeSel]  = { col_white, col_blue,  col_blue}, */
	/* [SchemeSpecial]  = { col_blue, col_gray4,  col_blue}, */
};

/* tagging */
static const char *tags[] = { "", "", "", "", "", "", "", "" };
/* static const char *tags[] = { "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  " }; */

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Sxiv",     NULL,       NULL,       0,            1,           -1 },
	{ "stalonetray", "stalonetray",    "stalonetray",       1 << 7,       0,           1 },
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

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run_history"};
static const char *dmenuSearch[] = { "/home/diego/.local/.macros/keyBindings/dmenuGoogleSearch.sh", NULL };
/* static const char *rofi[] = { "/home/diego/.config/rofi/launchers/type-2/launcher.sh"}; */
static const char *termcmd[]  = { "alacritty", NULL };

static const char *browser[]  = { "firefox", NULL };
static const char *filebrowser[]  = { "/home/diego/.local/.macros/keyBindings/home.sh", NULL };
static const char *schoolDropbox[] = {"/home/diego/.local/.macros/keyBindings/q1.sh", NULL};
/* static const char *notion[] = {"/home/diego/.local/.macros/keyBindings/notion.sh", NULL}; */
static const char *todos[] = {"alacritty", "-e", "/usr/bin/nvim", "/home/diego/vimwiki/TODO.wiki", NULL};

static const char *lockscreen[]  = { "/home/diego/.local/.macros/keyBindings/lock.sh", NULL };
static const char *powermenu[]  = { "/home/diego/.local/.macros/keyBindings/powermenu.sh", NULL };
static const char *batterymenu[]  = { "/home/diego/.local/.macros/keyBindings/batterymenu.sh", NULL };
static const char *mediamenu[]  = { "/home/diego/.local/.macros/keyBindings/mediamenu.sh", NULL };
static const char *volmenu[]  = { "/home/diego/.local/.macros/keyBindings/volmenu.sh", NULL };
static const char *wallpaper[]  = { "/home/diego/.local/.macros/keyBindings/sxiv.sh", NULL };
static const char *systray[]  = { "/home/diego/.local/.macros/keyBindings/systray.sh", NULL };

static const char *brightnessUp[] = { "light", "-A", "3", NULL};
static const char *brightnessDown[] = {"light", "-U", "3", NULL};
static const char *screenshot[] = {"gscreenshot", "-s", "-c", "-o", NULL};
/* static const char *play[] = {"/home/diego/.local/.macros/keyBindings/play.sh", NULL}; */
/* static const char *stop[] = {"/home/diego/.local/.macros/keyBindings/pause.sh", NULL}; */
static const char *play[] = {"playerctl", "play-pause", NULL};
static const char *soundUp[] = {"amixer", "set", "Master",  "2%+", NULL};
static const char *soundDown[] = {"amixer", "set", "Master", "2%-", NULL};
static const char *soundToggle[] = {"amixer", "set", "Master", "toggle", NULL};
static const char *micToggle[] = {"amixer", "set", "Capture", "toggle", NULL};

static const char *warpdNorm[] = {"warpd", "--normal", NULL};
static const char *warpdGrid[] = {"warpd", "--grid", NULL};

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_space,  spawn,          {.v = dmenucmd } }, // dmenu
	{ ALTKEY,                       XK_space,  spawn,          {.v = dmenuSearch } }, // dmenu
	{ CTRLKEY,                      XK_j,      spawn,          {.v = termcmd } }, //alacritty
	{ CTRLKEY,                      XK_n,      spawn,          {.v = browser } }, //firefox
	{ CTRLKEY,                      XK_g,      spawn,          {.v = todos} }, //notion

	{ ALTKEY,                       XK_h,      spawn,          {.v = filebrowser } }, //home
	{ CTRLKEY,                      XK_i,      spawn,          {.v = schoolDropbox } }, //tue dropbox

	{ MODKEY|ShiftMask,             XK_l,      spawn,          {.v = lockscreen } }, //lockscreen
	{ MODKEY|ShiftMask,             XK_p,      spawn,          {.v = powermenu } }, //powermenu
	{ MODKEY|ShiftMask,             XK_m,      spawn,          {.v = mediamenu } }, //mediamenu
	{ MODKEY|ShiftMask,             XK_b,      spawn,          {.v = batterymenu } }, //batterymenu
	{ MODKEY|ShiftMask,             XK_v,      spawn,          {.v = volmenu } }, //volmenu
	{ MODKEY|ShiftMask,             XK_w,      spawn,          {.v = wallpaper } }, //wallpaper
	{ MODKEY|ShiftMask,             XK_t,      spawn,          {.v = systray } }, //systray

	{ MODKEY|Mod1Mask,               XK_n,      spawn,          {.v = warpdNorm } }, 
	{ MODKEY|Mod1Mask,               XK_g,      spawn,          {.v = warpdGrid } },
    
    { 0,                            XF86XK_MonBrightnessUp,    spawn, {.v=brightnessUp }}, //brightness up/down
    { 0,                            XF86XK_MonBrightnessDown,  spawn, {.v=brightnessDown }},
	{ 0,                            XK_Print,      spawn,          {.v = screenshot} }, //screenshotter
	{ CTRLKEY,                      XK_p,                      spawn, {.v = play } }, //play/pause
    { 0,                            XF86XK_AudioRaiseVolume,   spawn, {.v = soundUp}}, //sound up/down/mute
    { 0,                            XF86XK_AudioLowerVolume,   spawn, {.v = soundDown}},
    { 0,                            XF86XK_AudioMute,          spawn, {.v = soundToggle}},
    { 0,                            XF86XK_AudioMicMute,       spawn, {.v = micToggle}},


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
