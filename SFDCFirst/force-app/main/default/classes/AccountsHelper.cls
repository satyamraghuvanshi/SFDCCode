public class AccountsHelper 
{
	Public void CreateAccountRecord()
    {
        Account acc = new Account();
        
        	acc.Name = 'ishore Kumar';
        	acc.Rating = 'Warm';
        	acc.Industry = 'Manufacturing';
        	acc.AnnualRevenue = 100000;
        	acc.Phone = '955900445577';
        	acc.Fax = '955900009900';
        	acc.Type = 'Installation Partner';
        	acc.Ownership = 'Public';
        	acc.Website = 'www.gjjjmail.com';
        	acc.BillingCity = 'une';
        	acc.BillingState = 'aharashtra';
        	acc.BillingCountry = 'ndia';
        	acc.CustomerPriority__c = 'High';
        	acc.Active__c = 'Yes';
        
        Insert acc;
        
        if(acc.Id != Null)
            System.debug('Account Record Inserted Successfully with id...: '+ acc.Id);
    }
}