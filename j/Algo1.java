package j;

import java.util.Scanner;

//문자열 결합: 입력받은 문자열 수와 문자열을 입력받고 출력 포멧에 맞게 출력하기
public class Algo1 {
    // main하고 enter 하면 자동됨
    public static void main(String[] args) {
        //sout 하면 자동완성
       resolve();
        
    }
    
    public static void resolve() {
    	Scanner scanner = new Scanner(System.in);
    	int num = scanner.nextInt();
        //nextLine으로 받으려고 한다면 사용하지 말것 enter을 먹기때문에
    	String[] arr = new String[num];
    	
    	for (int i = 0; i < num; i++) {
    		arr[i] = scanner.next();
    	}
    	System.err.print("Hello ");
    	for (int i=0; i < (num-1); i++) {
    		System.out.print(arr[i]+",");
    	}
    	System.out.print(arr[(num-1)]+".");


    }
}
