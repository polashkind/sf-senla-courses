public class ExceptionsPlayground {
    public class CustomException extends Exception {}

    public static void generateCustomException() {
        throw new CustomException('Custom Exception');
    }

    public static void generateRegularException() {
        throw new TypeException('Type Exception');
    }

    public static void handleExceptions() {
        try {
            generateCustomException();
            generateRegularException();
        } catch (Exception error) {
            system.debug(error.getMessage());
        } finally {
            system.debug('Method completed');
        }    
    }
}