import java.util.*;
//import java.io.*;

public class program1 {

    static String imie;
    static String nazwisko;
    static String cytat;
    static String cytat2;
    static String kolorWpisany;
    public static String Kol;
    static String wiek1;
    static String wzor;
    static Scanner userInput = new Scanner(System.in);
    static int wiek;
    static int wiek_sprawdzony;
    static String hakuna = ("Hakuna Matata, jak cudownie to brzmi. \nHakuna Matata, to nie byle bzik! \nJuż się nie martw, aż do końca twych dni! \nNaucz się tych dwóch radosnych slów Hakuna Matata! \nxD  xD  xD");

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
        if (18 < wiek && wiek < 99) {
            wiek1 = ("Masz " + wiek + " lat. Mieścisz się w przedziale 18-99 lat");
        } else {
            wiek1 = ("Masz " + wiek + " lat. NIE mieścisz się w przedziale 18-99 lat");
        }
    }

    public static void PobierzCytat() {
        System.out.println("Podaj swó ulubiony cytat z dowolnej książki");
        cytat = userInput.nextLine();
        wzor = ("HakunaMatata");
        if (cytat == wzor) {
            cytat = hakuna;
        } else {
            String cytat2 = cytat.trim();
            cytat2.toLowerCase();
            cytat = cytat2.substring(0, 1) + cytat2.substring(1, 6) + (" ") + cytat.substring(7, 8)
                    + cytat.substring(8);
            if (cytat == wzor) {
                cytat = hakuna;
            } else {
                cytat = ("Oj, coś żle wpisałeś/aś. Popraw :P");
            }
            // COŚ TU NIE GRA...
        }
    }

    public static void PobierzKolor() {
        System.out.println("Jaki jest twój ulubiony kolor?");

        for (Kolor color : Kolor.values()) {
            System.out.print(color.toString() + " ");
        }
        String kolorWpisany = userInput.nextLine().toUpperCase();
        Kolor color = Kolor.valueOf(kolorWpisany);
        Kol = color.toString();
    }

    public static void main(String[] args) {

        PobierzImie();
        PobierzNazwisko();
        PobierzWiek();
        PobierzKolor();
        PobierzCytat();

        String imie2 = imie.substring(0, 1).toUpperCase() + imie.substring(1).toLowerCase();
        String nazwisko2 = nazwisko.substring(0, 1).toUpperCase() + nazwisko.substring(1).toLowerCase();

        System.out.println("\nPodałeś/aś następujące dane:\nImię: " + imie2 + "\nNazwisko: " + nazwisko2 + "\nWiek: "
                + wiek1 + "\nUlubiony kolor: " + Kol + "\nUlubiony cytat: " + cytat);
    }
}