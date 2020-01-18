import java.net.*;

public class ip {
    public static void main(String[] args) {
        InetAddress ip;
        try {
            String hostName = InetAddress.getLocalHost().getHostName();
            ip = InetAddress.getLocalHost();
            NetworkInterface network = NetworkInterface.getByInetAddress(ip);
            byte[] mac = network.getHardwareAddress();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < mac.length; i++) {
                sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
            }
            System.out.println("--------------------------------");
            System.out.println("Nazwa komputera: " + hostName);
            System.out.println("Adres lokalny: " + InetAddress.getLocalHost().getHostAddress());
            System.out.println("Adres MAC: " + sb.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}