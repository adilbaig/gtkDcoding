// Test Rig Foundation for Learning GtkD Coding

import std.stdio;

import gtk.MainWindow;
import gtk.Main;
import gtk.Widget;
import gtk.Button;

void main(string[] args)
{
	Main.init(args);
	TestRigWindow myTestRig = new TestRigWindow("Test Rig");
	
	ResizeButton button = new ResizeButton(myTestRig);
	myTestRig.add(button);

	// Show the window and its contents...
	myTestRig.showAll();

	// give control over to gtkD.
	Main.run();
	
} // main()


class TestRigWindow : MainWindow
{
	this(string title)
	{
		super(title);
		addOnDestroy(delegate void(Widget w) { quitApp(); } );

		setDefaultSize(640, 480);                                                 // *** NEW ***

	} // this() CONSTRUCTOR
	
	
	void quitApp()
	{
		// This exists in case we want to do anything
		// before exiting such as warn the user to
		// save work.
		writeln("Bye.");
		Main.quit();
		
	} // quitApp()

} // class myAppWindow


class ResizeButton : Button                                                     // *** NEW ***
{
	this(MainWindow window)
	{
		super("Resize Window");
		addOnClicked(delegate void(Button b) { resizeMe(window); });
		
	} // this()
	
	
	void resizeMe(MainWindow window)
	{
		int x, y;
		
		window.getSize(x, y);
		writeln("x = ", x, "y = ", y);
		
		// GTK deals in minimum sizes, not absolute sizes, therefore we can set
		// a minimum size for a window, but not a maximum. Also, we can't set
		// a new size smaller than the current size.
		if(x < 640)
		{
			window.setSizeRequest(640, 480);
		}
		else if(x > 641)
		{
			// The effect here is to set a minimum size and it can't be made smaller
			// after this condition becomes true.
			writeln("Minimum size is now set. You can shrink it, but not below the minimum size.");
			window.setSizeRequest(-1, -1);
		}
	}
} // class ResizeButton
