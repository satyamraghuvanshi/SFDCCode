Global class UpdateAccountRecordsBatch implements Database.Batchable<SObject>
{
	Global Database.QueryLocator Start(Database.BatchableContext bContext)
    {
        String accountsQuery = 'Select id, name, rating, ownership, type, customerpriority__C from Account';
        return Database.getQueryLocator(accountsQuery);
    }
    
    Global void Execute(Database.BatchableContext bContext, List<SObject> recordsToProcess)
    {
        if(! recordsToProcess.isEmpty())
        {
            List<Account> accountRecordsToUpdate = new List<Account>();
            
            for(SObject sRecord : recordsToProcess)
            {
                // Type Cast the record to Account Type..
               	Account accRecord = (Account) sRecord;
                
                // Assign the New values for the record..
                	accRecord.Type = 'Installation Partner';
                	accRecord.Ownership = 'Private';
                	accRecord.CustomerPriority__c = 'High';
                
                // Add the record to collection..
                	accountRecordsToUpdate.Add(accRecord);
            }
            
            // Update Accounts to Database..
            if(! accountRecordsToUpdate.isEmpty())
                Update accountRecordsToUpdate;
        }
    }
    
    Global void Finish(Database.BatchableContext bContext)
    {
        System.debug('Batch Job Id is......: '+ bContext.getJobId());
        
        // Get the Batch Job Status...
        AsyncApexJob jobDetails = [Select id, status, totalJobItems, jobItemsProcessed,
                                  			numberOfErrors, createdby.Email
                                  					from AsyncApexJob
                                  						Where id =: bContext.getJobId()];
        // Write the Code to Send the Email Alert..
        Messaging.SingleEmailMessage sEmail = new Messaging.SingleEmailMessage();
        
        	String[] toAddress = new String[]{jobDetails.CreatedBy.Email, 'isatyamraghuvanshi@gmail.com'};
            sEmail.setToAddresses(toAddress);
        
        	String[] ccAddress = new String[]{'sudheergadde9@gmail.com'};
            sEmail.setCcAddresses(ccAddress);
        
        	String[] bccAddress = new String[]{'dusisrinias0@gmail.com'};
            sEmail.setBccAddresses(bccAddress);
        
        	sEmail.setSenderDisplayName('ICICI Bank Customers Support Center.');
        
        	sEmail.setReplyTo('support@icicibank.com');
        
        	String emailSubject = 'ICICI Bank Weekly Customers Updates Batch : UpdateAccountRecordsBatch - (' + bContext.getJobId()+ ' )';
        	sEmail.setSubject(emailSubject);
        
        	String emailContent = 'Dear Customer Support, <br/><br/>'+
                					'We are Pleased to inform you, that we have processed Weekly Customer Details Updates Batch.<br/><br/>'+
                					'Please have a Look at the below...: <br/><br/>'+
                					'Batch Job ID / Reference .....: '+ jobDetails.Id+
                					'<br/>Batch Job Name is........: UpdateAccountRecordsBatch'+
                					'<br/>Batch Job Status is......: '+ jobDetails.Status+
                					'<br/>Total Number of Batches....: '+ jobDetails.TotalJobItems+
                					'<br/>Number of Batches Processed....: '+ jobDetails.JobItemsProcessed+
                					'<br/>Number of Batches Failed....: '+ jobDetails.NumberOfErrors+
                					'<br/>Batch Job Owner Email Address.....: '+ jobDetails.CreatedBy.Email+
                					'<br/><br/> Please Contact on the below Address, if any Queries.. <br/><br/>'+
                					'***<i>This is a System-Generated Email. Please Do Not Reply.<i><br/><br/>'+
                					'Thanks & Regards, <br/> Support Team, <br/> ICICI Bank.';
        	sEmail.setHtmlBody(emailContent);
        
        	Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{sEmail});     
    }
}