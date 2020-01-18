using System;
using System.Net;
using System.IO;
using System.Text;

class IP
{
    static void Main()
    {
        String strHostName = string.Empty;
        strHostName = Dns.GetHostName();
        Console.WriteLine("\n==================================");
        Console.WriteLine("Nazwa komputera: " + strHostName);

        IPHostEntry ipEntry = Dns.GetHostEntry(strHostName);
        IPAddress[] addr = ipEntry.AddressList;

        for (int i = 0; i < addr.Length; i++)
        {
            Console.WriteLine("IP Address {0}: {1} ", i, addr[i].ToString());
        }
        // string fileName = "test.txt";
        // string textToAdd =  //gdzieś tu


        // using (StreamWriter writer = new StreamWriter(fileName, true))
        // {
        //     writer.Write(textToAdd);
        // }
        Console.ReadLine();
    }
}