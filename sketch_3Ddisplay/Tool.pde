class Tool {
	protected Toolset m_toolset;
	protected String m_name = null;
	
	protected ArrayList<ControlPoint> m_controlPoints = new ArrayList<ControlPoint>();
	protected Model m_model;
	
	Tool() { m_toolset = null; }
	Tool(Toolset ts) { m_toolset = ts; }
	Tool(String name) {
		m_toolset = null;
		m_name = name;
	}
	Tool(Toolset ts, String name) {
		m_toolset = ts;
		m_name = name;
	}
	
	public void SetToolset(Toolset ts) { m_toolset = ts; }
	public Toolset GetToolset() { return m_toolset; }
	
	public void SetName(String name) { m_name = name; }
	public String GetName() { return m_name; }
	
	public void AddControlPoint(ControlPoint cp) { m_controlPoints.add(cp); }
	public ControlPoint GetControlPoint(int i) { return m_controlPoints.get(i); }
	
	public void SetModel(Model m) { m_model = m; }
	public Model GetModel() { return m_model; }
	
	public void Reset() {
		m_model = null;
		m_controlPoints = new ArrayList<ControlPoint>();
	}
	
	public void DrawControls() {
		 for (ControlPoint cp : m_controlPoints) {
			 cp.Draw();
		 }
	}
	
	public void Use() {};
	
}
