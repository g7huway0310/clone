package article;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;




public class ArticleDao {
	private Connection conn;
	

public ArticleDao(Connection conn) {
	this.conn = conn;
}	
	
	
public boolean insertArticle(ArticleBean articleData) {
	try {
		String sqlString = "insert into Article values ('"
				+articleData.getTitle()+"','"	
				+articleData.getText()+"','"
				+articleData.getMemberid()+"','"
				+articleData.getArticleid()+"')";
	
		  Statement stmt = conn.createStatement();
	      System.out.println(sqlString);
		    int updatecount = stmt.executeUpdate(sqlString);
	      stmt.close();
	      if (updatecount >= 1) return true;
	      else                  return false;
		  } catch (Exception e) {
		    System.err.println("新增文章失敗:" + e);
			  return false;
	    }
	  }

public boolean updateArticle(ArticleBean articleData) {	
	
	PreparedStatement psmt = null;
	
	
	try {
		String sqlString = "update article set title=?,text=?,memberid=? where articleid=?";
	
		  psmt=conn.prepareStatement(sqlString);
		  
		  System.out.println(articleData.getTitle()+"t"+articleData.getMemberid()+"t"+
		  articleData.getText()+"t"+articleData.getArticleid());
		  
		  psmt.setString(1, articleData.getTitle());
		  psmt.setString(2, articleData.getText());
		  psmt.setString(3, articleData.getMemberid());
		  psmt.setString(4, articleData.getArticleid());

		  System.out.println(articleData.getArticleid());
	      System.out.println(sqlString);
	      
		  int executeUpdate = psmt.executeUpdate();
		  
		  System.out.println("sueu");
		    
	      System.out.println(executeUpdate);

	      
	      if (executeUpdate >= 1) return true;
	      
	      else  return false;
		  } 
	      catch (Exception e) {
		    System.err.println("修改文章失敗:" + e);
			  return false;
	    }finally {
	    	try {
				psmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
}

public boolean deleteArticle(String articleid) {
	try {
		String sqlString = "delete from Article where articleid='"+articleid+"'";
	
		  Statement stmt = conn.createStatement();
	      System.out.println(sqlString);
		    int updatecount = stmt.executeUpdate(sqlString);
	      stmt.close();
	      if (updatecount >= 1) return true;
	      else                  return false;
		  } catch (Exception e) {
		    System.err.println("刪除文章失敗:" + e);
			  return false;
	    }
}

public List<ArticleBean> getAllArticle(){
	List<ArticleBean> list = new ArrayList<ArticleBean>();
	try {
		String sqlString ="select * from Article";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sqlString);
		while(rs.next()) {
			ArticleBean articleBean= new ArticleBean(); 
			articleBean.setMemberid(rs.getString("memberid"));
			articleBean.setText(rs.getString("text"));
			articleBean.setTitle(rs.getString("title"));
			list.add(articleBean);
		}
		System.out.println(list.size());
	}catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return list;
	
}



public List<ArticleBean> getArticleSearch(String keyword) {
	List<ArticleBean> atlsrh = new ArrayList<ArticleBean>();	
	try {
		String sqlString ="select * from Article where title like+'%"+keyword+"%'"+"order by articleid";		
		PreparedStatement prepareStatement = conn.prepareStatement(sqlString);
//		prepareStatement.setString(1, );
		ResultSet rs = prepareStatement.executeQuery();
		System.out.println(sqlString);
		
		while(rs.next()) {
			ArticleBean articleBean= new ArticleBean(); 
			articleBean.setMemberid(rs.getString("memberid"));
			articleBean.setText(rs.getString("text"));
			articleBean.setTitle(rs.getString("title"));
			atlsrh.add(articleBean);
		}
		System.out.println(atlsrh.size());
	}catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return atlsrh;
	
}





}