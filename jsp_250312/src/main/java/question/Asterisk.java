package question;

public class Asterisk {
	private int num;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

//	public String process(int num) {
//		return "*";
//	}

	public String process() {
		StringBuffer sb = new StringBuffer();
		for (int i = num; i > 0; i--) {
			for (int j = 0; j < i; j++) {
				sb.append('*');
			}
			sb.append("<br>");
//			System.out.println(sb.toString());
		}
		return sb.toString();
	}
}
