#! /usr/bin/awk -f
BEGIN {
  pollResults = "/tmp/results"
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
  print "<h1>Movie Poll</h1>"
  print "<FORM METHOD=GET ACTION='moviepoll.cgi'>"
  print "Enter another movie to search for:"
  print "<input name='Title' size=20 maxlength=50>"
  print "<P>"
  print "<INPUT TYPE=submit value='Search'>"
  print "</FORM>"
  print "<br>"
  movieSearch = 0
  print "<FORM METHOD=GET ACTION='moviepoll.cgi'>"
  userinput = ENVIRON["QUERY_STRING"]
  if(userinput ~ "Title=") movieSearch = 1
if(movieSearch == 1) {
  sub(/Title=/,"",userinput)
  sub(/+/,"%20",userinput)
  link = "metacritic.com/search/all/"userinput"/results"
  system("wget -O /tmp/sey13.search.txt "link)
  line = 13
  special = 0
  FS = ">"
  while (getline < "/tmp/sey13.search.txt" > 0) {
    if($1 ~ /<h3 class="product_title basic_stat/) {
      line = 0;
    }
    line = line + 1
    if(line == 2) {
      link = $1
      gsub(/^[ \t]+/,"",link)
      sub(/<a href="/,"",link)
      sub(/"/,"",link)
      if(link != "") {
        link = "metacritic.com"link
        print "<input type='radio' name='Link' value='"link"'>"
      }
    }
    if(line == 3) {
      if(NF == 3) {
        title = $3
      }
      else { title = $1 }
      gsub(/^[ \t]+/,"",title)
      if(title != "") {
        print "<label for='"link"'><b>"title"</b></label><br>"
      }
    }
    if(line == 7) {
      if($1 ~ /<span class="platform"/) {
        line = line - 1
      }
    }
    if(line == 8) {
      datetyperating = $1
      if($1 ~ /<span class="label"/) {
        datetyperating = "empty"
      }
      gsub(/^[ \t]+/,"",datetyperating)
      gsub(/<\/p/,"",datetyperating)
      gsub(/[ \t]+$/,"",datetyperating)
      if(datetyperating != "empty" && datetyperating != "") {
        print "<p>"datetyperating"</p>"
      }
    }
    if(line == 11) {
      description = $2
      gsub(/^[ \t]+/,"",description)
      gsub(/<\/p/,"",description)
      gsub(/"/,"",description)
      if(description != "") {
        print "<p>"description"</p>"
      } else {
        special = 1
      }
    }
    if(line == 12 && special == 1) {
      description = $2
      gsub(/^[ \t]+/,"",description)
      gsub(/<\/p/,"",description)
      gsub(/"/,"",description)
      if(description != "") {
        print "<p>"description"</p>"
      }

      special = 0
    }
  }
  print "<br>"
  print "<input name='Name' size=20 maxlength=50>"
  print "<br>"
  print "<input type='submit' value='Vote'>"
  print "</form>"
} else {
  found = 0
  print "<h1>Votes</h1>"
  split(userinput,input,"&")
  sub(/Link=/,"",input[1])
  gsub(/%2F/,"/",input[1])
  choice = input[1]
  if(choice ~ /Name=/) choice = "NO_CHOICE"
  runtimeCount = 2
  if(choice != "NO_CHOICE") {
    system("wget -O /tmp/sey13.choice.txt "choice)
    FS = ">"
    foundscore = 0
    while (getline < "/tmp/sey13.choice.txt" > 0) {
      if($1 ~ /<title/) {
        movietitle = $2
        sub(/>/,"",movietitle)
        sub(/ Reviews - Metacritic<\/title/,"",movietitle)
      }
      if($2 ~ /Runtime/) {
        runtimeCount = 0
      }
      if(runtimeCount == 1) {
        runtime = $2
        sub(/>/,"",runtime)
        sub(/:/,"",runtime)
        sub(/<\/span/,"",runtime)
      }
      runtimeCount = runtimeCount + 1
      # looking for: metascore_w larger movie negative, mixed, positive
      if(foundscore != 1 && $1 ~ /metascore_w user larger/) {
        userscore = $2
        sub(/>/,"",userscore)
        sub(/<\/span/,"",userscore)
        foundscore = 1
      }
    }
  }
  sub(/Name=/,"",input[2])
  name = input[2]
  if(name == "") name = "anonymous"
  Dfile = "/tmp/sey13.votes9"
  FS = "\t"
  while (getline < Dfile > 0) {
    if ($1 == choice && !($3 ~ name)) {
      votes = $2
      votes = votes + 1
      names = $3
      print $1"\t"votes"\t"names", "name"\t"$4"\t"$5"\t"$6 > Dfile
      found = 1
      done = 0
      print "<p>"$4" ("$5" runtime with user score "$6" out of 10) has "votes" votes by "names", "name"</p>"
    } else if ($1 != choice) {
      print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6 > Dfile
      print "<p>"$4" ("$5" runtime with user score "$6" out of 10) has "$2" votes by " $3"</p>"
    }
  }
  if (found == 0 && choice != "NO_CHOICE") {
    print choice"\t1\t"name"\t"movietitle"\t"runtime"\t"userscore > Dfile
#    print movietitle" "runtime" "userscore" "name
    print "<p>"movietitle" ("runtime" runtime with user score "userscore" out of 10) has 1 vote by "name"</p>"
  }
}
  print "</body>"
  print "</html>"
}
