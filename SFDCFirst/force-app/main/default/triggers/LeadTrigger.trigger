trigger LeadTrigger on Lead (before insert, before update) 
	{
		if( (Trigger.isInsert || Trigger.isUpdate) && Trigger.isBefore)
		{
			for(Lead ldRecord : Trigger.New)
			{
				if(ldRecord.Phone == Null || ldRecord.Phone == '')
					ldrecord.Phone.AddError('Please Enter Lead Contact Number.');
				else if(ldRecord.Fax == Null || ldrecord.Fax == '')
					ldRecord.Fax.AddError('Please Enter Lead Fax Number.');
				else if(ldRecord.Email == Null || ldRecord.Email == '')
					ldRecord.Email.AddError('Please Enter Email Address.');
				else if(ldRecord.AnnualRevenue == Null)
					ldRecord.AnnualRevenue.AddError('Please Enter Annual Revenue Value.');
			}
		}
	}