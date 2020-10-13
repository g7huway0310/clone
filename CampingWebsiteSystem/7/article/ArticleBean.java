package article;

import java.io.Serializable;

public class ArticleBean implements Serializable
{
	private static final long serialVersionUID = 1L;
	private String title;
	private String text;
	private String articleid;
	private String memberid;


public ArticleBean() {
	
}




public ArticleBean(String title, String text, String memberid, String articleid) {
	super();
	this.title = title;
	this.text = text;
	this.memberid = memberid;
	this.articleid = articleid;
}




public String getTitle() {
	return title;
}


public void setTitle(String title) {
	this.title = title;
}


public String getText() {
	return text;
}


public void setText(String text) {
	this.text = text;
}


public String getArticleid() {
	return articleid;
}


public void setArticleid(String articleid) {
	this.articleid = articleid;
}


public String getMemberid() {
	return memberid;
}


public void setMemberid(String memberid) {
	this.memberid = memberid;
}


public static long getSerialversionuid() {
	return serialVersionUID;
}





}
