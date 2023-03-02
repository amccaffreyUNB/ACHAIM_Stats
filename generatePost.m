%generate the post for the A-CHAIM dashboard

function generatePost(time)

rootDir = "/home2/achaim1/ACHAIM_Stats";

%set time zone if necessary
if isempty(time.TimeZone)
    time.TimeZone = '+00:00';
end

%add the A-CHAIM path
addpath("/home2/achaim1/A-CHAIM/matFiles")

%get config info
cf = config();

%load all the necessary data

%this is the most recent report, after filtering, not a record of all
%reports
modelDataReport = load("/home2/achaim1/weeklyReports/modelDataReport.mat","lines","ct");
lastErr = load(fullfile(cf.errMat,"lastErr.mat"),'lastErr');
lastErr = lastErr.lastErr;

%generate the header
mdInd = length(modelDataReport.lines) - 4;
sysInd = lastErr.date > time - hours(1);

header = sprintf(['---' newline ...
'layout: post' newline ...
'title: "%s"' newline ...
'subtitle: "ModelData Issues: %d; A-CHAIM System Issues: %d"' newline ...
'---' newline], ...
    datestr(time,'yyyy-mm-dd hh:MM:ss'), mdInd, sum(sysInd));

%generate the figure output
figures=['![]({{ "/assets/img/achaimDataStatsShort.png" | relative_url }})' newline ...
    '![]({{ "/assets/img/achaimDataStatsLong00.png" | relative_url }})' newline ...
    '![]({{ "/assets/img/achaimDataStatsLong01.png" | relative_url }})' newline ...
    '![]({{ "/assets/img/achaimDataStatsLong02.png" | relative_url }})' newline ...
    '![]({{ "/assets/img/modelDataDataStats.png" | relative_url }})' newline ...
    '![]({{ "/assets/img/modelDataStationStats.png" | relative_url }})' newline];

%modelData warning box
if mdInd > 0

    lines = modelDataReport.lines;
    lines(lines == "\n") = newline;
    lines = char(strjoin(lines));
    
    modIssues = sprintf(['### ModelData Issues:' newline ...
    '{: .box-warning}' newline ...
    '%s' newline newline], ...
        lines);
    
else
    modIssues = newline;
end

%system issues error box
if sum(sysInd) > 0
    
    sysIssues=['### A-CHAIM System Issues:' newline ...
    '{: .box-error}' newline];
    
    k = find(sysInd);
    
    for i=1:length(k)
        sysIssues = [sysIssues sprintf("%s %s",...
            datestr(lastErr.date(k(i)),'yyyy-mm-dd hh:MM:ss'),lastErr.errID(k(i))) newline];
    end

else
    sysIssues = newline;
end

%put it all together and write to _posts folder
file = fullfile(rootDir,"_posts/",strcat(datestr(time,"yyyy-mm-dd-hh-MM-ss"),".md"));
fid = fopen(file,'w');    
fprintf(fid,'%s',[header newline figures newline modIssues newline sysIssues]);          
fclose(fid);  

%copy the new figures to the assets/img folder
copyfile("/home/achaim1/websiteFigures/*.png",fullfile("/assets/img/"));

%run the push script which should push the new post and the figures
[s,c] = system(fullfile(rootDir,"gitPush.sh"));

end