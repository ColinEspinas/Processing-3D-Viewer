class Model {
	protected ArrayList<ControlPoint> m_controlPoints = new ArrayList<ControlPoint>();
	protected boolean m_showControls = true;
	
	protected Controller m_controller;
	
	public void AddControlPoint(int x, int y) { m_controlPoints.add(new ControlPoint(x, y, 5)); }
	public void AddControlPoint(ControlPoint cp) { m_controlPoints.add(cp); }
	public void RemoveControlPoint(int i) { m_controlPoints.remove(i); }
	public ControlPoint GetControlPoint(int i) { return m_controlPoints.get(i); }
	public ArrayList<ControlPoint> GetControlPoints() { return new ArrayList<ControlPoint>(m_controlPoints); }
	
	public void ToggleControls() {
		m_showControls = !m_showControls;
	}
	
	public void DrawControls() {
		if (m_showControls) {
			for (ControlPoint cp : m_controlPoints) {
				cp.Draw();
			}
		}
	}
	
	public void SetController(Controller c) { m_controller = c; }
	public Controller GetController() { return m_controller; }
	
	public void DrawPixel(int x, int y, color c) {
		m_controller.DrawPixel(x, y, c);
	}
	
	public void Draw() {
		DrawControls();
	}
}
