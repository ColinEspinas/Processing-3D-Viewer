class Scene {

	public String m_name;

	public float m_Ia = 0;
	public float m_d = 0;
	public PVector m_size;

	private ArrayList<float[]> m_lights;
	private ArrayList<Mesh> m_meshes;

	private Controller m_controller;

	public Scene(String[] fileContent, int width, int height) {

		m_size = new PVector(width, height);

		m_lights = new ArrayList<float[]>();
		m_meshes = new ArrayList<Mesh>();

		for (String line : fileContent) {
			if (line.length() > 1 && line.charAt(0) == 'a' && line.charAt(1) == ' ') {
				String[] data = line.trim().split("\\s+");
				m_Ia = Float.parseFloat(data[1]);
			}
			if (line.length() > 1 && line.charAt(0) == 'd' && line.charAt(1) == ' ') {
				String[] data = line.trim().split("\\s+");
				m_d = Float.parseFloat(data[1]);
			}
			if (line.length() > 1 && line.charAt(0) == 'l' && line.charAt(1) == ' ') {
				String[] data = line.trim().split("\\s+");
				float[] light = new float[4];

				light[0] = Float.parseFloat(data[1]);
				light[1] = Float.parseFloat(data[2]);
				light[2] = Float.parseFloat(data[3]);
				light[3] = Float.parseFloat(data[4]);

				m_lights.add(light);
			}
		}
	}

	public Scene(String name, String[] fileContent, int width, int height) {

		m_name = name;

		m_size = new PVector(width, height);

		m_lights = new ArrayList<float[]>();
		m_meshes = new ArrayList<Mesh>();

		for (String line : fileContent) {
			if (line.length() > 1 && line.charAt(0) == 'a' && line.charAt(1) == ' ') {
				String[] data = line.trim().split("\\s+");
				m_Ia = Float.parseFloat(data[1]);
			}
			if (line.length() > 1 && line.charAt(0) == 'd' && line.charAt(1) == ' ') {
				String[] data = line.trim().split("\\s+");
				m_d = Float.parseFloat(data[1]);
			}
			if (line.length() > 1 && line.charAt(0) == 'l' && line.charAt(1) == ' ') {
				String[] data = line.trim().split("\\s+");
				float[] light = new float[4];

				light[0] = Float.parseFloat(data[1]);
				light[1] = Float.parseFloat(data[2]);
				light[2] = Float.parseFloat(data[3]);
				light[3] = Float.parseFloat(data[4]);

				m_lights.add(light);
			}
		}
	}

	public void AddMesh(Mesh m) {
		m_meshes.add(m);
	}

	public Controller GetController() { return m_controller; }
	public void SetController(Controller c) { m_controller = c; }
}