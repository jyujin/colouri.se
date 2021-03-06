create table rgb
(
    id integer not null primary key,
    red integer not null,
    reddenominator integer not null default 255,
    green integer not null,
    greendenominator integer not null default 255,
    blue integer not null,
    bluedenominator integer not null default 255,
    name text not null
);

insert into rgb
    (red, green, blue, name)
    values
    -- CSS3/SVG/X11 colours, see http://www.w3.org/TR/css3-color/
    (240, 248, 255, 'CSS3 aliceblue'),
    (250, 235, 215, 'CSS3 antiquewhite'),
    (  0, 255, 255, 'CSS3 aqua'),
    (127, 255, 212, 'CSS3 aquamarine'),
    (240, 255, 255, 'CSS3 azure'),
    (245, 245, 220, 'CSS3 beige'),
    (255, 228, 196, 'CSS3 bisque'),
    (  0,   0,   0, 'CSS3 black'),
    (255, 235, 205, 'CSS3 blanchedalmond'),
    (  0,   0, 255, 'CSS3 blue'),
    (138,  43, 226, 'CSS3 blueviolet'),
    (165,  42,  42, 'CSS3 brown'),
    (222, 184, 135, 'CSS3 burlywood'),
    ( 95, 158, 160, 'CS3 cadetblue'),
    (127, 255,   0, 'CSS3 chartreuse'),
    (210, 105,  30, 'CSS3 chocolate'),
    (255, 127,  80, 'CSS3 coral'),
    (100, 149, 237, 'CSS3 cornflowerblue'),
    (255, 248, 220, 'CSS3 cornsilk'),
    (220,  20,  60, 'CSS3 crimson'),
    (  0, 255, 255, 'CSS3 cyan'),
    (  0,   0, 139, 'CSS3 darkblue'),
    (  0, 139, 139, 'CSS3 darkcyan'),
    (184, 134,  11, 'CSS3 darkgoldenrod'),
    (169, 169, 169, 'CSS3 darkgray'),
    (  0, 100,   0, 'CSS3 darkgreen'),
    (169, 169, 169, 'CSS3 darkgrey'),
    (189, 183, 107, 'CSS3 darkkhaki'),
    (139,   0, 139, 'CSS3 darkmagenta'),
    ( 85, 107,  47, 'CSS3 darkolivegreen'),
    (255, 140,   0, 'CSS3 darkorange'),
    (153,  50, 204, 'CSS3 darkorchid'),
    (139,   0,   0, 'CSS3 darkred'),
    (233, 150, 122, 'CSS3 darksalmon'),
    (143, 188, 143, 'CSS3 darkseagreen'),
    ( 72,  61, 139, 'CSS3 darkslateblue'),
    ( 47,  79,  79, 'CSS3 darkslategray'),
    ( 47,  79,  79, 'CSS3 darkslategrey'),
    (  0, 206, 209, 'CSS3 darkturquoise'),
    (148,   0, 211, 'CSS3 darkviolet'),
    (255,  20, 147, 'CSS3 deeppink'),
    (  0, 191, 255, 'CSS3 deepskyblue'),
    (105, 105, 105, 'CSS3 dimgray'),
    (105, 105, 105, 'CSS3 dimgrey'),
    ( 30, 144, 255, 'CSS3 dodgerblue'),
    (178,  34,  34, 'CSS3 firebrick'),
    (255, 250, 240, 'CSS3 floralwhite'),
    ( 34, 139,  34, 'CSS3 forestgreen'),
    (255,   0, 255, 'CSS3 fuchsia'),
    (220, 220, 220, 'CSS3 gainsboro'),
    (248, 248, 255, 'CSS3 ghostwhite'),
    (255, 215,   0, 'CSS3 gold'),
    (218, 165,  32, 'CSS3 goldenrod'),
    (128, 128, 128, 'CSS3 gray'),
    (  0, 128,   0, 'CSS3 green'),
    (173, 255,  47, 'CSS3 greenyellow'),
    (128, 128, 128, 'CSS3 grey'),
    (240, 255, 240, 'CSS3 honeydew'),
    (255, 105, 180, 'CSS3 hotpink'),
    (205,  92,  92, 'CSS3 indianred'),
    ( 75,   0, 130, 'CSS3 indigo'),
    (255, 255, 240, 'CSS3 ivory'),
    (240, 230, 140, 'CSS3 khaki'),
    (230, 230, 250, 'CSS3 lavender'),
    (255, 240, 245, 'CSS3 lavenderblush'),
    (124, 252,   0, 'CSS3 lawngreen'),
    (255, 250, 205, 'CSS3 lemonchiffon'),
    (173, 216, 230, 'CSS3 lightblue'),
    (240, 128, 128, 'CSS3 lightcoral'),
    (224, 255, 255, 'CSS3 lightcyan'),
    (250, 250, 210, 'CSS3 lightgoldenrodyellow'),
    (211, 211, 211, 'CSS3 lightgray'),
    (144, 238, 144, 'CSS3 lightgreen'),
    (211, 211, 211, 'CSS3 lightgrey'),
    (255, 182, 193, 'CSS3 lightpink'),
    (255, 160, 122, 'CSS3 lightsalmon'),
    ( 32, 178, 170, 'CSS3 lightseagreen'),
    (135, 206, 250, 'CSS3 lightskyblue'),
    (119, 136, 153, 'CSS3 lightslategray'),
    (119, 136, 153, 'CSS3 lightslategrey'),
    (176, 196, 222, 'CSS3 lightsteelblue'),
    (255, 255, 224, 'CSS3 lightyellow'),
    (  0, 255,   0, 'CSS3 lime'),
    ( 50, 205,  50, 'CSS3 limegreen'),
    (250, 240, 230, 'CSS3 linen'),
    (255,   0, 255, 'CSS3 magenta'),
    (128,   0,   0, 'CSS3 maroon'),
    (102, 205, 170, 'CSS3 mediumaquamarine'),
    (  0,   0, 205, 'CSS3 mediumblue'),
    (186,  85, 211, 'CSS3 mediumorchid'),
    (147, 112, 219, 'CSS3 mediumpurple'),
    ( 60, 179, 113, 'CSS3 mediumseagreen'),
    (123, 104, 238, 'CSS3 mediumslateblue'),
    (  0, 250, 154, 'CSS3 mediumspringgreen'),
    ( 72, 209, 204, 'CSS3 mediumturquoise'),
    (199,  21, 133, 'CSS3 mediumvioletred'),
    ( 25,  25, 112, 'CSS3 midnightblue'),
    (245, 255, 250, 'CSS3 mintcream'),
    (255, 228, 225, 'CSS3 mistyrose'),
    (255, 228, 181, 'CSS3 moccasin'),
    (255, 222, 173, 'CSS3 navajowhite'),
    (  0,   0, 128, 'CSS3 navy'),
    (253, 245, 230, 'CSS3 oldlace'),
    (128, 128,   0, 'CSS3 olive'),
    (107, 142,  35, 'CSS3 olivedrab'),
    (255, 165,   0, 'CSS3 orange'),
    (255,  69,   0, 'CSS3 orangered'),
    (218, 112, 214, 'CSS3 orchid'),
    (238, 232, 170, 'CSS3 palegoldenrod'),
    (152, 251, 152, 'CSS3 palegreen'),
    (175, 238, 238, 'CSS3 paleturquoise'),
    (219, 112, 147, 'CSS3 palevioletred'),
    (255, 239, 213, 'CSS3 papayawhip'),
    (255, 218, 185, 'CSS3 peachpuff'),
    (205, 133,  63, 'CSS3 peru'),
    (255, 192, 203, 'CSS3 pink'),
    (221, 160, 221, 'CSS3 plum'),
    (176, 224, 230, 'CSS3 powderblue'),
    (128,   0, 128, 'CSS3 purple'),
    (255,   0,   0, 'CSS3 red'),
    (188, 143, 143, 'CSS3 rosybrown'),
    ( 65, 105, 225, 'CSS3 royalblue'),
    (139,  69,  19, 'CSS3 saddlebrown'),
    (250, 128, 114, 'CSS3 salmon'),
    (244, 164,  96, 'CSS3 sandybrown'),
    ( 46, 139,  87, 'CSS3 seagreen'),
    (255, 245, 238, 'CSS3 seashell'),
    (160,  82,  45, 'CSS3 sienna'),
    (192, 192, 192, 'CSS3 silver'),
    (135, 206, 235, 'CSS3 skyblue'),
    (106,  90, 205, 'CSS3 slateblue'),
    (112, 128, 144, 'CSS3 slategray'),
    (112, 128, 144, 'CSS3 slategrey'),
    (255, 250, 250, 'CSS3 snow'),
    (  0, 255, 127, 'CSS3 springgreen'),
    ( 70, 130, 180, 'CSS3 steelblue'),
    (210, 180, 140, 'CSS3 tan'),
    (  0, 128, 128, 'CSS3 teal'),
    (216, 191, 216, 'CSS3 thistle'),
    (255,  99,  71, 'CSS3 tomato'),
    ( 64, 224, 208, 'CSS3 turquoise'),
    (238, 130, 238, 'CSS3 violet'),
    (245, 222, 179, 'CSS3 wheat'),
    (255, 255, 255, 'CSS3 white'),
    (245, 245, 245, 'CSS3 whitesmoke'),
    (255, 255,   0, 'CSS3 yellow'),
    (154, 205,  50, 'CSS3 yellowgreen')
;
