class Horizontal extends Model {
  
  Horizontal(int x1, int y1, int x2, int y2) {
    AddControlPoint(x1, y1);
    AddControlPoint(x2, y2);
  }
  
  Horizontal(ControlPoint cp1, ControlPoint cp2) {
    AddControlPoint(cp1);
    AddControlPoint(cp2);
  }
  
  public void Draw() {
    if (m_controlPoints.size() == 2) {
      ControlPoint cp1 = m_controlPoints.get(0);
      ControlPoint cp2 = m_controlPoints.get(1);
      int x1 = (int)cp1.GetPos().x;
      int x2 = (int)cp2.GetPos().x;
      int y = (int)cp1.GetPos().y;
      
      int xMin = min(x1, x2);
      int xMax = max(x1, x2);
      
      for (int x = xMin; x < xMax; ++x) {
        DrawPixel(x, y, color(0, 0, 0));
      }
    }
    super.Draw();
  }
}
