class ZBuffer {
	public ArrayList<ArrayList<Double>> buffer;

	public ZBuffer() {
		buffer = new ArrayList<ArrayList<Double>>();

		for (ArrayList<Double> col : buffer) {
			for(Double value : col) {
				value = Double.MAX_VALUE;
			}
		}
	}

	public Double Get(int x, int y) {
		return buffer.get(x).get(y);
	}

	public void Set(int x, int y, Double value) {
		buffer.get(x).set(y, value);
	}
}
