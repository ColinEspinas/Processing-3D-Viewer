class Mesh extends Model {
	public String m_name;
	public ArrayList<PVector> m_vertices;
	public ArrayList<PVector> m_normals;
	public ArrayList<PVector> m_uv;
	public ArrayList<ArrayList<Integer>> m_triangles;
	public ArrayList<ArrayList<Integer>> m_indexNormals;
	public ArrayList<ArrayList<Integer>> m_indexTextures;
	public ArrayList<Integer> m_colors;
	public ArrayList<float[]> m_coefs;
	public boolean m_asTexture = false;
	public PImage m_textureImg;
	public PVector m_textureSize;
	public int m_index = -1;

	public Mesh() {
		m_vertices = new ArrayList<PVector>();
		m_normals = new ArrayList<PVector>();
		m_uv = new ArrayList<PVector>();
		m_triangles = new ArrayList<ArrayList<Integer>>();
		m_indexNormals = new ArrayList<ArrayList<Integer>>();
		m_indexTextures = new ArrayList<ArrayList<Integer>>();
		m_colors = new ArrayList<Integer>();
		m_coefs = new ArrayList<float[]>();
	}

	public void Init() {
		ArrayList<PVector> camVertices = new ArrayList<PVector>();
		float tx, ty, tz;
		float d = objloader.m_loadedScene.m_d;
		for (PVector vertex : m_vertices) {
			if (m_name.equals("diamant")) {
				tx = 150;
				ty = 150;
				tz = 2.2 * d;
			}
			else if (m_name.equals("cube")) {
				tx = 350;
				ty = 100;
				tz = 2 * d;
			}
			else {
				tx = 200;
				ty = 0;
				tz = 1.8 * d;
			}

			camVertices.add(new PVector(
				- vertex.y + tx,
				vertex.z + ty,
				vertex.x + tz
			));
		}

		ArrayList<PVector> ddProj = new ArrayList<PVector>();

		for (PVector vertex : camVertices) {
			float xp = vertex.x * (d / vertex.z);
			float yp = vertex.y * (d / vertex.z);

			xp = (objloader.m_loadedScene.m_size.x / 2) + xp;
			yp = (objloader.m_loadedScene.m_size.y / 2) - yp;

			ddProj.add(new PVector(xp, yp));
		}

		SetSegmentModels(objloader.m_loadedScene, ddProj);
	}

	public void SetSegmentModels(Scene scene, ArrayList<PVector> pos) {
		int index = 0;
		for (ArrayList<Integer> triangle : m_triangles) {
			scene.GetController().AddModel(
				new SegmentMP(
					new ControlPoint((int)pos.get(triangle.get(0)).x, (int)pos.get(triangle.get(0)).y),
					new ControlPoint((int)pos.get(triangle.get(1)).x, (int)pos.get(triangle.get(1)).y),
					m_colors.get(index)
				)
			);
			scene.GetController().AddModel(
				new SegmentMP(
					new ControlPoint((int)pos.get(triangle.get(1)).x, (int)pos.get(triangle.get(1)).y),
					new ControlPoint((int)pos.get(triangle.get(2)).x, (int)pos.get(triangle.get(2)).y),
					m_colors.get(index)
				)
			);
			scene.GetController().AddModel(
				new SegmentMP(
					new ControlPoint((int)pos.get(triangle.get(2)).x, (int)pos.get(triangle.get(2)).y),
					new ControlPoint((int)pos.get(triangle.get(0)).x, (int)pos.get(triangle.get(0)).y),
					m_colors.get(index)
				)
			);
			index++;
		}
	}

	public void SetTriangleModels(Scene scene, ArrayList<PVector> pos, ArrayList<PVector> pos3D) {
		int index = 0;
		for (ArrayList<Integer> triangle : m_triangles) {
			PVector n = (pos3D.get(triangle.get(1)).sub(pos3D.get(triangle.get(0)))).cross(pos3D.get(triangle.get(2)).sub(pos3D.get(triangle.get(0))));
			PVector c = new PVector(0, 0, 0);
			if (n.dot(c.sub(pos3D.get(triangle.get(0)))) <= 0) {
				scene.GetController().AddModel(
					new FilledTriangle(
						new ControlPoint((int)pos.get(triangle.get(0)).x, (int)pos.get(triangle.get(0)).y),
						new ControlPoint((int)pos.get(triangle.get(1)).x, (int)pos.get(triangle.get(1)).y),
						new ControlPoint((int)pos.get(triangle.get(2)).x, (int)pos.get(triangle.get(2)).y),
						m_colors.get(index)
					)
				);
			}
			index++;
		}
	}

	
}