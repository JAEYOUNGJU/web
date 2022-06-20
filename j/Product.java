package j;

import java.util.Objects;

//1.무지성 private 멤버 변수
//2. 필요하면 생성자 추가
//3. 무지성getter, setter 읽기 전용, 쓰기 전용
//4. 무지성toString()
//5. 필요하면 euqals, hashcode 재정의(오버라이드)
public class Product {
	public static void main(String[] args) {
			Product product = new Product("22", "22", 11); //생성자 만들자
//			Product product2 = new Product();
//			System.out.println(product);
//			product.setId("111");
			Product product2 = new Product("22", "22", 11); //생성자 만들자
//			System.out.println(product2.hashCode());
			
			Object object = new Product("22", "22", 11); //오브젝트로 생성자 만들기
			
			System.out.println(product == product2); //==은 주소비교, 둘이 다른것!
			System.out.println(product.hashCode() == product2.hashCode()); //equals 재정의되며 밑에 hashCode 재정의됨
			System.out.println(product.equals(product2));//객체비교는 equals 사용
			
			
//			System.out.println("name".equals("name")); //이럴때 객체기 때문에 equals 사용한다
			
//			System.out.println(new String("name") == new String("name"));

	}
	private String id;
	private String name;
	private  int unitPrice;
	private String descriprtion;
	private String manufacturer;
	private String catagory;
	private long unitInStock;
	private String condition;
	
//	public Product() {} //오버로드: 똑같은 이름의 생성자를 만드는것
	
	public Product(String id, String name, int unitPrice) {
		this.id = id;
		this.name = name;
		this.unitPrice = unitPrice;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescriprtion() {
		return descriprtion;
	}

	public void setDescriprtion(String descriprtion) {
		this.descriprtion = descriprtion;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCatagory() {
		return catagory;
	}

	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}

	public long getUnitInStock() {
		return unitInStock;
	}

	public void setUnitInStock(long unitInStock) {
		this.unitInStock = unitInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	
	
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", unitPrice=" + unitPrice + ", descriprtion=" + descriprtion
				+ ", manufacturer=" + manufacturer + ", catagory=" + catagory + ", unitInStock=" + unitInStock
				+ ", condition=" + condition + "]";
	}
	
	
	
	
}
