package question;

public class Capital {
	private String str;

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	public String process() {
		StringBuffer sb = new StringBuffer();
		char c = 'A';
		char c2 = str.charAt(0);

		for (char i = c2; i >= c; i--) {
			for (char j = c; j <= i; j++) {
				sb.append(j);
			}
			sb.append("<br>");
		}
		return sb.toString();
	}
}
