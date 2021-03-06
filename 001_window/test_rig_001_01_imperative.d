// Test Rig Foundation for Learning GtkD Coding

import std.stdio;

import gtk.MainWindow;
import gtk.Main;
import gtk.Widget;

void main(string[] args)
{
	Main.init(args);
	MainWindow myTestRig = new MainWindow("Test Rig");
	myTestRig.addOnDestroy(delegate void(Widget w) { quitApp(); } );
	
	writeln("Hello GtkD Imperative");

	// Show the window and its contents...
	myTestRig.showAll();
		
	// give control over to the gtkD .
	Main.run();
	
} // main()


void quitApp()
{
	// This exists in case we want to do anything
	// before exiting such as warn the user to
	// save work.
	writeln("Bye.");
	Main.quit();
	
} // quitApp()
