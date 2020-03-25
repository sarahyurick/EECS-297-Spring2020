#! /usr/bin/awk -f
BEGIN {
  print "Content-type: text/html\n"
  print "<html>"
  print "<head>"
  print "<style>"
  print "table { border-collapse: collapse; width: 100%; }"
  print "th, td { text-align: left; padding: 8px; border-left: 1px solid #4CAF50; border-right: 1px solid #4CAF50; }"
  print "tr:nth-child(even){background-color: #f2f2f2}"
  print "th { background-color: #4CAF50; color: white; } "
  print "</style>"
  print "</head>"
  print "<body>"
  print "<h1>Sam's Club, Walmart, and Dollar General online stock</h1>"
  print "<FORM METHOD=GET ACTION='result.cgi'>"
  print "Enter the item you want:"
  print "<input name='Item' size=20 maxlength=50>"
  print "<P>"
  print "<INPUT TYPE=submit value='Submit'>"
  print "</FORM>"

  print "<br>"
  print "<p><font color='red'>Beware un-updated data from Sam's Club</font></p>"
  print "<table><tr>"
  print "<th><img src='https://www.logolynx.com/images/logolynx/83/8371115975cd94aac88eada75361c486.png' width=115 height=50></th>"
  print "<th><img src='https://cdn.corporate.walmart.com/dims4/WMT/c2bbbe9/2147483647/strip/true/crop/2389x930+0+0/resize/1446x563!/quality/90/?url=https%3A%2F%2Fcdn.corporate.walmart.com%2Fd6%2Fe7%2F48e91bac4a8ca8f22985b3682370%2Fwalmart-logos-lockupwtag-horiz-blu-rgb.png' width=125 height=70></th>"
  print "<th><img src='https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Dollar_General_logo.svg/1280px-Dollar_General_logo.svg.png' width=125 height=40></th>"
  print "</tr><tr>"

  # SAMS CLUB DATA
  userinput = ENVIRON["QUERY_STRING"]
  sub(/Item=/,"",userinput);
  sub(/+/,"%20",userinput);
  # links must take this format: https://www.samsclub.com/s/toilet%20paper
  samslink = "http://www.samsclub.com/s/" userinput
#  print "Need to wget this link: "
 # print "<a href='" samslink "'/>" samslink "</a>"

  # wget -O sams -U Mozilla/5.0 'samslink'
  # and then
  # cat sams | awk 'gsub(/"seoUrl":"/,"\n")' > samsclean
  sn = 0;
  ss = 0;
  FS=",\"";
  system("wget -O /tmp/sey13.sams1.txt -U Mozilla/5.0 "samslink);
 #  system("curl '"samslink"' > /tmp/sey13.sams1.txt");
 # system("lynx -source '"samslink"' > /tmp/sey13.sams1.txt");
 # system("lynx -dump '"samslink"' > /tmp/sey13.sams1.txt");
  system("cat /tmp/sey13.sams1.txt | awk 'gsub(/\"seoUrl\":\"/,\"\\n\")' > /tmp/sey13.sams2.txt")
  while (getline < "/tmp/sey13.sams2.txt" > 0) {
    sname[sn] = $1
    for(i=1; i<NF; i++) {
      if($i ~ /inStockOnline":true/) {
        sstock[ss] = "IN STOCK";
      }
      if($i ~ /inStockOnline":false/) {
        sstock[ss] = "OUT OF STOCK";
      }
    }
    sn = sn + 1;
    ss = ss + 1;
  }

  # WALMART DATA
  userinput = ENVIRON["QUERY_STRING"]
  sub(/Item=/,"",userinput);
  sub(/+/,"%20",userinput);
  walmartlink = "walmart.com/search/?query=" userinput
  # wget -O walmart -U Mozilla/5.0 'walmartlink'
  # and then
  # cat walmart | awk 'gsub(/productPageUrl":"/,"\n")' > walmartclean
  system("wget -O /tmp/sey13.walmart1.txt -U Mozilla/5.0 "walmartlink);
  system("cat /tmp/sey13.walmart1.txt | awk 'gsub(/productPageUrl\":\"/,\"\\n\")' > /tmp/sey13.walmart2.txt")
  wn = 0;
  ws = 0;
  FS=",\"";
  while (getline < "/tmp/sey13.walmart2.txt" > 0) {
    wname[wn] = $1
    wstock[ws] = "MAYBE";
    for(i=1; i<NF; i++) {
      if($i ~ /primaryOffer":/) {
        wstock[ws] = "YES";
      }
      if($i ~ /displayFlags":\["IN_STORE_ONLY"\]/) {
        wstock[ws] = "NO";
      }
      if($i ~ /displayFlags":\["OUT_OF_STOCK"\]/) {
        wstock[ws] = "NO";
      }
    }
    wn = wn + 1;
    ws = ws + 1;
  }

  # DOLLAR GENERAL DATA
  userinput = ENVIRON["QUERY_STRING"]
  sub(/Item=/,"",userinput);
  dollarlink = "https://www.dollargeneral.com/catalogsearch/result/?q=" userinput
  system("wget -O /tmp/sey13.dollar1.txt "dollarlink);
  dn = 0;
  ds = 0;
  FS=">"
  while (getline < "/tmp/sey13.dollar1.txt" > 0) {
    if($1 ~ /<a class="product-item-link" href="/) {
      dname[dn] = $1 # should be of the form <a class="product-item-link" href="https://www.dollargeneral.com/charminr-ultra-strongtm-toilet-paper-6-mega-plus-roll-pack.html"
      dn = dn + 1;
    }
    if($2 ~ /Add to Cart<\/span/) {
      dstock[ds] = "YES";
      ds = ds + 1;
    }
    if($3 ~ /Out of Stock/) {
      dstock[ds] = "NO";
      ds = ds + 1;
    }
    if($1 ~ /Available In Store Only/) {
      dstock[ds] = "NO";
      ds = ds + 1;
    }
  }

  # putting the values in the table:
  # first need to get all of the items from each store
  scount = 0;
  for(i=0; i<ss; i++) {
    if(sstock[i] == "IN STOCK") {
      sitem[scount] = sname[i];
      scount = scount + 1;
    }
  }
  wcount = 0;
  for(i=0; i<ws; i++) {
    if(wstock[i] == "YES") {
      witem[wcount] = wname[i];
      wcount = wcount + 1;
    }
  }
  dcount = 0;
  for(i=0; i<ds; i++) {
    if(dstock[i] == "YES") {
      ditem[dcount] = dname[i];
      dcount = dcount + 1;
    }
  }

  # figure out which has the most items
  rows = 0;
  winner;
  if(scount > rows) { rows = scount; winner = "Sam's Club"}
  if(wcount > rows) { rows = wcount; winner = "Walmart"}
  if(dcount > rows) { rows = dcount; winner = "Dollar General"}

  for(i=0; i<rows; i++) {
    print "<tr>"

    name = sitem[i]
    sub(/\/p\//,"",name)
    gsub(/-/," ",name)
    gsub(/\/.*/,"",name)
    link = sitem[i]
    gsub(/"/,"",link)
    print "<td><a href='https://www.samsclub.com"link"'>"name"</a></td>"

    name = witem[i]
    sub(/\/ip\//,"",name)
    gsub(/-/," ",name)
    gsub(/\/.*/,"",name)
    sub(/":"/,"",name)
    link = witem[i]
    gsub(/"/,"",link)
    print "<td><a href='https://www.walmart.com"link"'>"name"</a></td>"

    name = ditem[i]
    # <a class="product-item-link" href="https://www.dollargeneral.com/charminr-ultra-strongtm-toilet-paper-6-mega-plus-roll-pack.html"
    sub(/<a class="product-item-link" href="/,"",name)
    gsub(/"/,"",name)
    link = name
    sub(/https:\/\/www\.dollargeneral\.com\//,"", name)
    gsub(/-/," ", name)
    sub(/\.html/,"",name)
    print "<td><a href='"link"'>"name"</a></td>"
    print "</tr>"
  }

  userinput = ENVIRON["QUERY_STRING"]
  sub(/Item=/,"",userinput);
  sub(/+/," ",userinput);
  print winner " had the most results: " rows " " userinput " products in stock."
  print "</table>"
  print "</body>"
  print "</html>"

}
