public class FilledTriangle extends Model {

	protected color m_color = color(0);

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

	public ArrayList<ControlPoint> SortControlPoints(ArrayList<ControlPoint> cps) {
		ArrayList<ControlPoint> controlPoints = new ArrayList<ControlPoint>();
		for (int i = 0; i < 3; ++i) {
			if (i == 0) {
				controlPoints.add(m_controlPoints.get(0));
			}
			else {
				int insertIndex = -1;
				for (int j = 0; j < controlPoints.size(); ++j) {
					if (m_controlPoints.get(i).GetPos().y <= controlPoints.get(j).GetPos().y) {
						insertIndex = j;
						break;
					}
				}
				if (insertIndex > -1) {
					controlPoints.add(insertIndex, m_controlPoints.get(i));
				}
				else {
					controlPoints.add(m_controlPoints.get(i));
				}
			}
		}
		return controlPoints;
	}

	public int ComputeIncrement(boolean left, int num, int den) {
		if (left) {
			if (num > 0) return den - 1;
			else return 0;
		}
		else {
			if (num > 0) return -1;
			else return -den;
		}
	}
	
	protected void DrawPixels(int x0, int x1, int y, color c) {
		int xMax, xMin;
		if (x0 > x1) {
			xMax = x0;
			xMin = x1;
		}
		else {
			xMax = x1;
			xMin = x0;
		}
		for (; xMin <= xMax; ++xMin) {
			DrawPixel(xMin, y, c);
		}
	}

	public void Draw() {

		ControlPoint pMin, pMoy, pMax;

		if (m_controlPoints.size() != 3) { return; }

		ArrayList<ControlPoint> cps = SortControlPoints(m_controlPoints);

		pMin = cps.get(0);
		pMoy = cps.get(1);
		pMax = cps.get(2);

		Edge lEdge = new Edge(
			(int)pMoy.GetPos().y, 
			(int)pMin.GetPos().x, 
			(int)(pMoy.GetPos().x - pMin.GetPos().x),
			(int)(pMoy.GetPos().y - pMin.GetPos().y),
			ComputeIncrement(true, (int)(pMoy.GetPos().x - pMin.GetPos().x), (int)(pMoy.GetPos().y - pMin.GetPos().y))
		);

		Edge rEdge = new Edge(
			(int)pMax.GetPos().y, 
			(int)pMin.GetPos().x, 
			(int)(pMax.GetPos().x - pMin.GetPos().x),
			(int)(pMax.GetPos().y - pMin.GetPos().y),
			ComputeIncrement(false, (int)(pMax.GetPos().x - pMin.GetPos().x), (int)(pMax.GetPos().y - pMin.GetPos().y))
		);

		int y = (int)pMin.GetPos().y;

		for (; y < pMoy.GetPos().y; ++y) {
			DrawPixels(lEdge.GetX(), rEdge.GetX(), y, m_color);
			lEdge.Update();
			rEdge.Update();
		}

		lEdge = new Edge(
			(int)pMax.GetPos().y, 
			(int)pMoy.GetPos().x, 
			(int)(pMax.GetPos().x - pMoy.GetPos().x),
			(int)(pMax.GetPos().y - pMoy.GetPos().y),
			ComputeIncrement(true, (int)(pMax.GetPos().x - pMoy.GetPos().x), (int)(pMax.GetPos().y - pMoy.GetPos().y))
		);

		for (; y <= pMax.GetPos().y; ++y) {
			DrawPixels(lEdge.GetX(), rEdge.GetX(), y, m_color);
			lEdge.Update();
			rEdge.Update();
		}

		super.Draw();
	}
}