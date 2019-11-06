public class ToolsWindow extends Window {
	
	
	// GUI Elements
	Textlabel selectedToolLabel;
	DropdownList toolDropList;
	ColorWheel colorpick;

	View m_view;

	private ToolsWindow(View v) {
		super();
		m_view = v;
	}

	public ToolsWindow(PApplet app, int w, int h, View v) {
		super(app, w, h);
		m_view = v;
	}

	public ToolsWindow(PApplet app, String title, int w, int h, View v) {
		super(app, title, w, h);
		m_view = v;
	}

	public void setup() {
		super.setup();

		// m_surface.setLocation((int)m_parent.initialPos.x, (int)m_parent.initialPos.y);

		m_cp5 = new ControlP5(this);

		colorpick = m_cp5.addColorWheel("Colorpick").setPosition(10, 60).setSize(200, 200).setRGB(color(0));
		toolDropList = m_cp5.addDropdownList("Tools").setPosition(10, 30).setSize(200,200);
		selectedToolLabel = m_cp5.addTextlabel("ToolLabel").setPosition(10, 10).setSize(200,50)
							.setText("Selected tool : None");

		SetupToolGUI();
	}

	private void SetupToolGUI() {
		// a convenience function to customize a DropdownList
		toolDropList.setBackgroundColor(color(190));
		toolDropList.setItemHeight(20);
		toolDropList.setBarHeight(15);
		for (int i = 0; i < m_view.GetToolset().GetToolCount(); i++) {
			toolDropList.addItem(m_view.GetToolset().GetTool(i).GetName(), i);
		}
		//ddl.scroll(0);
		toolDropList.setColorBackground(color(60));
		toolDropList.setColorActive(color(255, 128));
		toolDropList.setOpen(false);
	}

	void draw() {
		super.draw();
		background(0);
		selectedToolLabel.setText("Selected tool : " + m_view.GetToolset().GetSelectedTool().GetName());
	}

	void controlEvent(ControlEvent e) {
		if (e.isGroup()) {
			println("event from group : " + e.getGroup().getValue() + " from " + e.getGroup());
		} 
		else if (e.isController()) {
			if (e.getController().getName() == "Tools")
			if (e.getController().getValue() < m_view.GetToolset().GetToolCount()) {
				m_view.GetToolset().SetSelectedToolIndex((int)e.getController().getValue());
				if (m_view.GetToolset().GetSelectedTool() == m_view.GetToolset().GetTool("CreateTriangle")) {
					CreateTriangleTool tool = (CreateTriangleTool)m_view.GetToolset().GetSelectedTool();
					tool.SetColor(GetSelectedColor());
				}
				println("Selected Tool : " + e.getController().getValue());
			}
			if (e.getController().getName() == "Colorpick")
				if (m_view.GetToolset().GetSelectedTool() == m_view.GetToolset().GetTool("CreateTriangle")) {
					CreateTriangleTool tool = (CreateTriangleTool)m_view.GetToolset().GetSelectedTool();
					tool.SetColor(GetSelectedColor());
				}
		}
	}

	public color GetSelectedColor() {
		return colorpick.getRGB();
	}
}
