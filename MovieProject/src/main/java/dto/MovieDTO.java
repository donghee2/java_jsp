package dto;

public class MovieDTO {
	private int bno;
	private String title;
	private String openDate;
	private int count;
	private String director;
	public MovieDTO(int bno, String title, String openDate, int count, String director) {
		super();
		this.bno = bno;
		this.title = title;
		this.openDate = openDate;
		this.count = count;
		this.director = director;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	
	@Override
	public String toString() {
		return "movieDTO [bno=" + bno + ", title=" + title + ", openDate=" + openDate + ", count=" + count
				+ ", director=" + director + "]";
	}
	
	
}
