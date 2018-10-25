using Gtk;

public class ScrolledWindowIconView : ScrolledWindow {

    ShortcutsIconView iconView;

   public ScrolledWindowIconView.initWithProps(TargetList targets, string drawerLabel, string drawerIconFileName, bool isNewFile) {
       this(null, null);


        this.min_content_height = 200;
        this.min_content_width = 400;

        this.border_width = 0;
        this.set_policy(PolicyType.NEVER, PolicyType.ALWAYS);

        this.iconView = new ShortcutsIconView();
        Gtk.drag_dest_set_target_list(this.iconView, targets);
        this.iconView.drag_data_received.connect((drag_context, x,y, data,info, time) => {
            stdout.printf ("x %u\n", x);
            Gtk.drag_finish(drag_context, true, false, time);
            Signal.stop_emission_by_name (this.iconView, "drag_data_received");
        });
        this.iconView.drag_motion.connect((widget, context,
                             x, y, time) => {
            //stdout.printf ("widget %s\n", widget.name);

            foreach(Gdk.Atom atom in context.list_targets()) {
              // stdout.printf ("name %s\n", atom.name());
            }

            return false;
        });


        this.add(this.iconView);



       stdout.printf ("drawerLabel %s\n", drawerLabel);
       stdout.printf ("drawerIconFileName %s\n", drawerIconFileName);
   }

   public ScrolledWindowIconView(Adjustment? hadj = null, Adjustment? vadj = null) {
        Object (hadjustment : hadj, vadjustment : vadj);


   }

}