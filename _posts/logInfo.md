---
layout: post
title: "Log Info"
permalink: /logInfo/

---

### Logs:  
  
{: .box-note}  
[Logs.zip]({{ "/assets/other/logs.zip" | relative_url }})  

Note that not every log file is outlined here. Most log files are named by the script they are output from, and many are cleanup, backup, or other admin type scripts that won't be of interest.  

Any log files that do not have a date or time in the filename are constantly updated, and are typically rolled over after 7 days.

### logs/ACHAIM_run.log

Matlab output of the supplementary routines run after the model is complete. This includes the creation of the output figures,
copy the output files to the "website" and to the backup directory, generating the data aggregation figures, and the dashboard post.  


### logs/*-decompressData.log

A log of the files submitted to the decompression routines in the system, for the specified provider.  

### logs/*-processData.log

A log of the files submitted to the processing routines in the system, for the specified provider.  

### logs/download*QueueYYMMDD-HH.log  

Parallel pool log, formatted as:  
End Date and time __ time difference between submittion and start (s) __ time difference between start and complete (s) __ function called __ inputs to the function  

### **logs/ingestData.log**  

A log of data submitted to the ingestion function, which creates the modelData files at the end of each hour.

### logs/startIngestData.log  

Top level logging of the ingestion system. If something were to fail that the ingestion can't catch, it would likely be logged here.

### **logs/startACHAIMYYYY-DOY.log**  

The A-CHAIM model log file.

### logs/download*QueueYYMMDD-HH.log  

Top level logging of the model. If something were to fail that the model can't catch, it would likely be logged here.

### logs/downloadLogs/*YYYY-MM-DD-HH.log  

Output from the download attempts for files from the specified provider. Formatted as:  
full wget command to the system  
wget output code  
wget output text  

### logs/downloadLogs/download*YYYY-DOY-HH(-MM).log  

Output from the top level download scripts. In most cases this has no output, as it will catch any top level errors that aren't caught in the queue.  



