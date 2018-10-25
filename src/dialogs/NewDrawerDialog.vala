using Gtk;

public class NewDrawerDialog : Dialog {

    public Button drawerIcon;
    public Entry drawerName;
    public string drawerIconFileName;

    public NewDrawerDialog(Window parent) {
        this.title = "New Drawer";
        this.parent = parent;
        this.add_button("OK", ResponseType.OK);
        this.add_button("Cancel", ResponseType.CANCEL);
        Box box = this.get_content_area();
        string dImage = "gtk-select-color";

        this.drawerName = new Entry();
        this.drawerIcon = new Button.from_icon_name(dImage, IconSize.SMALL_TOOLBAR);
        this.drawerIcon.clicked.connect(() => {
           DrawerIconChooserDialog d = new DrawerIconChooserDialog(this);
           int dResponse = d.run();
           if (dResponse == ResponseType.OK) {
                this.drawerIconFileName = d.get_filename();
                this.drawerIcon.image = new Image.from_pixbuf(this.getPixBuffFromFile(this.drawerIconFileName));
           }

           d.destroy();
        });

        Box hbox = new Box(Orientation.HORIZONTAL, 0);
        hbox.pack_start(this.drawerName, false, true, 0);
        hbox.pack_end(this.drawerIcon, true, true, 0);

        box.add(hbox);
        this.show_all();
    }


    private Gdk.Pixbuf getPixBuffFromFile(string fileName) {
        Gdk.Pixbuf pixbuf = null;
        try {
            pixbuf = new Gdk.Pixbuf.from_file(fileName);
        } catch (FileError e) {
            stderr.printf ("Invalid file path: %s\n", e.message);
        }

        pixbuf = pixbuf.scale_simple(48, 48, Gdk.InterpType.BILINEAR);
        return pixbuf;

    }


}