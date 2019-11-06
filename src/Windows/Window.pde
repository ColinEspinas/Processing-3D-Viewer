public class Window extends PApplet {

	protected int m_width, m_height;

	protected ControlP5 m_cp5;
	protected PApplet m_parent;
	public PSurface m_surface;
	public String m_title;
	
	private Window() {
		m_parent = null;
		m_width = 200;
		m_height = 200;
		m_title = "App";

		final String[] sketchArgs = {
			"--sketch-path=" + sketchPath(), 
			""
		};
		PApplet.runSketch(sketchArgs, this);

		m_surface = surface;
	}

	public Window(PApplet app, int w, int h) {
		super();
		
		m_parent = app;
		m_width = w;
		m_height = h;

		final String[] sketchArgs = {
			"--sketch-path=" + sketchPath(), 
			""
		};
		PApplet.runSketch(sketchArgs, this);

		m_surface = surface;
	}

	public Window(PApplet app, String title, int w, int h) {
		super();
		
		m_parent = app;
		m_width = w;
		m_height = h;
		m_title = title;

		final String[] sketchArgs = {
			"--sketch-path=" + sketchPath(), 
			""
		};
		PApplet.runSketch(sketchArgs, this);
		
		m_surface = surface;
	}

	public void setup() {
		m_cp5 = new ControlP5(this);
		m_surface.setTitle(m_title);
		m_surface.setSize(m_width, m_height);
	}

	int x = 0;
	int y = 0;

	void draw() {
		clear();
	}

	public ControlP5 GetControl() {
		return m_cp5;
	}

	public void SetTitle(String title) {
		m_title = title;
		m_surface.setTitle(m_title);
	}
}
