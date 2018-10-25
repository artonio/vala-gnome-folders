/* main.vala
 *
 * Copyright 2018 Parallels
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using Gtk;

int main (string[] args) {
    Gtk.init (ref args);

    AppMainWindow win = new AppMainWindow();


    /*var window = new Window ();
    window.title = "vala-folders";
    window.set_default_size (200, 200);
    window.destroy.connect (Gtk.main_quit);

    /* You can add GTK+ widgets to your window here.
     * See https://developer.gnome.org/ for help.
     */

    win.show_all ();

    Gtk.main ();
    return 0;
}
