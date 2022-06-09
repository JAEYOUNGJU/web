package j;

public class ex_String2 {
    public static void main(String[] args) {
  		// TODO Auto-generated method stub
          StringBuilder sb = new StringBuilder();
          sb.append("Hello ");
          sb.append("Jello:)");//문자열 끝에 추가
          System.out.println(sb);
          
          sb.insert(5, "Hello");//5번째 위치에 추가
          System.out.println(sb);
          
          String s = sb.toString(); //String 자료형으로 변경하여 변수 s에 담기
          System.out.println(s);
      }
  
  }
  