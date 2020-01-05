import java.util.*;

public class tablica {
    public static void main(String[] args) {
        int tab[] = new int[19];
        for (int i = 0; i < 10; i++) {
            tab[i] = i + 5;
        }
        for (int i = 0; i < 10; i++) {
            System.out.println(tab[i]);
        }
    }
}