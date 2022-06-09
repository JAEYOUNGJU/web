package j;

import java.util.Scanner;

public class Algo1 {
    // main하고 enter 하면 자동됨
    public static void main(String[] args) {
        //sout 하면 자동완성
        System.out.println(resolve());
        
    }

    public static String resolve() {
    	Scanner scanner = new Scanner(System.in);
    	int text = scanner.nextInt();
    	String[] text2 = new String[text];
    	
    	for (int i = 0; i < text; i++) {
    		 text2[i] = scanner.next();
    	}
    	return "";
    
        
    }
}