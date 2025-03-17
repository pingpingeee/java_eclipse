package question;

public class DivAndRemains {
	int num;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Boolean process(int num) {
		Boolean result = false;
		int num1 = num/10;
		int num2 = num%10;
		if(num1 == num2) result = true;

		return result;
	}
}
