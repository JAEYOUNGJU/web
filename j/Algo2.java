package j;

import java.util.ArrayList;
import java.util.Scanner;

public class Algo2 {
	//Algorithm 2

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// ArrayList<String> result = new ArrayList<String>(); //String 객체만 add되어질 수 있음 
		
		Scanner scanner = new Scanner(System.in);//Scanner 객체 생성, 사용자로부터 입력받기
		System.out.println("공사장의 좌표와 소음 크기를 입력하세요.");
		int a = scanner.nextInt(); //공사장 x좌표
		int b = scanner.nextInt(); //공사장 y좌표
		int R = scanner.nextInt(); //반지름

		System.out.println("나무그늘의 수를 입력하세요.");
		int N = scanner.nextInt();

		for (int i = 0; i < N; i++) {

			int x = scanner.nextInt(); //나무그늘의 x 좌표 입력
			int y = scanner.nextInt(); //나무그늘의 y 좌표 입력

			if (Math.pow((x - a), 2) + Math.pow((y - b), 2) >= Math.pow(R, 2)) {
				System.out.println("silent");
			} else {
				System.out.println("noisy");
			}
		}
		scanner.close();
	}

}

