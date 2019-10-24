class CreateVerticalTool extends Tool {
	
	CreateVerticalTool() { super(); }
	CreateVerticalTool(Toolset ts) { super(ts); }
	CreateVerticalTool(String name) { super(name); }
	CreateVerticalTool(Toolset ts, String name) { super(ts, name); }
	
	public void Use() {
		m_toolset.GetSelectedTool().AddControlPoint(new ControlPoint(mouseX, mouseY));
		if (m_controlPoints.size() >= 2) {
			m_toolset.GetView().GetController(0).AddModel(new Vertical(GetControlPoint(0), GetControlPoint(1)));
			Reset();
		}
	}
}
