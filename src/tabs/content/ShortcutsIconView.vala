using Gtk;



public class ShortcutsIconView: IconView {

    public const uint URI_LIST_MIME_TYPE = 0;
    public const uint TEXT_LIST_MIME_TYPE = 1;

    public const int COLUMN_TEXT = 0;
    public const int COLUMN_PIXBUF = 1;

    public string LOCAL_APP_DIR = Environment.get_home_dir() + "/.local/share/applications/";
    public string SYSTEM_APP_DIR = "/usr/share/applications/";

    public ShortcutsIconView (TargetList targets) {
        Gtk.ListStore ls = new Gtk.ListStore(2, typeof (string), typeof(Gdk.Pixbuf));

        this.set_text_column(COLUMN_TEXT);
        this.set_pixbuf_column(COLUMN_PIXBUF);
        this.set_model(ls);

        this.item_padding = 0;
        this.columns = 4;
        this.column_spacing = 0;
        this.selection_mode = SelectionMode.SINGLE;


        Gtk.drag_dest_set (
                    this,                     // widget that will accept a drop
                    DestDefaults.ALL,       // default actions for dest on DnD,
                    null,              // lists of target to support
                    Gdk.DragAction.COPY           // what to do with data after dropped
                );

        Gtk.drag_dest_set_target_list(this, targets);
        this.drag_data_received.connect(this.on_drag_data_received);

        this.drag_motion.connect((widget, context,
                             x, y, time) => {
            //stdout.printf ("widget %s\n", widget.name);

            foreach(Gdk.Atom atom in context.list_targets()) {
              // stdout.printf ("name %s\n", atom.name());
            }

            return false;
        });
    }

    private void on_drag_data_received (Gdk.DragContext drag_context,
                                        int x, int y,
                                        SelectionData data,
                                        uint info, uint time) {

        stdout.printf("info %u\n", info);
        if (info == URI_LIST_MIME_TYPE) {
            string[] uris = data.get_uris();
            foreach(string uri in uris) {
                //stdout.printf ("uri %s\n", uri);
                //

                string filePath = uri.replace("file://", "");
                Utils.getAppInfo(filePath);
                //Utils.getCategories(filePath);
                //
                GLib.DesktopAppInfo dai = new GLib.DesktopAppInfo.from_filename(filePath);

                stdout.printf("icon: %s\n", dai.get_icon().to_string());



                foreach(string keyword in dai.get_keywords()) {
                    stdout.printf ("keyword %s\n", keyword);
                }


                File file = File.new_for_path(filePath);
                string fileName = file.get_basename();
                string fileExtension = fileName.substring(fileName.last_index_of(".")).up();

                stdout.printf ("fileName %s\n", fileName);
                stdout.printf ("filePath %s\n", filePath);
                stdout.printf ("fileExtension %s\n", fileExtension);

            }
        }
        Gtk.drag_finish(drag_context, true, false, time);
        Signal.stop_emission_by_name (this, "drag_data_received");

    }

}