class ControlPoint {
  protected PVector m_pos = new PVector();
  protected int m_size;
  protected color m_color;
  
  protected boolean m_isSelected;
  protected int m_selectedSize = 10;
  protected color m_selectedColor = color(100, 255, 255);
  
  ControlPoint(int x, int y, int size, color c) {
    m_pos.x = x;
    m_pos.y = y;
    m_size = size;
    m_color = c;
  }
  
  ControlPoint(int x, int y, int size) {
    m_pos.x = x;
    m_pos.y = y;
    m_size = size;
    m_color = color(0, 0, 255);
  }
  
  ControlPoint(int x, int y) {
    m_pos.x = x;
    m_pos.y = y;
    m_size = 5;
    m_color = color(0, 0, 255);
  }
  
  public void SetPos(int x, int y) {
    m_pos.x = x;
    m_pos.y = y;
  }
  public void SetPos(PVector pos) { m_pos = pos; }
  public PVector GetPos() { return m_pos; }
  
  public void Draw() {
    if (!m_isSelected) {
      noStroke();
      fill(m_color);
      square(m_pos.x - m_size / 2, m_pos.y - m_size / 2, m_size);
    }
    else {
      stroke(color(0, 0, 0));
      fill(m_selectedColor);
      square(m_pos.x - m_selectedSize / 2, m_pos.y - m_selectedSize / 2, m_selectedSize);
    }
  }
  
  public void Move(int x, int y) {
    m_pos.x = x;
    m_pos.y = y;
  }
  
  public void Move(PVector pos) {
    m_pos = pos;
  }
  
  public float GetDistanceTo(int x, int y) {
    float dist = sqrt(pow((m_pos.x - x), 2) + pow((m_pos.y - y), 2));
    return dist;
  }
  
  public boolean IsHovered(int x, int y, int radius) {
    if (x <= m_pos.x + m_size + radius && x >= m_pos.x - radius && y <= m_pos.y + m_size + radius && y >= m_pos.y - radius) {
      return true;
    } else {
      return false;
    }
  }
  
  public void GetBackInFrame(int x0, int y0, int x1, int y1) {
    if (m_pos.x < x0) {
      m_pos.x = x0;
    }
    if (m_pos.x > x1) {
      m_pos.x = x1;
    }
    if (m_pos.y < y0) {
      m_pos.y = y0;
    }
    if (m_pos.y > y1) {
      m_pos.y = y1;
    }
  }
  
  public boolean GetIsSelected() { return m_isSelected; }
  public void SetIsSelected(boolean selected) { m_isSelected = selected; }
  
  
  
}
