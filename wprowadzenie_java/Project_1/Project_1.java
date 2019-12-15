import java.util.Scanner;

public class Project_1 {

    static Scanner userInput = new Scanner(System.in);
    static int liczbaWpisana = 0;

    static boolean validateNumber(String s, int out_num) {
        try {
            liczbaWpisana = Integer.parseInt(s);
        } catch (NumberFormatException e) {
            liczbaWpisana = 0;
            return false;
        }
        return true;
    }

    public static void main(String args[]) {
        System.out.println("No dawaj, pisz...");
        String text = userInput.nextLine();
        // userInput.nextLine();
        if (!validateNumber(text, liczbaWpisana)) {
            // this provides you with a way to refer to the object itself
            // userInput.nextLine() returns the value that was entered at the keyboa
            // hasNextInt, hasNextFloat, hasNextDouble, hasNextBoolean, hasNextByte,
            // hasNextLong, nextInt, nextDouble, nextFloat, nextBoolean, etc.
            System.out.println("Twoj napis to: " + text);
        } else {
            // userInput.nextLine();
            System.out.println("Twoja liczba to: " + liczbaWpisana);
        }

    }
}
