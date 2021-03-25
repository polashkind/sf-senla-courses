public class NumberUtility {

    public static String fibbonachiNum(Integer n){
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
        return 'Result: ' + String.valueOf(arr);
    }

    public static Boolean isPalindromNumber(Integer numToCheck) {
        String numStr = String.valueof(numToCheck);
        String reversString = numStr.reverse();
        return numStr == reversString;
    }
    
    public static List<Integer> getPrimeNumbers(Integer toNum) {
        List<Integer> numPrimeOne;
        for (Integer i = 2; i <= toNum; i++) {
            Boolean numPrime = true;
            
            for (Integer j = 2; j <= Math.sqrt(i); j++) {
                if (Math.mod(i, j) == 0) {
                    numPrime = false;
                } 
            }
            
            if (numPrime) {
                numPrimeOne.add(i);
            }
        }
        return numPrimeOne;
    }
}