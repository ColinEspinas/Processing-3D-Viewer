class Pixel {
  protected PVector m_pos;
  protected color m_color;
  
  Pixel(int x, int y, color c) {
    m_pos = new PVector(x, y);
    m_color = c;
  }
  
  Pixel(PVector pos, color c) {
    m_pos = pos;
    m_color = c;
  }
  
  public void SetPos(int x, int y) { 
    m_pos.x = x;
    m_pos.y = y;
  }
  public void SetPos(PVector pos) { m_pos = pos; }
  public void SetX(int x) { m_pos.x = x; }
  public void SetY(int y) { m_pos.y = y; }
  
  public PVector GetPos() { return m_pos; }
  
  public void SetColor(color c) { m_color = c; }
  public color GetColor() { return m_color; }
  
  public void Draw() {
     stroke(m_color);
     point(m_pos.x, m_pos.y);
  }
}
