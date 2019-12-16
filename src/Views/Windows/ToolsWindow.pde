public class ToolsWindow extends Window {
	
	// GUI Elements
	Textlabel selectedToolLabel;
	DropdownList toolDropList;
	ColorWheel colorpick;
	Button loadModelButton;
	ObjectFileLoader objloader;

	View m_view;

	boolean canOpenFile = false;
	boolean showControls = false;

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

		loadModelButton = m_cp5.addButton("LoadModel")
							.setCaptionLabel("Load a model")
							.setValue(0)
							.setPosition(10,300)
							.setSize(200,19);

		loadModelButton = m_cp5.addButton("ToggleControls")
							.setCaptionLabel("Toggle Controls")
							.setValue(0)
							.setPosition(10,330)
							.setSize(200,19);

		objloader = ((sketch_3Ddisplay)m_parent).objloader;

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

	public void LoadModel(int value) {
		if (canOpenFile)
			selectInput("Select a file to open:", "objectFileSelected");
		canOpenFile = true;
	}

	public void ToggleControls(int value) {
		showControls = !showControls;
		RefreshShowControls();
	}

	public void RefreshShowControls() {
		for (int i = 0; i < m_view.GetController(0).GetModelsCount(); ++i) {
			if (showControls) {
				m_view.GetController(0).GetModel(i).SetShowControls(true);
			}
			else {
				m_view.GetController(0).GetModel(i).SetShowControls(false);
			}
		}
	}

	void objectFileSelected(File f) {
		if (f == null) {
			println("Window was closed or the user hit cancel.");
		} else {
			String fext = f.getName().substring(f.getName().indexOf(".") + 1);
			if (fext.equals("obj")) {
				println("User selected " + f.getAbsolutePath());
				m_view.GetController(0).CanDraw(false);
				objloader.LoadObject(f.getAbsolutePath(), f.getName().replaceFirst("[.][^.]+$", ""));
				m_view.GetController(0).CanDraw(true);
				RefreshShowControls();
			}
			else {
				selectInput("Select a file to open:", "objectFileSelected");
			}
		}
	}

	void textureFileSelected(File f) {
		if (f == null) {
			println("Window was closed or the user hit cancel.");
		} else {
			println("User selected " + f.getAbsolutePath());
			objloader.LoadTexture(objloader.m_loadingMesh, f.getAbsolutePath());
		}
	}
}
