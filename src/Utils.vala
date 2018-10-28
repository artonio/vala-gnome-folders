

public class Utils : Object {
    public static void getAppInfo(string filePath) {
        File file = File.new_for_path(filePath);

        try {
            // Open file for reading and wrap returned FileInputStream into a
            // DataInputStream, so we can read line by line
            var dis = new DataInputStream (file.read ());
            string line;
            // Read lines until end of file (null) is reached
            while ((line = dis.read_line (null)) != null) {
                stdout.printf ("%s\n", line);
                if (line.contains("Name=")) {

                }
            }
        } catch (Error e) {
            error ("%s", e.message);
        }

    }
}