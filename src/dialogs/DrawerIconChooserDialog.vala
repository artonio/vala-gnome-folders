using Gtk;

public class DrawerIconChooserDialog : FileChooserDialog {
    public DrawerIconChooserDialog (Window parent) {
        this.title = "Open File";
        this.parent = parent;
        this.action = FileChooserAction.OPEN;

        add_button ("_Cancel", ResponseType.CANCEL);
        add_button ("_Open", ResponseType.OK);
        set_default_response (ResponseType.OK);
    }
}