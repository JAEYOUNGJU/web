package j;

public class ex_String1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StringBuffer sb =  new StringBuffer(); //StringBuffer 객체 생성
		//append 사용하여 현재 문자열 끝에 문자열 추가
		sb.append("Hello");
		sb.append(" ");
		sb.append("I'm Jaeyoung!");
		//문자열로 출력
		System.out.println(sb.toString());
	}

}