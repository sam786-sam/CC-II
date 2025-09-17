public class UglyNumber {

    public static int nthUglyNumber(int n) {
        if (n <= 0) {
            return 0;
        }

        int[] ugly = new int[n];
        ugly[0] = 1;

        int i2 = 0;
        int i3 = 0;
        int i5 = 0;

        int nextMultipleOf2 = ugly[i2] * 2;
        int nextMultipleOf3 = ugly[i3] * 3;
        int nextMultipleOf5 = ugly[i5] * 5;

        for (int i = 1; i < n; i++) {
            int nextUgly = Math.min(nextMultipleOf2, Math.min(nextMultipleOf3, nextMultipleOf5));
            ugly[i] = nextUgly;

            if (nextUgly == nextMultipleOf2) {
                i2++;
                nextMultipleOf2 = ugly[i2] * 2;
            }
            if (nextUgly == nextMultipleOf3) {
                i3++;
                nextMultipleOf3 = ugly[i3] * 3;
            }
            if (nextUgly == nextMultipleOf5) {
                i5++;
                nextMultipleOf5 = ugly[i5] * 5;
            }
        }
        return ugly[n - 1];
    }

    public static void main(String[] args) {
        int n = 10;
        int result = nthUglyNumber(n);
        System.out.println("The " + n + "th ugly number is: " + result);
    }
}
