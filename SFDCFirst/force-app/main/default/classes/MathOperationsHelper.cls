public class MathOperationsHelper 
{
	Public void Addition(Integer fNumber, Integer sNumber)
    {
        System.debug('Addition Result is....: '+ (fNumber + sNumber));
    }
    
    Public void Subtraction(Integer fNumber, Integer sNumber)
    {
        System.debug('Subtraction Result is.....: '+ (fNumber - sNumber));
    }
    
    Public void Multiply(Integer fNumber, Integer sNumber, Integer tNumber)
    {
        System.debug('Multiplication Result is....: '+ (fNumber * sNumber * tNumber));
    }
    
    Public void Division(Integer fNumber, Integer sNumber)
    {
        if(sNumber > 0)
            System.debug('Division Operation Result is....: '+ (fNumber / sNumber));
        else
            System.debug('Division Operation Cannot be Performed. As the Second Number Value is Zero.');
    }
}