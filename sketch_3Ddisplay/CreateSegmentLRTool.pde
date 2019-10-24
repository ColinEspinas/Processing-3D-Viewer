class CreateSegmentLRTool extends Tool {
	CreateSegmentLRTool() { super(); }
	CreateSegmentLRTool(Toolset ts) { super(ts); }
	CreateSegmentLRTool(String name) { super(name); }
	CreateSegmentLRTool(Toolset ts, String name) { super(ts, name); }
	
	public void Use() {
		m_toolset.GetSelectedTool().AddControlPoint(new ControlPoint(mouseX, mouseY));
		if (m_controlPoints.size() >= 2) {
			m_toolset.GetView().GetController(0).AddModel(new SegmentLR(GetControlPoint(0), GetControlPoint(1)));
			Reset();
		}
	}
}
