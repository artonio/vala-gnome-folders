using Gtk;

public class TabsView: Notebook {

    TargetList targets;

    public const uint URI_LIST_MIME_TYPE = 0;
    public const uint TEXT_LIST_MIME_TYPE = 1;

    public TabsView() {
        this.targets = new TargetList({});
        this.targets.add_uri_targets(URI_LIST_MIME_TYPE);
        this.targets.add_text_targets(TEXT_LIST_MIME_TYPE);

    }

    public void createPage(string drawerLabel, string? drawerIconFileName, bool isNewFile) {
        //ScrolledWindowIconView scrolledWindow = this.createContent(drawerLabel, drawerIconFileName, isNewFile);
        //ScrolledWindowIconView sw1 = new ScrolledWindowIconView(null, null);
        ScrolledWindowIconView sw2 = new ScrolledWindowIconView.initWithProps(this.targets, "test", "t", true);


        //ScrolledWindow sw = new ScrolledWindow(null, null);

        TabLabel tabLabel = new TabLabel(drawerLabel, drawerIconFileName);
        this.append_page(sw2, tabLabel);
        this.show_all();
    }

}