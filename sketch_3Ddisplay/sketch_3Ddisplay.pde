import controlP5.*;

ControlP5 cp5;

Window tw;

processing.awt.PSurfaceAWT.SmoothCanvas frame;
PVector initialPos = new PVector(0, 0);
int a = 3;

CurveView myview;

void setup () {
	noSmooth();

	frame = (processing.awt.PSurfaceAWT.SmoothCanvas)surface.getNative();
	surface.setSize(800, 600);

	initialPos = new PVector(displayWidth / 2 - width / 2, displayHeight / 2 - height / 2);
	surface.setLocation((int)initialPos.x, (int)initialPos.y);

	cp5 = new ControlP5(this);

	myview = new CurveView("3D Test Application", width, height);
	myview.Setup();

	tw = new ToolsWindow(this,"ToolBox", 220, 300, myview);

}

void draw() {
	clear();
	myview.Update();
}

void mouseReleased() {
	Controller c = myview.GetController(0);
	myview.GetToolset().GetSelectedTool().Use();
	if (c.GetSelectedControlPoint() != null) {
		c.GetSelectedControlPoint().GetBackInFrame(0, 0, width, height);
		c.SetSelectedControlPoint(null);
	}
}

void mousePressed() {
	if (myview.GetToolset().GetSelectedTool().GetName() == "MoveControlPoint") {
		 myview.GetToolset().GetSelectedTool().Use();
	}
}

void mouseDragged() {
	if (myview.GetToolset().GetSelectedTool().GetName() == "MoveControlPoint") {
		 myview.GetToolset().GetSelectedTool().Use();
	}
}

void keyPressed() {
	if (key == 't') {
		myview.GetToolset().IncrementSelectedToolIndex();
	}
	
	if (key == 'm') {
		myview.GetToolset().SetSelectedTool("MoveControlPoint");
	}
	
	if (key == 'c') {
		myview.GetController(0).RemoveModels();
	}
}