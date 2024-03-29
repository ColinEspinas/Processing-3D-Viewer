class SegmentMP extends Model {

	protected color m_color;

	SegmentMP(ControlPoint cp1, ControlPoint cp2) {
		AddControlPoint(cp1);
		AddControlPoint(cp2);
		m_color = color(0, 0, 0);
	}

	SegmentMP(ControlPoint cp1, ControlPoint cp2, color c) {
		AddControlPoint(cp1);
		AddControlPoint(cp2);
		m_color = c;
	}
	
	public void Draw() {
		if (m_controlPoints.size() == 2) {
			ControlPoint cp1 = m_controlPoints.get(0);
			ControlPoint cp2 = m_controlPoints.get(1);
			 
			int xTop, yTop, xBottom, yBottom;
			 
			if (cp1.GetPos().y <= cp2.GetPos().y) {
				xBottom = (int)cp1.GetPos().x;
				yBottom = (int)cp1.GetPos().y;
				xTop = (int)cp2.GetPos().x;
				yTop = (int)cp2.GetPos().y;
			} else {
				xBottom = (int)cp2.GetPos().x;
				yBottom = (int)cp2.GetPos().y;
				xTop = (int)cp1.GetPos().x;
				yTop = (int)cp1.GetPos().y;
			}
			 
			int dx, dy, dp, deltaE, deltaNE;
			int x = xBottom;
			int y = yBottom;
			 
			if (xTop >= xBottom) {
				dx = xTop - xBottom;
				dy = yTop - yBottom;
				if (dx >= dy) {
					dp = 2 * dy - dx;
					deltaE = 2 * dy;
					deltaNE = 2 * (dy - dx);
					DrawPixel(x, y, m_color);
					while(y < yTop || x != xTop) {
						if (dp <= 0) {
							dp += deltaE;
							x++;
						}
						else {
							dp += deltaNE;
							x++;
							y++;
						}
						DrawPixel(x, y, m_color);
					}
				}
				else {
					dp = 2 * dx - dy;
					deltaE = 2 * dx;
					deltaNE = 2 * (dx - dy);
					DrawPixel(x, y, color(0, 0, 0));
					while(y < yTop || x != xTop) {
						if (dp <= 0) {
							dp += deltaE;
							y++;
						}
						else {
							dp += deltaNE;
							x++;
							y++;
						}
						DrawPixel(x, y, m_color);
					}
				}
			 }
			 else {
				dx = xBottom - xTop;
				dy = yTop - yBottom;
				if (dx >= dy) {
					dp = 2 * dy - dx;
					deltaE = 2 * dy;
					deltaNE = 2 * (dy - dx);
					DrawPixel(x, y, m_color);
					while(y < yTop || x != xTop) {
						if (dp <= 0) {
							dp += deltaE;
							x--;
						}
						else {
							dp += deltaNE;
							x--;
							y++;
						}
						DrawPixel(x, y, m_color);
					}
				}
				else {
					dp = 2 * dx - dy;
					deltaE = 2 * dx;
					deltaNE = 2 * (dx - dy);
					DrawPixel(x, y, m_color);
					while(y < yTop || x != xTop) {
						if (dp <= 0) {
							dp += deltaE;
							y++;
						}
						else {
							dp += deltaNE;
							x--;
							y++;
						}
						DrawPixel(x, y, m_color);
					}
				}
			}	
		}
		super.Draw();
	}
}
