using Gtk;

public class TabLabel: Box {

    Image icon;
    Label label;

    public TabLabel(string labelText, string? drawerIconFileName) {
       Object(orientation: Orientation.HORIZONTAL, spacing: 5);

       stdout.printf ("drawerIconFileName %s\n", drawerIconFileName);

       if (drawerIconFileName != null) {
           this.icon = new Image.from_pixbuf(this.getPixBuffFromFile(drawerIconFileName));
       } else {
            this.icon = new Image.from_icon_name("folder-visiting", IconSize.MENU);
       }

       this.pack_start(this.icon, false, false, 0);
       EventBox lblEventBox = new EventBox();
       this.label = new Label(labelText);
       lblEventBox.add(this.label);
       lblEventBox.set_events(Gdk.EventMask.BUTTON_PRESS_MASK);
       lblEventBox.button_press_event.connect((event) => {
            stdout.printf ("event %i\n", event.type);
            if (event.type == Gdk.EventType.2BUTTON_PRESS) {
               // this.emit("edit-drawer-name");
            }
            return false;
       });
       this.pack_start(lblEventBox, true, true, 0);


       this.show_all();
    }

    private Gdk.Pixbuf getPixBuffFromFile(string fileName) {
        Gdk.Pixbuf pixbuf = new Gdk.Pixbuf.from_file(fileName);
        pixbuf = pixbuf.scale_simple(32, 32, Gdk.InterpType.BILINEAR);
        return pixbuf;

    }
}