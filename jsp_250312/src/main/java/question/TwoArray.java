package question;

import java.util.Random;

public class TwoArray {
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
		int[][] numArr = new int[num][num];

		for (int i = 0; i < numArr.length; i++) {
			for (int j = 0; j < numArr[i].length; j++) {
				numArr[i][j] = rand.nextInt(10) + 1;
				sb.append(numArr[i][j] + " ");
			}
			sb.append("<br>");
		}
		return sb.toString();
	}
}
