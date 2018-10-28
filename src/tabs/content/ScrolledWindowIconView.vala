using Gtk;

public class ScrolledWindowIconView : ScrolledWindow {

    ShortcutsIconView iconView;

   public ScrolledWindowIconView.initWithProps(TargetList targets, string drawerLabel, string drawerIconFileName, bool isNewFile) {
       this(null, null);


        this.min_content_height = 200;
        this.min_content_width = 400;

        this.border_width = 0;
        this.set_policy(PolicyType.NEVER, PolicyType.ALWAYS);

        this.iconView = new ShortcutsIconView(targets);
        this.add(this.iconView);

       stdout.printf ("drawerLabel %s\n", drawerLabel);
       stdout.printf ("drawerIconFileName %s\n", drawerIconFileName);
   }

   public ScrolledWindowIconView(Adjustment? hadj = null, Adjustment? vadj = null) {
        Object (hadjustment : hadj, vadjustment : vadj);


   }

}