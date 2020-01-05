import java.util.*;
//import java.io.*;

public class program1_1 {
    static Scanner userInput = new Scanner(System.in);
    static int wiek;
    static int wiek_sprawdzony;

    enum Kolor {
        CZERWONY, ZIELONY, NIEBIESKI;
    }

    public static void main(String[] args) {
        for (Kolor color : Kolor.values()) {
            System.out.print(color.toString() + " ");
        }
        String kolorWpisany = userInput.nextLine();
        Kolor color = Kolor.valueOf(kolorWpisany);
        System.out.println("Twój ulubiony kolor to: " + color.toString());
    }
}