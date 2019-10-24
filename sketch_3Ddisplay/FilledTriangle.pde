public class FilledTriangle extends Model {

	protected color m_color;

	FilledTriangle(int x1, int y1, int x2, int y2, int x3, int y3) {
		AddControlPoint(x1, y1);
		AddControlPoint(x2, y2);
		AddControlPoint(x3, y3);
	}

	FilledTriangle(int x1, int y1, int x2, int y2, int x3, int y3, color c) {
		AddControlPoint(x1, y1);
		AddControlPoint(x2, y2);
		AddControlPoint(x3, y3);
		m_color = c;
	}
	
	FilledTriangle(ControlPoint cp1, ControlPoint cp2, ControlPoint cp3) {
		AddControlPoint(cp1);
		AddControlPoint(cp2);
		AddControlPoint(cp3);
	}

	FilledTriangle(ControlPoint cp1, ControlPoint cp2, ControlPoint cp3, color c) {
		AddControlPoint(cp1);
		AddControlPoint(cp2);
		AddControlPoint(cp3);
		m_color = c;
	}
	
	public void Draw() {
		if (m_controlPoints.size() == 3) {
			ControlPoint cp1 = m_controlPoints.get(0);
			ControlPoint cp2 = m_controlPoints.get(1);
			ControlPoint cp3 = m_controlPoints.get(2);
		}
		super.Draw();
	}

}