public class Edge {

	protected int m_yTop = 0;
	protected int m_x = 0;
	protected int m_num = 0;
	protected int m_den = 0;
	protected int m_inc = 0;

	public Edge(int yTop, int x, int num, int den, int inc) {
		m_yTop = yTop;
		m_x = x;
		m_num = num;
		m_den = den;
		m_inc = inc;
	}

	public void Update() {
		m_inc += m_num;
		float q = m_inc / m_den;
		m_x += q;
		m_inc -= q * m_den;
	}

	public int GetX() {
		return m_x;
	}
}
