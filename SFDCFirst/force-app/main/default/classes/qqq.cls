public class qqq
{
    Public static void GetAllCaseRecords()
    {
     	    for(Case csRecord  : [Select id, caseNumber, status, priority, origin, 
           							reason, subject, type, description
           								from Case ])
            {
                System.debug('Case Record Id is....: '+ csRecord.id);
                System.debug('Case Number is.......: '+ csRecord.CaseNumber);
                System.debug('Case Status is......: '+ csRecord.Status);
                System.debug('Case Priority is.....: '+ csRecord.Priority);
                System.debug('Case Origin is.......: '+ csRecord.Origin);
				System.debug('Case Subject is.......: '+ csRecord.Subject);
                System.debug('Case Description is....: '+ csRecord.Description);
                System.debug('-------------------------------------------------');
            }
        	
        	System.debug('Number of SOQL Queries Used......: '+ System.Limits.getQueries());
        	System.debug('Number of Records Returned....: '+ System.Limits.getQueryRows());
    } 
}