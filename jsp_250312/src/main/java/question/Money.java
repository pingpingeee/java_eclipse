package question;

public class Money {
	int money;

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String process() {
		StringBuffer sb = new StringBuffer();
		int[] moneyArr = { 50000, 10000, 1000, 100, 10, 1 };

		for (int i = 0; i < moneyArr.length; i++) {
			int result = money / moneyArr[i];
			if (result > 0) {
				sb.append(moneyArr[i] + "원 짜리 : " + result + "개 <br>");
				money = money % moneyArr[i];
			}
		}
		return sb.toString();
//		return "50000원 짜리 : " + money50000 + "개<br>" 
//		+ "10000원 짜리 : " + money10000 + "개<br>" 
//		+ "1000원 짜리 : " + money1000 + "개<br>" 
//		+ "100원 짜리 : " + money100 + "개<br>" 
//		+ "10원 짜리 : " + money10 + "개<br>" 
//		+ "1원 짜리 : " + money1 + "개<br>";
	}
}
