using System;
using System.Net;

class Program
{
    static void Main()
    {
        String hostName = string.Empty;
        hostName = Dns.GetHostName();
        Console.WriteLine("Hostname: " + hostName);
        IPHostEntry myIP = Dns.GetHostEntry(hostName);

        IPAddress[] address = myIP.AddressList;

        for (int i = 0; i < address.Length; i++)
        {
            Console.WriteLine("IP Address {1} : ", address[i].ToString());
        }
        NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
        String sMacAddress = string.Empty;
        foreach (NetworkInterface adapter in nics)
        {
            if (sMacAddress == String.Empty)// only return MAC Address from first card
            {
                IPInterfaceProperties properties = adapter.GetIPProperties();
                sMacAddress = adapter.GetPhysicalAddress().ToString();
            }
        }
        return sMacAddress;
        Console.ReadLine();
    }
}