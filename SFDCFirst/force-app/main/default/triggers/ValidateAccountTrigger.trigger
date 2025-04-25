trigger ValidateAccountTrigger on Account (before insert) 
	{
		if(Trigger.IsInsert && Trigger.IsBefore)
		{
			for(Account accRecord : Trigger.New)
			{
				if(accRecord.Rating == Null || accRecord.Rating == '')
					accRecord.Rating.AddError('Please Select the Rating Value.');
				else if(accRecord.Phone == Null || accRecord.Phone == '')
					accRecord.Phone.AddError('Please Enter the Contact Number.');
				else if(accRecord.Industry == Null || accRecord.Industry == '')
					accRecord.Industry.AddError('Please Select the Industry Name.');
			}
		}
	}