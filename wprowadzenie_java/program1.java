import java.util.*;
//import java.io.*;

public class program1 {

    static String imie;
    static String nazwisko;
    static String cytat;

    static Scanner userInput = new Scanner(System.in);
    static int wiek;
    static int wiek_sprawdzony;

    enum Kolor {
        CZERWONY, ZIELONY, NIEBIESKI
    }

    public static void PobierzImie() {
        System.out.println("Podaj imię");
        imie = userInput.nextLine();
    }

    public static void PobierzNazwisko() {
        System.out.println("Podaj nazwisko");
        nazwisko = userInput.nextLine();
    }

    public static void PobierzWiek() {
        System.out.println("Ile masz lat?");
        wiek = userInput.nextInt();
        userInput.nextLine();
    }

    public static void PobierzCytat() {
        System.out.println("Podaj swó ulubiony cytat z dowolnej książki");
        cytat = userInput.nextLine();
    }

    public static void PobierzKolor() {
        System.out.println("Jaki jest twój ulubiony kolor?");

        for (Kolor color : Kolor.values()) {
            System.out.print(color.toString() + " ");
        }
        String kolorWpisany = userInput.nextLine();
        Kolor color = Kolor.valueOf(kolorWpisany);
    }

    public static void main(String[] args) {

        PobierzImie();
        PobierzNazwisko();
        PobierzWiek();
        PobierzKolor();
        PobierzCytat();

        System.out.println("Podałeś/aś następujące dane:\nImię: " + imie + "\nNazwisko: " + nazwisko + "\nWiek: "
                + wiek_sprawdzony + "\nUlubiony kolor :" + "\nUlubiony cytat :" + cytat);
    }
}