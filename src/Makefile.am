bin_PROGRAMS = vala-folders
vala_folders_SOURCES = main.vala AppMainWindow.vala Utils.vala dialogs/NewDrawerDialog.vala dialogs/DrawerIconChooserDialog.vala tabs/TabsView.vala tabs/TabLabel.vala tabs/content/ScrolledWindowIconView.vala tabs/content/ShortcutsIconView.vala
vala_folders_CPPFLAGS = $(VALA_FOLDERS_CFLAGS)
vala_folders_VALAFLAGS = --pkg gtk+-3.0 --pkg gee-0.8 --pkg gio-unix-2.0

vala_folders_LDADD = $(VALA_FOLDERS_LIBS)

-include $(top_srcdir)/git.mk
