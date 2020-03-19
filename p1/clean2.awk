BEGIN {
  ofile = "out.html"
  print "<style>" > ofile
  print "  body { margin:10px }" > ofile
  print "</style>" > ofile
  print "<body>" > ofile
  print "<h2>2020 ALIEN INVASION</h2>" > ofile
  print "UFO sitings per state." > ofile
  print "Invasions appear chronologically, and the alien grows as the number of invasions increases." > ofile
  print "A white flag of surrender is raised when the number of aliens is equal to the number of  seats that state has in the US House of Representatives." > ofile
  print "<br><br><br>" > ofile
  print "<script>" > ofile

  AL = 0; AK = 0; AZ = 0; AR = 0; CA = 0; CO = 0; CT = 0; DE = 0; FL = 0; GA = 0
  HI = 0; ID = 0; IL = 0; IN = 0; IA = 0; KS = 0; KY = 0; LA = 0; ME = 0; MD = 0
  MA = 0; MI = 0; MN = 0; MS = 0; MO = 0; MT = 0; NE = 0; NV = 0; NH = 0; NJ = 0
  NM = 0; NY = 0; NC = 0; ND = 0; OH = 0; OK = 0; OR = 0; PA = 0; RI = 0; SC = 0
  SD = 0; TN = 0; TX = 0; UT = 0; VT = 0; VA = 0; WA = 0; WV = 0; WI = 0; WY = 0

  # we are going to go through every table entry and find the state it's associated with
  # we keep a counter for each state
  # and we use the array ordered to keep track of what state had the nth ufo siting, ie ordered[n]=2 means the nth siting was in the 2nd state, which is AZ
  order = 0
  while (getline < "ndxe202002.html") {

    if ($0~/>AL</) { AL = AL + 1; ordered[order] = 0; order = order + 1}; if ($0~/>AK</) { AK = AK + 1; ordered[order] = 1; order = order + 1}; if ($0~/>AZ</) { AZ = AZ + 1; ordered[order] = 2; order = order + 1}; if ($0~/>AR</) { AR = AR + 1; ordered[order] = 3; order = order + 1}; if ($0~/>CA</) { CA = CA + 1; ordered[order] = 4; order = order + 1}; if ($0~/>CO</) { CO = CO + 1; ordered[order] = 5; order = order + 1}; if ($0~/>CT</) { CT = CT + 1; ordered[order] = 6; order = order + 1}; if ($0~/>DE</) { DE = DE + 1; ordered[order] = 7; order = order + 1}; if ($0~/>FL</) { FL = FL + 1; ordered[order] = 8; order = order + 1}; if ($0~/>GA</) { GA = GA + 1; ordered[order] = 9; order = order + 1}

    if ($0~/>HI</) { HI = HI + 1; ordered[order] = 10; order = order + 1}; if ($0~/>ID</) { ID = ID + 1; ordered[order] = 11; order = order + 1}; if ($0~/>IL</) { IL = IL + 1; ordered[order] = 12; order = order + 1}; if ($0~/>IN</) { IN = IN + 1; ordered[order] = 13; order = order + 1}; if ($0~/>IA</) { IA = IA + 1; ordered[order] = 14; order = order + 1}; if ($0~/>KS</) { KS = KS + 1; ordered[order] = 15; order = order + 1}; if ($0~/>KY</) { KY = KY + 1; ordered[order] = 16; order = order + 1}; if ($0~/>LA</) { LA = LA + 1; ordered[order] = 17; order = order + 1}; if ($0~/>ME</) { ME = ME + 1; ordered[order] = 18; order = order + 1}; if ($0~/>MD</) { MD = MD + 1; ordered[order] = 19; order = order + 1}

    if ($0~/>MA</) { MA = MA + 1; ordered[order] = 20; order = order + 1}; if ($0~/>MI</) { MI = MI + 1; ordered[order] = 21; order = order + 1}; if ($0~/>MN</) { MN = MN + 1; ordered[order] = 22; order = order + 1}; if ($0~/>MS</) { MS = MS + 1; ordered[order] = 23; order = order + 1}; if ($0~/>MO</) { MO = MO + 1; ordered[order] = 24; order = order + 1}; if ($0~/>MT</) { MT = MT + 1; ordered[order] = 25; order = order + 1}; if ($0~/>NE</) { NE = NE + 1; ordered[order] = 26; order = order + 1}; if ($0~/>NV</) { NV = NV + 1; ordered[order] = 27; order = order + 1}; if ($0~/>NH</) { NH = NH + 1; ordered[order] = 28; order = order + 1}; if ($0~/>NJ</) { NJ = NJ + 1; ordered[order] = 29; order = order + 1}

    if ($0~/>NM</) { NM = NM + 1; ordered[order] = 30; order = order + 1}; if ($0~/>NY</) { NY = NY + 1; ordered[order] = 31; order = order + 1}; if ($0~/>NC</) { NC = NC + 1; ordered[order] = 32; order = order + 1}; if ($0~/>ND</) { ND = ND + 1; ordered[order] = 33; order = order + 1}; if ($0~/>OH</) { OH = OH + 1; ordered[order] = 34; order = order + 1}; if ($0~/>OK</) { OK = OK + 1; ordered[order] = 35; order = order + 1}; if ($0~/>OR</) { OR = OR + 1; ordered[order] = 36; order = order + 1}; if ($0~/>PA</) { PA = PA + 1; ordered[order] = 37; order = order + 1}; if ($0~/>RI</) { RI = RI + 1; ordered[order] = 38; order = order + 1}; if ($0~/>SC</) { SC = SC + 1; ordered[order] = 39; order = order + 1}

    if ($0~/>SD</) { SD = SD + 1; ordered[order] = 40; order = order + 1}; if ($0~/>TN</) { TN = TN + 1; ordered[order] = 41; order = order + 1}; if ($0~/>TX</) { TX = TX + 1; ordered[order] = 42; order = order + 1}; if ($0~/>UT</) { UT = UT + 1; ordered[order] = 43; order = order + 1}; if ($0~/>VT</) { VT = VT + 1; ordered[order] = 44; order = order + 1}; if ($0~/>VA</) { VA = VA + 1; ordered[order] = 45; order = order + 1}; if ($0~/>WA</) { WA = WA + 1; ordered[order] = 46; order = order + 1}; if ($0~/>WV</) { WV = WV + 1; ordered[order] = 47; order = order + 1}; if ($0~/>WI</) { WI = WI + 1; ordered[order] = 48; order = order + 1}; if ($0~/>WY</) { WY = WY + 1; ordered[order] = 49; order = order + 1}

  }; close("ndxe202002.html")

  while (getline < "ndxe202001.html") {

    if ($0~/>AL</) { AL = AL + 1; ordered[order] = 0; order = order + 1}; if ($0~/>AK</) { AK = AK + 1; ordered[order] = 1; order = order + 1}; if ($0~/>AZ</) { AZ = AZ + 1; ordered[order] = 2; order = order + 1}; if ($0~/>AR</) { AR = AR + 1; ordered[order] = 3; order = order + 1}; if ($0~/>CA</) { CA = CA + 1; ordered[order] = 4; order = order + 1}; if ($0~/>CO</) { CO = CO + 1; ordered[order] = 5; order = order + 1}; if ($0~/>CT</) { CT = CT + 1; ordered[order] = 6; order = order + 1}; if ($0~/>DE</) { DE = DE + 1; ordered[order] = 7; order = order + 1}; if ($0~/>FL</) { FL = FL + 1; ordered[order] = 8; order = order + 1}; if ($0~/>GA</) { GA = GA + 1; ordered[order] = 9; order = order + 1}

    if ($0~/>HI</) { HI = HI + 1; ordered[order] = 10; order = order + 1}; if ($0~/>ID</) { ID = ID + 1; ordered[order] = 11; order = order + 1}; if ($0~/>IL</) { IL = IL + 1; ordered[order] = 12; order = order + 1}; if ($0~/>IN</) { IN = IN + 1; ordered[order] = 13; order = order + 1}; if ($0~/>IA</) { IA = IA + 1; ordered[order] = 14; order = order + 1}; if ($0~/>KS</) { KS = KS + 1; ordered[order] = 15; order = order + 1}; if ($0~/>KY</) { KY = KY + 1; ordered[order] = 16; order = order + 1}; if ($0~/>LA</) { LA = LA + 1; ordered[order] = 17; order = order + 1}; if ($0~/>ME</) { ME = ME + 1; ordered[order] = 18; order = order + 1}; if ($0~/>MD</) { MD = MD + 1; ordered[order] = 19; order = order + 1}

    if ($0~/>MA</) { MA = MA + 1; ordered[order] = 20; order = order + 1}; if ($0~/>MI</) { MI = MI + 1; ordered[order] = 21; order = order + 1}; if ($0~/>MN</) { MN = MN + 1; ordered[order] = 22; order = order + 1}; if ($0~/>MS</) { MS = MS + 1; ordered[order] = 23; order = order + 1}; if ($0~/>MO</) { MO = MO + 1; ordered[order] = 24; order = order + 1}; if ($0~/>MT</) { MT = MT + 1; ordered[order] = 25; order = order + 1}; if ($0~/>NE</) { NE = NE + 1; ordered[order] = 26; order = order + 1}; if ($0~/>NV</) { NV = NV + 1; ordered[order] = 27; order = order + 1}; if ($0~/>NH</) { NH = NH + 1; ordered[order] = 28; order = order + 1}; if ($0~/>NJ</) { NJ = NJ + 1; ordered[order] = 29; order = order + 1}

    if ($0~/>NM</) { NM = NM + 1; ordered[order] = 30; order = order + 1}; if ($0~/>NY</) { NY = NY + 1; ordered[order] = 31; order = order + 1}; if ($0~/>NC</) { NC = NC + 1; ordered[order] = 32; order = order + 1}; if ($0~/>ND</) { ND = ND + 1; ordered[order] = 33; order = order + 1}; if ($0~/>OH</) { OH = OH + 1; ordered[order] = 34; order = order + 1}; if ($0~/>OK</) { OK = OK + 1; ordered[order] = 35; order = order + 1}; if ($0~/>OR</) { OR = OR + 1; ordered[order] = 36; order = order + 1}; if ($0~/>PA</) { PA = PA + 1; ordered[order] = 37; order = order + 1}; if ($0~/>RI</) { RI = RI + 1; ordered[order] = 38; order = order + 1}; if ($0~/>SC</) { SC = SC + 1; ordered[order] = 39; order = order + 1}

    if ($0~/>SD</) { SD = SD + 1; ordered[order] = 40; order = order + 1}; if ($0~/>TN</) { TN = TN + 1; ordered[order] = 41; order = order + 1}; if ($0~/>TX</) { TX = TX + 1; ordered[order] = 42; order = order + 1}; if ($0~/>UT</) { UT = UT + 1; ordered[order] = 43; order = order + 1}; if ($0~/>VT</) { VT = VT + 1; ordered[order] = 44; order = order + 1}; if ($0~/>VA</) { VA = VA + 1; ordered[order] = 45; order = order + 1}; if ($0~/>WA</) { WA = WA + 1; ordered[order] = 46; order = order + 1}; if ($0~/>WV</) { WV = WV + 1; ordered[order] = 47; order = order + 1}; if ($0~/>WI</) { WI = WI + 1; ordered[order] = 48; order = order + 1}; if ($0~/>WY</) { WY = WY + 1; ordered[order] = 49; order = order + 1}

  }; close("ndxe202001.html")

  # count total sitings
  total = AL + AK + AZ + AR + CA + CO + CT + DE + FL + GA + HI + ID + IL + IN + IA + KS + KY + LA + ME + MD + MA + MI + MN + MS + MO + MT + NE + NV + NH + NJ + NM + NY + NC + ND + OH + OK + OR + PA + RI + SC + SD + TN + TX + UT + VT + VA + WA + WV + WI + WY;

  # for each alien, specify how much time should pass before it apppears on the map
  # since ordered records them from most recent to least recent, and we want to display the sitings chronologically,
  # we must work backwards, ie the first ufo siting in ordered should have the longest time to appear
  for(alien = 0; alien < total; alien++) {
    time = (total-alien) * 50
    print "setTimeout(function(){ $('#img" alien "').show(); }, " time ");" > ofile
  }
  print "setTimeout(function(){ $('#end').show(); }, " (total+1)*50 ");" > ofile
  print "</script>" > ofile
  print "<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>" > ofile

  # i don't think i ended up using this but she took a decent amount of time to type out so i'm keeping her :)
  states[0] = AL; states[1] = AK; states[2] = AZ; states[3] = AR; states[4] = CA; states[5] = CO; states[6] = CT; states[7] = DE; states[8] = FL; states[9] = GA
  states[10] = HI; states[11] = ID; states[12] = IL; states[13] = IN; states[14] = IA; states[15] = KS; states[16] = KY; states[17] = LA; states[18] = ME; states[19] = MD
  states[20] = MA; states[21] = MI; states[22] = MN; states[23] = MS; states[24] = MO; states[25] = MT; states[26] = NE; states[27] = NV; states[28] = NH; states[29] = NJ
  states[30] = NM; states[31] = NY; states[32] = NC; states[33] = ND; states[34] = OH; states[35] = OK; states[36] = OR; states[37] = PA; states[38] = RI; states[39] = SC
  states[40] = SD; states[41] = TN; states[42] = TX; states[43] = UT; states[44] = VT; states[45] = VA; states[46] = WA; states[47] = WV; states[48] = WI; states[49] = WY

  FS = "\t"
  # get x (longitude) and y (latitude) coordinates of each state
  # as per the states array above, state 0 is AL, 1 AK, 2 AZ, ...
  statecounter = 0
  while (getline < "statedata") {
    x[statecounter] = $NF
    y[statecounter] = $(NF-1)
    statecounter = statecounter + 1
  }; close("statedata")

  # get number of members of the house of representatives of each state
  # once again state 0 is AL, 1 AK, 2 AZ, ...
  statecounter = 0
  while (getline < "representatives") {
    rep[statecounter] = $NF
    names[statecounter] = $(NF-1)
    statecounter = statecounter + 1
  }; close("representatives")

  # maintain a counter per state
  # once again 0 is AL, 1 AK, 2 AZ, ...
  for(i = 0; i < 50; i++) {
    done[i] = 0
  }

  # a boolean for whether that state has been conquered
  for(i = 0; i < 50; i++) {
    conquered[i] = 0
  }

 # print "<img style='position:absolute;left:305;top:150;width:850;height:525' src='https://i.pinimg.com/originals/e4/d7/69/e4d769742a76da9dba84a36ca541413f.jpg'/>" > ofile
  print "<img style='position:absolute;left:305;top:165;width:850;height:525' src='https://socviz.co/dataviz-pdfl_files/figure-html4/ch-07-firstmap-1.png'/>" > ofile
  # once again, we have to generate the images in the opposite order that they are listed in "ordered" so that the sitings are chronological
  for(i = total-1; i >= 0; i--) {
    print "<div class='col-xs-12' style='display:none;' id='img" i "'><div class='col-xs-5'>" > ofile
    done[ordered[i]] = done[ordered[i]] + 1
    print "<img style='position:absolute;left:" (310+13*(130+x[ordered[i]])-done[ordered[i]]) ";top:" (160+20*(50-y[ordered[i]])-done[ordered[i]]) ";width:" 1.5*done[ordered[i]] ";height:" 1.5*done[ordered[i]] "' src='https://cdn.shopify.com/s/files/1/1061/1924/products/Alien_Emoji_Icon_2_grande.png?v=1571606090'/>" > ofile
    if(done[ordered[i]] >= rep[ordered[i]]) {
      print "<img style='position:absolute;left:" (310+13*(130+x[ordered[i]])-2*done[ordered[i]]) ";top:" (160+20*(50-y[ordered[i]])-2*done[ordered[i]]) ";width:" 3.76*done[ordered[i]] ";height:" 2.3*done[ordered[i]] "' src='https://i.pinimg.com/originals/b8/5a/2e/b85a2ed5eb648914c73338b34e5e7b63.gif'/>" > ofile
    }
    if(done[ordered[i]] == rep[ordered[i]]) {
      print "<p><font color='red'>" names[ordered[i]] " conquered!</font></p>" > ofile
      conquered[ordered[i]] = 1
    }
    print "</div></div>" > ofile
  }

  print "<div class='col-xs-12' style='display:none;' id='end'><div class='col-xs-5'>" > ofile
  print "<br><br><br>" > ofile
  yPos = 200
  for(i = 0; i < 50; i++) {
    if(conquered[i] == 0) {
      print "<p style='position:absolute;top:" yPos ";right:0'><font color='blue' size='6'>" names[i] " survived.</font></p>" > ofile
      yPos = yPos + 50
    }
  }
  print "</div></div>" > ofile
  print "</body>" > ofile
}
