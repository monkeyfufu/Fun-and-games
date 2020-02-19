# Fun-and-games
testing code edits

<a href="https://githubsfdeploy.herokuapp.com?owner=BeccaMorgan&repo=monkeyfufu/plex">
  <img alt="Deploy Plex to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>


Evwent logs:
https://trailhead.salesforce.com/en/content/learn/modules/event_monitoring/event_monitoring_query

http://www.salesforcehacker.com/2014/11/downloading-event-log-files-using-script.html: Here:
https://github.com/atorman/elfBash


Gist for holidays in IE, AU, CA, Hyderabad, US IBM F,G,D:  https://gist.github.com/monkeyfufu/d43422ad879cca4b28ec7d5bde62a39c


How to Deploy:

1.     Convert to metadata

 Command: sfdx force:source:convert -r /Downloads/boo/bh/force-app/settings -d tmpBH

Or: sfdx force:source:convert -r /Downloads/boo/bh/force-app/settings 

Response: Source was successfully converted to Metadata API format and written to the location: …/boo/bh     /metadataPackage_1581106935454

2.     Make the deploy directory a zip file. Above, either tmpBH or metadataPackage_1581106935454.

3.     Deploy to your QA sandbox and then your full sandbox.  If you only have one, you can also deploy to a dev org to test.

Command: sfdx force:mdapi:deploy --checkonly -f BHSetPack.zip -u hawksandbox -l RunSpecifiedTests -r TestBusinessHours

Get the jobID for the next step:  sfdx force:mdapi:deploy:report

  Job ID | 0Af6g00000Mc8GNCAZ 

  MDAPI PROGRESS | ████████████████████████████████████████ | 3/3 Files

Deploy command: sfdx force:mdapi:deploy -u hawksandbox –q 0Af6g00000Mc8GNCAZ

4.     Deploy in Production Org:  

   a.  sfdx force:mdapi:deploy --checkonly -f BHSetPack.zip -u hawkProduction -l RunSpecifiedTests -r    

       TestBusinessHours

   b.  sfdx force:mdapi:deploy:report 

          Job ID | 0Af6g00000Mc8GNCAZ

          MDAPI PROGRESS | ████████████████████████████████████████ | 3/3 Files

   c.  sfdx force:mdapi:deploy -u hawkproduction –q 0Af6g00000Mc8GNCAZ
