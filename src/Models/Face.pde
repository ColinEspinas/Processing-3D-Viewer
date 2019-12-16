class Face {
	public ArrayList<PVector> m_vertices;
	public int[] m_planCoefs;
	public ArrayList<PVector> m_normals;
	public boolean m_asTexture = false;
	public ArrayList<PVector> m_uv;
	public color m_color;
	public ArrayList<float[]> m_coefs;
	public int m_index = -1;

	public Face() {
		m_vertices = new ArrayList<PVector>();
		m_planCoefs = new int[4];
		m_normals = new ArrayList<PVector>();
		m_uv = new ArrayList<PVector>();
		m_color = color(0);
		m_coefs = new ArrayList<float[]>();
	}
}
