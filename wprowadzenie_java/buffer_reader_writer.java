import java.io

String directory = System.getProperty("user.home");
String fileName = "sample.txt";
String absolutePath = directory + File.separator + fileName;

// write the content in file 
try(BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(absolutePath))) {
    String fileContent = "This is a sample text.";
    bufferedWriter.write(fileContent);
} catch (IOException e) {
    // exception handling
}

// read the content from file
try(BufferedReader bufferedReader = new BufferedReader(new FileReader(absolutePath))) {
    String line = bufferedReader.readLine();
    while(line != null) {
        System.out.println(line);
        line = bufferedReader.readLine();
    }
} catch (FileNotFoundException e) {
    // exception handling
} catch (IOException e) {
    // exception handling
}