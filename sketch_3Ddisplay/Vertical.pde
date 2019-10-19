class Vertical extends Model {
  
  Vertical(int x1, int y1, int x2, int y2) {
    AddControlPoint(x1, y1);
    AddControlPoint(x2, y2);
  }
  
  Vertical(ControlPoint cp1, ControlPoint cp2) {
    AddControlPoint(cp1);
    AddControlPoint(cp2);
  }
  
  public void Draw() {
    if (m_controlPoints.size() == 2) {
      ControlPoint cp1 = m_controlPoints.get(0);
      ControlPoint cp2 = m_controlPoints.get(1);
      int y1 = (int)cp1.GetPos().y;
      int y2 = (int)cp2.GetPos().y;
      int x = (int)cp1.GetPos().x;
      
      int yMin = min(y1, y2);
      int yMax = max(y1, y2);
      
      for (int y = yMin; y < yMax; ++y) {
        DrawPixel(x, y, color(0, 0, 0));
      }
    }
    super.Draw();
  }
}
