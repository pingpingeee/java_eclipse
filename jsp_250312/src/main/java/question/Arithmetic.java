package question;

public class Arithmetic {
	int num1;
	int num2;
	String cal;

	public String process(int num1, int num2, String cal) {
		if (cal.equals("+"))
			return num1 + "와 " + num2 + "의 계산결과는 " + (num1 + num2);
		else if (cal.equals("-"))
			return num1 + "와 " + num2 + "의 계산결과는 " + (num1 - num2);
		else if (cal.equals("*"))
			return num1 + "와 " + num2 + "의 계산결과는 " + (num1 * num2);
		else if (cal.equals("/"))
			return num1 + "와 " + num2 + "의 계산결과는 " + (num1 / num2);
		else
			return "잘못된 값";

	}

	public String getCal() {
		return cal;
	}

	public void setCal(String cal) {
		this.cal = cal;
	}

	public int getNum1() {
		return num1;
	}

	public void setNum1(int num1) {
		this.num1 = num1;
	}

	public int getNum2() {
		return num2;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}
}
