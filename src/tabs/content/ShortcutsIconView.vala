using Gtk;



public class ShortcutsIconView: IconView {
    const TargetEntry[] target_list = {
       { "text/plain", TargetFlags.OTHER_APP, Gdk.DragProtocol.ROOTWIN },
       {"x-special/gnome-icon-list", TargetFlags.OTHER_APP, Gdk.DragProtocol.ROOTWIN}
    };

   public ShortcutsIconView () {
    Gtk.drag_dest_set (
                this,                     // widget that will accept a drop
                DestDefaults.ALL,       // default actions for dest on DnD,
                null,              // lists of target to support
                Gdk.DragAction.COPY           // what to do with data after dropped
            );
   }
}