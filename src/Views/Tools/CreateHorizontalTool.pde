class CreateHorizontalTool extends Tool {
	
	CreateHorizontalTool() { super(); }
	CreateHorizontalTool(Toolset ts) { super(ts); }
	CreateHorizontalTool(String name) { super(name); }
	CreateHorizontalTool(Toolset ts, String name) { super(ts, name); }
	
	public void Use() {
		m_toolset.GetSelectedTool().AddControlPoint(new ControlPoint(mouseX, mouseY));
		if (m_controlPoints.size() >= 2) {
			m_toolset.GetView().GetController(0).AddModel(new Horizontal(GetControlPoint(0), GetControlPoint(1)));
			Reset();
		}
	}
}
