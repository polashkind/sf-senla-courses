public class NumberUtility {

    // 15. Необходимо написать программу, которая вычисляет числа Фибоначчи в пределах от 1 до N. Число N – объявлено в первой строки скрипта.
    
    public static void FibbonachiNum(Integer n){
        Integer[] arr = new Integer[] {};
        Integer prev = 1;
        Integer curr = 1;
        arr.add(prev);
        while (curr < n) {
            arr.add(curr);
            Integer prevNum = prev;
            prev = curr;
            curr = curr + prevNum;
        }
        system.debug('Result: ' + String.valueOf(arr));
    }

    // 16. Необходимо написать программу, которая проверяет число на “палиндромность”. Число для проверки объявлено в первой строки скрипта (Long N = 910019);
    
    public static void palindromNumber(Integer numToCheck) {
        String numStr = String.valueof(numToCheck);
        String reversString = numStr.reverse();
        if (numStr == reversString) {
            system.debug(true);
        } else {
            system.debug(false);
        }
    }
    
    // 14. Необходимо написать программу, которая вычисляет простые числа в пределах от 1 до N. Число N – объявлено в первой строки скрипта.

    public static void numberPrime(Integer toNum) {
        for (Integer i = 2; i <= toNum; i++) {
            Boolean numPrime = true;
            
            for (Integer j = 2; j <= Math.sqrt(i); j++) {
                if (Math.mod(i, j) == 0) {
                    numPrime = false;
                } 
            }
            
            if (numPrime) {
                system.debug(i);
            }
        }
    }
}