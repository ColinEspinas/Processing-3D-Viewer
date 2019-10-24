class Toolset {
	protected ArrayList<Tool> m_tools = new ArrayList<Tool>();
	protected int m_selectedToolIndex = -1;
	
	protected View m_view;
	
	Toolset(View v) { m_view = v; }
	
	public void SetView(View v) { m_view = v; }
	public View GetView() { return m_view; }
	
	public Tool GetTool(int i) { return m_tools.get(i); }
	public Tool GetTool(String name) {
		for(Tool t : m_tools) {
			if (t.GetName() == name) {
				return t;
			}
		}
		return null;
	}
	public int GetToolIndex(String name) {
		for (int i = 0; i < m_tools.size(); ++i) {
			if (m_tools.get(i).GetName() == name) {
				return i;
			}
		}
		return -1;
	}
	public void AddTool(Tool t) { t.SetToolset(this); m_tools.add(t); }
	public void RemoveTool(int i) { m_tools.remove(i); }
	public void RemoveTool(Tool t) { m_tools.remove(t); }
	
	public int GetSelectedToolIndex() { return m_selectedToolIndex; }
	public Tool GetSelectedTool() { return m_tools.get(m_selectedToolIndex); }
	public void SetSelectedTool(String name) { m_selectedToolIndex = GetToolIndex(name); }
	public void SetSelectedToolIndex(int i) { m_selectedToolIndex = i; }
	public void IncrementSelectedToolIndex() {
		GetSelectedTool().Reset();
		m_selectedToolIndex = (m_selectedToolIndex + 1) % m_tools.size(); 
	}
	
	public int GetToolCount() { return m_tools.size(); }
}
