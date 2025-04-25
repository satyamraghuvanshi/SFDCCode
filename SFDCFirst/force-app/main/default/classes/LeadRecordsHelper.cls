public class LeadRecordsHelper 
{
	Public void CreateNewLead()
    {
        Lead ldRecord = new Lead();
        
        	ldRecord.FirstName = 'Aravind';
        	ldrecord.LastName = 'Kumar';
        	ldRecord.Company = 'Cognizant';
        	ldRecord.Status = 'Working - Contacted';
        	ldrecord.Rating = 'Hot';
        	ldRecord.Industry = 'Technology';
        	ldRecord.AnnualRevenue = 1700000;
        	ldRecord.Title = 'HR Executive';
        	ldRecord.Phone = '9900445588';
        	ldRecord.Fax = '9900444444';
        	ldRecord.Email = 'aravind@gmail.com';
        	ldRecord.LeadSource = 'Web';
        	ldRecord.Website = 'www.cognizant.com';
        	ldRecord.City = 'Bangalore';
        	ldrecord.State = 'Karnataka';
        	ldRecord.Country = 'India';
        
        Insert ldRecord;
        
        if(ldRecord.Id != Null)
            System.debug('Lead Record Inserted Successfully. Lead Id is...: '+ ldRecord.id);
    }
}