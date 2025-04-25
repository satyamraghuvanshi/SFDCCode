public class RelatedRecordsHelper 
{
	Public static void GetAccountsWithRelatedRecords(String accountRecordName)
    {
        if(accountRecordName != Null && accountRecordName != '')
        {
         	List<Account> lstAccounts = [ Select id, name, rating, industry, annualrevenue, phone, fax, active__C,
                         						(Select id, firstName, lastName, email, title, phone from Contacts),
                         						(Select id, name, amount, stagename, closedate from Opportunities),
                         						(Select id, caseNumber, Status, Priority, Origin, Subject from Cases)
        									from Account
                        						Where Name =: accountRecordName];
            
            System.debug('Number of Records Returned.....: '+ lstAccounts.Size());
            
            if(! lstAccounts.isEmpty())
            {
                for(Account accRecord : lstAccounts)
                {
                    System.debug('Account Name is.....: '+ accRecord.Name);
                    System.debug('Account Rating is....: '+ accRecord.Rating);
                    System.debug('Industry Name is.....: '+ accRecord.Industry);
                    System.debug('Annual Revenue is....: '+ accRecord.AnnualRevenue);
                    System.debug('Contact Number is....: '+ accRecord.Phone);
                    System.debug('Fax Number is........: '+ accrecord.Fax);
                    
                    // Get the Related contacts..
                    System.debug('----------------------------------');
                    System.debug('Number of Related Contacts.....: '+ accRecord.Contacts.Size());
                    
                    	for(Contact con : accRecord.Contacts)
                        {
                            System.debug('Contact Record is....: '+ con);
                        }
                    
                    // Get the Related Opportunities..
                    System.debug('----------------------------------');
                    System.debug('Number of Related Opportunities....: '+ accRecord.Opportunities.Size());
                    	for(Opportunity oppty : accRecord.Opportunities)
                        {
                            System.debug('Opportunity Record is....: '+ oppty);
                        }
                    
                    // Get the Related Case Records..
                    System.debug('----------------------------------');
                    System.debug('Number of Related Cases.......: '+ accRecord.Cases.Size());
                    	for(Case csRecord : accRecord.Cases)
                        {
                            System.debug('Case Record is......: '+ csRecord);
                        }
                }
            }
            
            System.debug('Number of SOQL Queries used.....: '+ System.Limits.getQueries());
        }        
    }
}