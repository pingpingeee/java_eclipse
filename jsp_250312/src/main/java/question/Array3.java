package question;

import java.util.Random;

public class Array3 {
	private int num;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String process() {
		Random rand = new Random();
		StringBuffer sb = new StringBuffer();
		int count = 0;
		
		for (int i = 0; i < num; i++) {
			sb.append((rand.nextInt(100) + 1) + " ");
			count ++;
			if(count % 10 == 0) sb.append("<br>");
		}
		return sb.toString();
	}
}
