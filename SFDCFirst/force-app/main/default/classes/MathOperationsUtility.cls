public class MathOperationsUtility 
{
	Public static Integer Addition(Integer fNumber, Integer sNumber)
    {
        return (fNumber + sNumber);
    }
    
    Public static Boolean CheckEquals(Integer fNumber, Integer sNumber)
    {
        if(fNumber == sNumber)
            return true;
        else
            return false;
    }
    
    Public static Integer FindBiggest(Integer fNumber, Integer sNumber)
    {
        if(fNumber > sNumber)
            return fNumber;
        else
            return sNumber;
    }
}