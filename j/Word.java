package javaExam;

public class Word {

	public static void main(String[] args) {
		Word word = new Word("Hello");
		System.out.println(word.isVowel(0));
		System.out.println(word.isVowel(1));

	}
	
	private String letters;
	
	//String만 가지고 있는것임
	
	//마우스 우클릭 -> 
	public Word(String letters) {
		this.letters = letters.toLowerCase(); //객체 생성하기
		
	}
	//i번째 글자가 모음인지 맞으면 true, 틀리면 false 
	//a,e,i,o,u가 영어에서 모음임
	
	public boolean isVowel(int i) {
		return letters.substring(i, i+1).equals("a") 
				|| letters.substring(i, i+1).equals("e")
				|| letters.substring(i, i+1).equals("i") 
				|| letters.substring(i, i+1).equals("o") 
				|| letters.substring(i, i+1).equals("u");	
		}
	public boolean isVowel2(int i) {
		String vowel = "aeiou";
		return ((String) letters.subSequence(i, i+1)).contains(vowel);
			
	}
//i번째 글자가 자음인지 //a,e,i,o,u 아닌 나머지 if문 사용
public boolean isConsonant(int i) {
    //변수선언
    String vowel = "aeiou";
    boolean conso = true;
    if (vowel.contains(letters.substring(i, i+1))) {
        conso = false;
    }
    return conso;
}
}
