class ObjectFileLoader {

	public Scene m_loadedScene;
	public Mesh m_loadingMesh;
	String[] m_lines;
	PApplet m_app;

	private ObjectFileLoader(PApplet app) {
		m_app = app;
	}

	public Scene LoadScene(String file, int width, int height, Controller c) {
		m_loadedScene = new Scene(loadStrings(file), width, height);
		m_loadedScene.SetController(c);
		return m_loadedScene;
	}

	public Scene LoadScene(String name, String file, int width, int height, Controller c) {
		m_loadedScene = new Scene(name, loadStrings(file), width, height);
		m_loadedScene.SetController(c);
		return m_loadedScene;
	}

	public void LoadTexture(Mesh mesh, String file) {
		if (file.length() > 0) {
			mesh.m_asTexture = true;
			mesh.m_textureImg = loadImage(file);
			mesh.m_textureSize = new PVector(mesh.m_textureImg.width, mesh.m_textureImg.height);
		}
	}

	public void LoadObject(String file, String name) {
		if (m_loadedScene != null) {
			Mesh mesh = new Mesh();
			mesh.m_name = name;
			m_loadingMesh = mesh;
			m_lines = loadStrings(file);
			boolean asTexture = false;
			Integer currentColor = new Integer(0);
			float[] currentCoefs = new float[4];
			if (Integer.parseInt(m_lines[0]) == 1) {
				selectInput("Select a file to open:", "textureFileSelected");
			}
			for (String line : m_lines) {
				// println("line: " + line);

				if (line.length() > 1 && line.charAt(0) == 'v' && line.charAt(1) == ' ') {
					String[] data = line.trim().split("\\s+");
					PVector vertex = new PVector();
					vertex.x = Float.parseFloat(data[1]);
					vertex.y = Float.parseFloat(data[2]);
					vertex.z = Float.parseFloat(data[3]);

					mesh.m_vertices.add(vertex);
				}
				if (line.length() > 1 && line.charAt(0) == 'v' && line.charAt(1) == 'n') {
					String[] data = line.trim().split("\\s+");
					PVector normal = new PVector();
					normal.x = Float.parseFloat(data[1]);
					normal.y = Float.parseFloat(data[2]);
					normal.z = Float.parseFloat(data[3]);

					mesh.m_normals.add(normal);
				}
				if (line.length() > 1 && line.charAt(0) == 'v' && line.charAt(1) == 't') {
					String[] data = line.trim().split("\\s+");
					asTexture = true;
					PVector texture = new PVector();
					texture.x = Float.parseFloat(data[1]);
					texture.y = Float.parseFloat(data[2]);

					mesh.m_uv.add(texture);
				}
				if (line.length() > 1 && line.charAt(0) == 'c' && line.charAt(1) == ' ') {
					String[] data = line.trim().split("\\s+|/");
					int r, g, b;
					r = Integer.parseInt(data[1]);
					g = Integer.parseInt(data[2]);
					b = Integer.parseInt(data[3]);

					currentColor = color(r, g, b );
				}
				if (line.length() > 1 && line.charAt(0) == 'k' && line.charAt(1) == ' ') {
					String[] data = line.trim().split("\\s+|/");
					float ka, krd, krs, ns;
					ka = Float.parseFloat(data[1]);
					krd = Float.parseFloat(data[2]);
					krs = Float.parseFloat(data[3]);
					ns = (float)Integer.parseInt(data[4]);

					currentCoefs = new float[]{ ka, krd, krs, ns };
				}
				if (line.length() > 1 && line.charAt(0) == 'f' && line.charAt(1) == ' ') {
					
					String[] data = line.trim().split("\\s+");

					ArrayList<Integer> indexTriangle = new ArrayList<Integer>();
					ArrayList<Integer> indexNormals = new ArrayList<Integer>();
					ArrayList<Integer> indexTextures = new ArrayList<Integer>();

					for(String s : data)
						if (!s.contains("f")) {
							String[] vertexdata = s.split("/");
							indexTriangle.add(Integer.parseInt(vertexdata[0]) - 1);

							if (asTexture) {
								indexTextures.add(Integer.parseInt(vertexdata[1]));
							}
							else {
								mesh.m_asTexture = false;
							}
							indexNormals.add(Integer.parseInt(vertexdata[2]));
						}

					mesh.m_triangles.add(indexTriangle);
					mesh.m_indexNormals.add(indexNormals);
					mesh.m_indexTextures.add(indexTextures);
					mesh.m_colors.add(currentColor);
					mesh.m_coefs.add(currentCoefs);
				}
			}
			m_loadedScene.AddMesh(mesh);
			mesh.Init();
		}
		else {
			println("No scene loaded");
		}
	}

}