public class DatabaseHelper 
{
    Public static void SearchLeadRecords(String startingChars)
    {
        if(startingChars != Null && startingChars != '')
        {
            startingChars += '%';  
            
            List<Lead> lstLeads = [Select id, email, phone, fax
                                  			from Lead
                                  				Where lastname like :startingChars ];
            
            System.debug('Number of Records.....: '+ lstLeads.Size());
            
            for(Lead ldRecord : lstLeads)
            {
                System.debug('Lead Record is....: '+ ldRecord);
            }
        }
    }
}