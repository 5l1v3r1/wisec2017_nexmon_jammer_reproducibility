% 106/40L
% chanspec: 0xd86a
% tssi-idle_tssi    ipa     txlpf   pga     pad     txgm    bbmult   
tssi_106_40L = [ ...
  -400 0 0 0 0 0 0; ... % idle_tssi
  911 255 0 255 255 255 51; ... % tssi[0]
  911 255 0 255 255 255 49; ... % tssi[1]
  911 255 0 255 255 255 48; ... % tssi[2]
  911 255 0 247 255 255 48; ... % tssi[3]
  911 255 0 238 255 255 48; ... % tssi[4]
  911 255 0 230 255 255 48; ... % tssi[5]
  911 255 0 223 255 255 48; ... % tssi[6]
  911 255 0 215 255 255 48; ... % tssi[7]
  911 255 0 207 255 255 47; ... % tssi[8]
  911 255 0 201 255 255 47; ... % tssi[9]
  911 255 0 194 255 255 48; ... % tssi[10]
  911 255 0 187 255 255 48; ... % tssi[11]
  911 255 0 182 255 255 49; ... % tssi[12]
  911 255 0 177 255 255 48; ... % tssi[13]
  911 255 0 170 255 255 48; ... % tssi[14]
  911 255 0 165 255 255 48; ... % tssi[15]
  911 255 0 160 255 255 48; ... % tssi[16]
  911 255 0 155 255 255 48; ... % tssi[17]
  903 255 0 149 255 255 48; ... % tssi[18]
  895 255 0 145 255 255 48; ... % tssi[19]
  891 255 0 141 255 255 48; ... % tssi[20]
  880 255 0 136 255 255 48; ... % tssi[21]
  875 255 0 133 255 255 48; ... % tssi[22]
  862 255 0 128 255 255 48; ... % tssi[23]
  851 255 0 124 255 255 47; ... % tssi[24]
  842 255 0 120 255 255 47; ... % tssi[25]
  830 255 0 117 255 255 48; ... % tssi[26]
  817 255 0 113 255 255 48; ... % tssi[27]
  807 255 0 110 255 255 48; ... % tssi[28]
  791 255 0 106 255 255 47; ... % tssi[29]
  773 255 0 103 255 255 48; ... % tssi[30]
  756 255 0 100 255 255 48; ... % tssi[31]
  743 255 0 97 255 255 47; ... % tssi[32]
  728 255 0 94 255 255 48; ... % tssi[33]
  712 255 0 91 255 255 48; ... % tssi[34]
  690 255 0 88 255 255 48; ... % tssi[35]
  678 255 0 86 255 255 48; ... % tssi[36]
  657 255 0 83 255 255 48; ... % tssi[37]
  644 255 0 81 255 255 48; ... % tssi[38]
  625 255 0 78 255 255 48; ... % tssi[39]
  611 255 0 76 255 255 48; ... % tssi[40]
  597 255 0 74 255 255 48; ... % tssi[41]
  582 255 0 72 255 255 48; ... % tssi[42]
  567 255 0 70 255 255 48; ... % tssi[43]
  551 255 0 68 255 255 48; ... % tssi[44]
  529 255 0 65 255 255 48; ... % tssi[45]
  515 255 0 63 255 255 48; ... % tssi[46]
  498 255 0 61 255 255 48; ... % tssi[47]
  483 255 0 59 255 255 47; ... % tssi[48]
  477 255 0 58 255 255 47; ... % tssi[49]
  459 255 0 56 255 255 47; ... % tssi[50]
  452 255 0 55 255 255 47; ... % tssi[51]
  435 255 0 53 255 255 48; ... % tssi[52]
  418 255 0 51 255 255 48; ... % tssi[53]
  410 255 0 50 255 255 48; ... % tssi[54]
  394 255 0 48 255 255 48; ... % tssi[55]
  391 255 0 47 255 255 48; ... % tssi[56]
  379 255 0 46 255 255 47; ... % tssi[57]
  363 255 0 44 255 255 48; ... % tssi[58]
  354 255 0 43 255 255 48; ... % tssi[59]
  346 255 0 42 255 255 47; ... % tssi[60]
  327 255 0 40 255 255 48; ... % tssi[61]
  319 255 0 39 255 255 48; ... % tssi[62]
  307 255 0 38 255 255 47; ... % tssi[63]
  308 255 0 38 255 255 48; ... % tssi[64]
  288 255 0 36 255 255 48; ... % tssi[65]
  280 255 0 35 255 255 48; ... % tssi[66]
  270 255 0 34 255 255 48; ... % tssi[67]
  262 255 0 33 255 255 48; ... % tssi[68]
  251 255 0 32 255 255 48; ... % tssi[69]
  252 255 0 31 255 255 48; ... % tssi[70]
  237 255 0 30 255 255 48; ... % tssi[71]
  228 255 0 29 255 255 47; ... % tssi[72]
  220 255 0 28 255 255 48; ... % tssi[73]
  209 255 0 27 255 255 48; ... % tssi[74]
  200 255 0 26 255 255 48; ... % tssi[75]
  189 255 0 25 255 255 48; ... % tssi[76]
  190 255 0 25 255 255 48; ... % tssi[77]
  179 255 0 24 255 255 47; ... % tssi[78]
  170 255 0 23 255 255 48; ... % tssi[79]
  169 255 0 23 255 255 48; ... % tssi[80]
  158 255 0 22 255 255 48; ... % tssi[81]
  150 255 0 21 255 255 48; ... % tssi[82]
  148 255 0 21 255 255 47; ... % tssi[83]
  137 255 0 20 255 255 48; ... % tssi[84]
  138 255 0 20 255 255 48; ... % tssi[85]
  129 255 0 19 255 255 48; ... % tssi[86]
  118 255 0 18 255 255 48; ... % tssi[87]
  119 255 0 18 255 255 49; ... % tssi[88]
  108 255 0 17 255 255 48; ... % tssi[89]
  107 255 0 17 255 255 48; ... % tssi[90]
  98 255 0 16 255 255 47; ... % tssi[91]
  97 255 0 16 255 255 48; ... % tssi[92]
  92 255 0 15 255 255 47; ... % tssi[93]
  93 255 0 15 255 255 47; ... % tssi[94]
  82 255 0 14 255 255 48; ... % tssi[95]
  82 255 0 14 255 255 48; ... % tssi[96]
  82 255 0 14 255 255 48; ... % tssi[97]
  73 255 0 13 255 255 47; ... % tssi[98]
  72 255 0 13 255 255 49; ... % tssi[99]
  65 255 0 12 255 255 48; ... % tssi[100]
  64 255 0 12 255 255 48; ... % tssi[101]
  66 255 0 12 255 255 48; ... % tssi[102]
  57 255 0 11 255 255 46; ... % tssi[103]
  57 255 0 11 255 255 48; ... % tssi[104]
  47 255 0 10 255 255 47; ... % tssi[105]
  47 255 0 10 255 255 48; ... % tssi[106]
  47 255 0 10 255 255 47; ... % tssi[107]
  42 255 0 9 255 255 46; ... % tssi[108]
  41 255 0 9 255 255 45; ... % tssi[109]
  39 255 0 9 255 255 51; ... % tssi[110]
  40 255 0 9 255 255 49; ... % tssi[111]
  32 255 0 8 255 255 48; ... % tssi[112]
  33 255 0 8 255 255 46; ... % tssi[113]
  33 255 0 8 255 255 48; ... % tssi[114]
  31 255 0 8 255 255 46; ... % tssi[115]
  26 255 0 7 255 255 49; ... % tssi[116]
  24 255 0 7 255 255 48; ... % tssi[117]
  24 255 0 7 255 255 46; ... % tssi[118]
  25 255 0 7 255 255 48; ... % tssi[119]
  25 255 0 7 255 255 47; ... % tssi[120]
  18 255 0 6 255 255 45; ... % tssi[121]
  16 255 0 6 255 255 45; ... % tssi[122]
  19 255 0 6 255 255 43; ... % tssi[123]
  17 255 0 6 255 255 42; ... % tssi[124]
  18 255 0 6 255 255 41; ... % tssi[125]
  14 255 0 5 255 255 39; ... % tssi[126]
  14 255 0 5 255 255 39; ... % tssi[127]
];