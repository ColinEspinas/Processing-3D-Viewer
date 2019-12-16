class View {
	protected String m_title = "Unnamed Application";
	
	protected int m_width;
	protected int m_height;
	
	protected Pixel[][] m_pixels;
	protected PImage m_image;
	
	protected color m_backgroundColor;
	
	protected ArrayList<Controller> m_controllers = new ArrayList<Controller>();
	
	protected Toolset m_toolset = new Toolset(this);
	
	View(int w, int h) {
		m_width = w;
		m_height = h;
		m_backgroundColor = color(255, 255, 255);
	}
	
	View(int w, int h, color c) {
		m_width = w;
		m_height = h;
		m_backgroundColor = c;
	}
	
	View(String title, int w, int h) {
		m_title = title;
		m_width = w;
		m_height = h;
		m_backgroundColor = color(255, 255, 255);
	}
	
	View(String title, int w, int h, color c) {
		m_title = title;
		m_width = w;
		m_height = h;
		m_backgroundColor = c;
	}
	
	public void SetWidth(int w) { m_width = w; }
	public int GetWidth() { return m_width; }
	
	public void SetHeight(int h) { m_height = h; }
	public int GetHeight() { return m_height; }
	
	public Controller GetController(int i) {
		if (i >= 0 && i < m_controllers.size()) {
			return m_controllers.get(i);
		}
		return null;
	}
	
	public void AddController(Controller c) {
		if (c != null) {
			 c.SetView(this);
			 m_controllers.add(c);
		}
	}
	
	public Toolset GetToolset() { return m_toolset; }
	
	protected void CreateImage() {
		m_image = createImage(m_width, m_height, RGB);
		m_pixels = new Pixel[m_width][m_height];
		m_image.loadPixels();
		for (int x = 0; x < m_width; ++x) {
			for (int y = 0; y < m_height; ++y) {
				Pixel p = new Pixel(x, y, m_backgroundColor);
				m_pixels[x][y] = p;
			}
		}
		int dim = m_width * m_height;
		for (int i = 0; i < dim; ++i) {
			m_image.pixels[i] = m_pixels[i % m_width][i / m_width].GetColor();
		}
		m_image.updatePixels();
	}
	
	public void DrawPixel(int x, int y, color c) {
		if (x < m_width && x >= 0 && y < m_height && y >= 0) {
			m_pixels[x][y].SetColor(c);
		}
	};
	
	public void ResetPixels() {
		for (int x = 0; x < m_width; ++x) {
			for (int y = 0; y < m_height; ++y) {
				m_pixels[x][y].SetColor(m_backgroundColor);
			}
		}
	}
	
	protected void DrawImage() {
		m_image.loadPixels();
		int dim = m_width * m_height;
		for (int i = 0; i < dim; ++i) {
			m_image.pixels[i] = m_pixels[i % m_width][i / m_width].GetColor();
		}
		m_image.updatePixels();
		image(m_image, 0, 0);
	}
	
	protected void DrawToolbar() {
		fill(color(0, 0, 0));
		Tool selectedTool = GetToolset().GetSelectedTool();
		String selectedToolName = selectedTool.GetName();
		int selectedToolIndex = GetToolset().GetSelectedToolIndex() + 1;
		int totalToolCount = GetToolset().GetToolCount();
		
		text("Selected Tool : " + selectedToolName + " (" + selectedToolIndex + "/" + totalToolCount + ")", 10, 20);
	}
	
	public void Setup() {
		surface.setTitle(m_title);
		CreateImage();
	}

	public void SetTitle(String title) {
		m_title = title;
		surface.setTitle(m_title);
	}
	
	public void Draw() {
		DrawImage();
		ResetPixels();
		// DrawToolbar();
		GetToolset().GetSelectedTool().DrawControls();
		for (int i = 0; i < m_controllers.size(); ++i) {
			m_controllers.get(i).Draw();
		}
	}
	
	public void Update() {
		Draw();
	}
	
}
