public class StringOperationsHelper 
{
    // Text Comparison..
	Public static void CheckEquals(String s1, String s2)
    {
		if(s1 == s2)        
            System.debug('Both the Strings are Identical.');
        else
            System.debug('Both the Strings are Different.');
    }
    
    // Binary Comparison..
    Public static void CheckEqualsWithCase(String s1, String s2)
    {
        if(s1.equals(s2))
            System.debug('Binary - Both the Strings are Equals.');
        else
            System.debug('Binary - Both the Strings are Different.');
    }
    
    Public static void GetStringLength(String str)
    {
     	System.debug('Number of Characters Count is....: '+ str.length());   
    }   
    
    Public static void ConvertToUpperCase(String str)
    {
        System.debug('Upper Case Result is....: '+ str.toUpperCase());
    }
}