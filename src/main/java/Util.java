public class Util {

    public static int random(int a, int b) {
        return ((int)(Math.random() * 100000)) % (Math.abs(a - b)) + a;
    }

}
