package j;

public class ex_String {
    
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// String 복사하기
		String greeting = "Hello World";
		String greeting2 = greeting;
		greeting2.toUpperCase();
		// 출력하면 "Hello World" 그대로 나올것임 -> String은 불변객체임
		System.out.println(greeting);
		System.out.println(greeting2);
		
		// String에서 F3 키 누르면 코드가 보임

		// *컴퓨터가 소수점 체계가 없기때문에 double의 연산결과는 정확하지 않음

	}

}

