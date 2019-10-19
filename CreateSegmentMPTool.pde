class CreateSegmentMPTool extends Tool {
  CreateSegmentMPTool() { super(); }
  CreateSegmentMPTool(Toolset ts) { super(ts); }
  CreateSegmentMPTool(String name) { super(name); }
  CreateSegmentMPTool(Toolset ts, String name) { super(ts, name); }
  
  public void Use() {
    m_toolset.GetSelectedTool().AddControlPoint(new ControlPoint(mouseX, mouseY));
    if (m_controlPoints.size() >= 2) {
      m_toolset.GetView().GetController(0).AddModel(new SegmentMP(GetControlPoint(0), GetControlPoint(1)));
      Reset();
    }
  }
}
