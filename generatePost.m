%generate the post for the A-CHAIM dashboard

function generatePost()


header = {'---'
'layout: post'
'title: "2023-03-01 02:30:00"'
'subtitle: "Issues: 5"'
'---'};

figTemplate='![]({{ "/assets/img/southpark.jpg" | relative_url }})';

warnTemplate={'### Warnings'
''
'{: .box-warning}'
'**Warning:** This is a warning box.'};

errTemplate={'### Errors'
''
'{: .box-error}'
'**Error:** This is an error box.'};

%set up the header

%Set up all the figures

%set modeldata warnings/errors to a warning box

%set all errors to an error box

%put it all together and write to _posts folder

%copy the new figures to the assets/img folder

%run the push script which should push the new post and the figures

end