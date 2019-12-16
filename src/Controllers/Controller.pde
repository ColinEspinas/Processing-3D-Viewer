class Controller {
	protected ArrayList<Model> m_models = new ArrayList<Model>();
	protected ControlPoint m_selectedControlPoint;
	
	protected View m_view;

	protected boolean m_canDraw = true;
	
	public void AddModel(Model m) { m.SetController(this); m_models.add(m); }
	public void RemoveModel(int i) { m_models.remove(i); }
	public void RemoveModel(Model m) { m_models.remove(m); }
	public void RemoveModels() {
		for (int i = 0; i < m_models.size(); ++i) {
			m_models.remove(i);
		}
	}
	public Model GetModel(int i) { return m_models.get(i); }
	public int GetModelsCount() { return m_models.size(); }
	
	public void SetView(View v) { m_view = v; }
	public View GetView() { return m_view; }
	
	public ControlPoint GetSelectedControlPoint() {
		return m_selectedControlPoint;
	}
	
	public void SetSelectedControlPoint(ControlPoint cp) {
		if (m_selectedControlPoint != null) {
			m_selectedControlPoint.SetIsSelected(false);
		}
		m_selectedControlPoint = cp;
		if (m_selectedControlPoint != null) {
			m_selectedControlPoint.SetIsSelected(true);
		}
	}
	
	public ControlPoint GetNearestControlPoint(int x, int y, float maxDist) {
		ControlPoint nearestCp = null;
		float nearestDistance = maxDist;
		float currentDistance;
		for (Model m : m_models) {
			for (ControlPoint cp : m.GetControlPoints()) {
				currentDistance = cp.GetDistanceTo(x, y);
				if (currentDistance < nearestDistance) {
					nearestCp = cp;
			nearestDistance = currentDistance;
				}
			}
		}
		return nearestCp;
	}
	
	public ControlPoint GetNearestControlPoint(int x, int y) {
		return GetNearestControlPoint(x, y, Float.MAX_VALUE); 
	}
	
	public void DrawPixel(int x, int y, color c) {
		m_view.DrawPixel(x, y, c);
	}

	public void CanDraw(boolean canDraw) { m_canDraw = canDraw; }
	
	public void Draw() {
		if (m_canDraw) {
			for (Model m : m_models) {
				m.Draw();
			}
		}
	}
}
