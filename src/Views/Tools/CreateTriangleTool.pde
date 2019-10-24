class CreateTriangleTool extends Tool {
	
	CreateTriangleTool() { super(); }
	CreateTriangleTool(Toolset ts) { super(ts); }
	CreateTriangleTool(String name) { super(name); }
	CreateTriangleTool(Toolset ts, String name) { super(ts, name); }
	
	public void Use() {
		m_toolset.GetSelectedTool().AddControlPoint(new ControlPoint(mouseX, mouseY));
		if (m_controlPoints.size() >= 3) {
			m_toolset.GetView().GetController(0).AddModel(new FilledTriangle(GetControlPoint(0), GetControlPoint(1), GetControlPoint(2)));
			Reset();
		}
	}
}
