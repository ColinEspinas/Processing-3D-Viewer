class MoveControlPointTool extends Tool {
  
  MoveControlPointTool() { super(); }
  MoveControlPointTool(Toolset ts) { super(ts); }
  MoveControlPointTool(String name) { super(name); }
  MoveControlPointTool(Toolset ts, String name) { super(ts, name); }
  
  public void Use() {
    View v = m_toolset.GetView();
    Controller c = v.GetController(0);
    
    if (c.GetSelectedControlPoint() == null) {
      c.SetSelectedControlPoint(c.GetNearestControlPoint(mouseX, mouseY, 30));
    }
    else {
      c.GetSelectedControlPoint().Move(mouseX, mouseY);
    }
    
  }
}
