Schema.DescribeFieldResult fieldResult = User.TimeZoneSidKey.getdescribe();
List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
for(Schema.PicklistEntry p : ple)
{
system.debug('###'+p.getlabel()+'****'+p.getValue()+'\n');

}
