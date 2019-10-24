class CurveView extends View {
	CurveView(int w, int h) { super(w, h); }
	CurveView(int w, int h, color c) { super(w, h, c); }
	CurveView(String title, int w, int h) { super(title, w, h); }
	CurveView(String title, int w, int h, color c) { super(title, w, h, c); }
	
	public void Setup() {
		super.Setup();
		AddController(new Controller());
		GetToolset().AddTool(new CreateHorizontalTool("CreateHorizontal"));
		GetToolset().AddTool(new CreateVerticalTool("CreateVertical"));
		GetToolset().AddTool(new CreateSegmentLRTool("CreateSegmentLR"));
		GetToolset().AddTool(new CreateSegmentMPTool("CreateSegmentMP"));
		GetToolset().AddTool(new MoveControlPointTool("MoveControlPoint"));
		GetToolset().SetSelectedToolIndex(0);
	}
}
