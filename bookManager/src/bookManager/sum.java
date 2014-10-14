package bookManager;
//import com.opensymphony.xwork2.ActionSupport;

public class sum {
	private String name;
	public String execute() throws Exception{
		return "Add";
	}
	public String getAuthorName()
    {
		return name;
    }
	public void setAuthorName(String AuthorName)
    {
        System.out.println(AuthorName);
          this.name = AuthorName;
    }
}
