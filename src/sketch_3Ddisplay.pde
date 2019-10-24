
CurveView myview;

void setup () {
	noSmooth();
	size(800, 600);
	myview = new CurveView("3D Test Application", width, height);
	myview.Setup();
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
