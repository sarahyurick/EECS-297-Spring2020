For project 1, I created a visualization of UFO sitings across the USA
in 2020 so far (for the months of January and February).

The data was obtained from the National UFO Reporting Center
Monthly Report Indexes For 01/2020 and 02/2020.
This data can be found in ndxe202001.html an dndxe202002.html respectively.
They were downloaded with the wget command.
These files were very minimally cleaned with VI,
meaning that I used VI to remove excess garbage from the beginnings
and ends of the files.
I was originally going to clean these files more,
but then I realized that this was a lot of extra work
and that, since all tabular data was in the same html format,
it would be easier to take advantage of that format
in order to extract the data I wanted
(otherwise, it might've been tricky to figure out where there was missing data).
The data of interest is actually extracted in clean2.awk (see details below).

I also used data about the latitude and longitude coordinates of each state,
and the number of chairs that each state has in the House of Representatives,
which are stored as statedata and representatives, respectively.
To further satisfy the "data cleaning and extraction" requirements of the projec                                                                                                             t,
(aka to prove that I can clean files and that that's a generally good thing to d                                                                                                             o)
these were the files which I made very clean using VI.

When the site loads, the viewer sees a blank map of the USA.
Gradually, alien emojis appear scattered in each state on the map
as sitings are logged chronologically (in the order listed on the site).
Once the number of UFO sitings in that state reaches the number of
chairs that state has in the House of Representatives,
a waving flag appears with the alien emoji, indicating surrender,
and the message "Maine surrendered!" for example,
appears in red on the left of the page.

Once all of the data from the National UFO Reporting Center is parsed,
a list of states which survived the alien invasion,
i.e. the states whose total number of UFO sitings was less than
the number of members of the House of Representatives that it has,
appears in blue on the right of the page.

The code depends on counters for each state.
There are counters for the number of sitings per state
as well as a counter which keeps of the order of the sitings
(i.e. the 200th siting was in Maine, etc.).

The resulting page is found in out.html
out.html was scripted by the file clean2.awk,
i.e. clean2.awk is where you can find all of the important code.
I used HTML, JavaScript, and some CSS to make the page.
JavaScript was used to time the order in which images and texts
appear on the page.
