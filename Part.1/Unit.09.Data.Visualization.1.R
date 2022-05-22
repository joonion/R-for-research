# Unit 9. Data Visualization (1) Basic Graphs

str(cars)
plot(cars)
plot(cars, pch = 19)
plot(cars, pch = 19, col = "tomato")
lm(dist ~ speed, data = cars)
abline(-17.579, 3.932)
abline(-17.579, 3.932, col = "darkblue")
abline(-17.579, 3.932, col = "darkblue", lwd = 3, lty = 3)

grep("1", colors())
col <- colors()[-grep("1", colors())]
col
grep("2", col)
col <- col[-grep("2", col)]
col
col <- col[-grep("3", col)]
col
col <- col[-grep("4", col)]
col
col <- col[-grep("gray", col)]
col
col <- col[-grep("grey", col)]
col
col <- col[-grep("light", col)]
col
col <- col[-grep("dark", col)]
col
col <- col[-grep("medium", col)]
col


#[1] "white"          "aliceblue"      "antiquewhite"   "aquamarine"     "azure"          "beige"         
#[7] "bisque"         "black"          "blanchedalmond" "blue"           "blueviolet"     "brown"         
#[13] "burlywood"      "cadetblue"      "chartreuse"     "chocolate"      "coral"          "cornflowerblue"
#[19] "cornsilk"       "cyan"           "deeppink"       "deepskyblue"    "dodgerblue"     "firebrick"     
#[25] "floralwhite"    "forestgreen"    "gainsboro"      "ghostwhite"     "gold"           "goldenrod"     
#[31] "green"          "greenyellow"    "honeydew"       "hotpink"        "indianred"      "ivory"         
#[37] "khaki"          "lavender"       "lavenderblush"  "lawngreen"      "lemonchiffon"   "limegreen"     
#[43] "linen"          "magenta"        "maroon"         "midnightblue"   "mintcream"      "mistyrose"     
#[49] "moccasin"       "navajowhite"    "navy"           "navyblue"       "oldlace"        "olivedrab"     
#[55] "orange"         "orangered"      "orchid"         "palegoldenrod"  "palegreen"      "paleturquoise" 
#[61] "palevioletred"  "papayawhip"     "peachpuff"      "peru"           "pink"           "plum"          
#[67] "powderblue"     "purple"         "red"            "rosybrown"      "royalblue"      "saddlebrown"   
#[73] "salmon"         "sandybrown"     "seagreen"       "seashell"       "sienna"         "skyblue"       
#[79] "slateblue"      "snow"           "springgreen"    "steelblue"      "tan"            "thistle"       
#[85] "tomato"         "turquoise"      "violet"         "violetred"      "wheat"          "whitesmoke"    
#[91] "yellow"         "yellowgreen"   



