using Gtk;


public class AppMainWindow: Window {
    //public Gtk.Toolbar toolbar;
    TabsView notebook;

    public AppMainWindow() {
        // Sets the title of the Window:
	    this.title = "Folders Editor";

	    // Center window at startup:
	    this.window_position = Gtk.WindowPosition.CENTER;

	    // Sets the default size of a window:
	    this.set_default_size (350, 70);

	    // Whether the titlebar should be hidden during maximization.
	    this.hide_titlebar_when_maximized = false;

	    // Method called on pressing [X]
	    this.destroy.connect (() => {
		    // Print "Bye!" to our console:


		    // Terminate the mainloop: (main returns 0)
		    Gtk.main_quit ();
	    });

	    Toolbar toolbar = this.createToolbar();
	    this.notebook = new TabsView();


	    Box hBox = new Box (Gtk.Orientation.VERTICAL, 0);
	    hBox.pack_start(toolbar, false, true, 0);
	    hBox.pack_end(this.notebook, true, true, 0);

	    // Widget content:
	    this.add(hBox);
    }

    private Toolbar createToolbar() {
        Toolbar toolbar = new Toolbar();

        toolbar.set_style(ToolbarStyle.ICONS);

        Image img = new Image.from_icon_name ("document-new", Gtk.IconSize.SMALL_TOOLBAR);
        ToolButton newDrawerBtn = new ToolButton(img, null);
        newDrawerBtn.set_tooltip_text("New Drawer");
        newDrawerBtn.clicked.connect(() => {
            NewDrawerDialog newDrawerDialog = new NewDrawerDialog(this);
            int response = newDrawerDialog.run();

            if (response == ResponseType.OK) {

                string drawerName = newDrawerDialog.drawerName.get_text();
                string drawerIcon = newDrawerDialog.drawerIconFileName;
                stdout.printf ("drawerName %s\n", drawerName);
                stdout.printf ("drawerIcon %s\n", drawerIcon);
                this.notebook.createPage(drawerName, drawerIcon, true);
            }

            newDrawerDialog.destroy();
        });

        img = new Image.from_icon_name ("document-open", Gtk.IconSize.SMALL_TOOLBAR);
        ToolButton openDrawerBtn = new ToolButton(img, null);
        openDrawerBtn.set_tooltip_text("Open Drawer");

        toolbar.add(newDrawerBtn);
        toolbar.add(openDrawerBtn);


        return toolbar;
    }
}

