package question;

public class Alphabet {
	private String str;

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	public String process() {
		StringBuffer sb = new StringBuffer();
		// int num = ((int) str.charAt(0) - 97);
		char c = 'a';
		char c2 = str.charAt(0);

//		for (int i = 0; i < num; i++) {
//			sb.append(i + 98);
//			
//		}
		do {
			sb.append(c);
			c = (char) (c + 1);
		} while (c <= c2);
		return sb.toString();
	}
}
