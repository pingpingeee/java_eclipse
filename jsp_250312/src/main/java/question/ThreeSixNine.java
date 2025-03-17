package question;

public class ThreeSixNine {
	int num;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String process(int num) {
		int num1 = num / 10;
		int num2 = num % 10;
		if(num < 10 || num > 99) return "잘못된 값";		
		
		if (num1 % 3 == 0 && num2 % 3 == 0)
			return "박수짝짝";
		else if (num1 % 3 == 0 || num2 % 3 == 0)
			return "박수짝";
		else
			return "박수 없음";
	}
}
