package test.todo.dto;

public class TodoDto {
	private int num;
	private String content;
	private String regdate;
	//페이징 처리에 필요한 필드
	private int startRowNum;
	private int endRowNum;
	
	//디폴트 생성자
	public TodoDto() {}

	public TodoDto(int num, String content, String regdate, int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.content = content;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	
	
}
