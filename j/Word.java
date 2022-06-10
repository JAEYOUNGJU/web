package j;

public class Word {

	public static void main(String[] args) {
		Word word = new Word("Hello");
		System.out.println(word.isVowel(0));
		System.out.println(word.isVowel(1));
		System.out.println(word.isVowel(2));
		System.out.println(word.isVowel(3));
		System.out.println(word.isVowel(4));
		System.out.print("\n");
		System.out.println(word.isConsonant(0));
		System.out.println(word.isConsonant(1));
		System.out.println(word.isConsonant(2));
		System.out.println(word.isConsonant(3));
		System.out.println(word.isConsonant(4));
		
	}
	
	private String letters;
	
	//String만 가지고 있는 것
	
	//생성자 자동 생성하기
	//마우스 우클릭 -> Source -> Generate Constructor using Field -> Generate 클릭
	public Word(String letters) {
		this.letters = letters.toLowerCase(); //객체 생성하기
		
	}
	//i번째 글자가 모음(a,e,i,o,u)인지 맞으면 true, 틀리면 false 
		
	public boolean isVowel(int i) {
		return "aeiou".contains(letters.substring(i, i+1));
	}
		
	// i번째 글자가 자음(a,e,i,o,u 제외한 나머지)인지 
	public boolean isConsonant(int i) {
		return !isVowel(i);
}
}