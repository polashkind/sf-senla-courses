public class ExceptionHw {
  public class CustomException extends Exception {}
  
  public static void throwCustomException() {
    throw new CustomException('Custom Exception');
  }
  
  public static void throwStandardException() {
    throw new TypeException('Type Exception');
  }
  
  public static void testExceptions() {
    try {
      throwCustomException();
      throwStandardException();
    } catch (Exception error) {
      system.debug(error.getMessage());
    } finally {
      system.debug('Method completed');
    }    
  }
}