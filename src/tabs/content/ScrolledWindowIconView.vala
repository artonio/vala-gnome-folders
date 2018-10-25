using Gtk;

public class ScrolledWindowIconView : ScrolledWindow {

    ShortcutsIconView iconView;

   public ScrolledWindowIconView.initWithProps(TargetList targets, string drawerLabel, string drawerIconFileName, bool isNewFile) {
       this(null, null);
       Gtk.drag_dest_set_target_list(this.iconView, targets);



       stdout.printf ("drawerLabel %s\n", drawerLabel);
       stdout.printf ("drawerIconFileName %s\n", drawerIconFileName);
   }

   public ScrolledWindowIconView(Adjustment? hadj = null, Adjustment? vadj = null) {
        Object (hadjustment : hadj, vadjustment : vadj);
        this.min_content_height = 200;
        this.min_content_width = 400;

        this.border_width = 0;
        this.set_policy(PolicyType.NEVER, PolicyType.ALWAYS);

        this.iconView = new ShortcutsIconView();
        this.iconView.drag_data_received.connect((drag_context, x,y, data,info, time) => {
           stdout.printf ("info %u\n", info);
        });
        this.iconView.drag_motion.connect((widget, context,
                                 x, y, time) => {
           //stdout.printf ("widget %s\n", widget.name);

           foreach(Gdk.Atom atom in context.list_targets()) {
               stdout.printf ("name %s\n", atom.name());
           }

            return false;
        });


        this.add(this.iconView);

   }

}