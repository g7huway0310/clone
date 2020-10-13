import java.awt.color.ICC_Profile;
import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import shoppingMall.RecipeBean;

public class RecipeDAO implements Serializable {
	
	private Connection conn;
	
	private String a;
	
	public RecipeDAO(Connection conn) {
		this.conn = conn;
	}
	
	public List<RecipeBean> selectAll(String a){
		List<RecipeBean> list = new ArrayList<>();
		String sql = "select* from Recipe where RE_ID = '"+ a +"'";
		System.out.println(sql);
		try(PreparedStatement statement = conn.prepareStatement(sql);
	        ResultSet rs = statement.executeQuery();) 
		{
			while (rs.next()) {
                String reid = rs.getString("RE_ID");
                String rename = rs.getString("RE_Name");
                String brief = rs.getString("BRIEF");
                String image = rs.getString("IMAGE");
                String ingredient = rs.getString("INGREDIENTS");
                String tip1 = rs.getString("TIP1");
                String tip2 = rs.getString("TIP2");
                String tip3 = rs.getString("TIP3");
                String tip4 = rs.getString("TIP4");
                String tip5 = rs.getString("TIP5");
                String tip6 = rs.getString("TIP6");
                String note = rs.getString("NOTE");
                int people = rs.getInt("PEOPLE");
                int time = rs.getInt("TIME1");
                list.add(new RecipeBean(reid,rename,brief,image,ingredient,tip1,tip2,tip3,tip4,tip5,tip6,note,people,time)); 
            }
			System.out.println(sql);
		}catch (SQLException e) {
            e.printStackTrace();
        }
		return list;
	}
	
	public List<RecipeBean> listAllOf(int StartIndex, int offset){
		List<RecipeBean> list = new ArrayList<>();
		String sql = "select* from(select ROWNUM as rn,RE_ID,RE_NAME,BRIEF,IMAGE,INGREDIENTS,TIP1,TIP2,TIP3,TIP4,TIP5,TIP6,NOTE,PEOPLE,TIME1,Price,Discount,stock from Recipe) WHERE rn >= ? AND rn <= ? ORDER BY RE_ID";
		
		try(PreparedStatement pstmt=conn.prepareStatement(sql);){
			pstmt.setInt(1, StartIndex);
			pstmt.setInt(2, offset);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(sql);
			while (rs.next()) {
                String reid = rs.getString("RE_ID");
                String rename = rs.getString("RE_Name");
                String brief = rs.getString("BRIEF");
                String image = rs.getString("IMAGE");
                String ingredient = rs.getString("INGREDIENTS");
                double price = rs.getDouble("price");
                double discount = rs.getDouble("Discount");
                int people = rs.getInt("PEOPLE");
                int time = rs.getInt("TIME1");
                Integer stock = rs.getInt("stock");
                list.add(new RecipeBean(reid,rename,brief,image,ingredient,people,time,price,discount)); 
            }
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list;
	}
	
	public int counts() {
		int recordCount = 0;
		try (PreparedStatement statement = conn.prepareStatement("SELECT count(*) FROM recipe")) {
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				recordCount = rs.getInt(1);
			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return recordCount;
	}
	
	public int getRecordCounts(String a) {
		this.a = a;
		int count = 0;
		String sql = "SELECT count(1) FROM recipe WHERE RE_NAME LIKE '%"+a+"%'";
		try ( PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new RuntimeException("發生例外: " + ex.getMessage());
		}
		return count;
	}
	
    public List<RecipeBean> selectByName(String a,int StartIndex, int offset) {   
    	String sql = "select * from (select ROWNUM as rn,RE_ID,RE_NAME,BRIEF,IMAGE,INGREDIENTS,TIP1,TIP2,TIP3,TIP4,TIP5,TIP6,NOTE,PEOPLE,TIME1,Price,Discount,stock from Recipe WHERE RE_NAME like '%"+a+ "%') WHERE rn >= ? AND rn <=?";
    	List<RecipeBean> list = new ArrayList<RecipeBean>();
        try(PreparedStatement pstmt = conn.prepareStatement(sql);
            ) { 
        	pstmt.setInt(1, StartIndex);
			pstmt.setInt(2, offset);
			ResultSet rs = pstmt.executeQuery();
            System.out.println(sql);
            while (rs.next()) {        	
            	String reid = rs.getString("RE_ID");
                String rename = rs.getString("RE_Name");
                String brief = rs.getString("BRIEF");
                String image = rs.getString("IMAGE");
                String ingredient = rs.getString("INGREDIENTS");
                double price = rs.getDouble("price");
                double discount = rs.getDouble("Discount");
                int people = rs.getInt("PEOPLE");
                int time = rs.getInt("TIME1");
                
                list.add(new RecipeBean(reid,rename,brief,image,ingredient,people,time,price,discount));          	
            	
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return list;
        
    }
	
	public boolean DeleteRecipe(RecipeBean recipeBean) {
		try {
		String sqlString = "Delete from Recipe Where re_id='"+recipeBean.getReid()+"'";
		System.out.println(sqlString);
		Statement stmt = conn.createStatement();
		int updatecount = stmt.executeUpdate(sqlString);
	    stmt.close();
	    if (updatecount >= 1) return true;
	    else                  return false;
		} catch (SQLException e) {
			System.err.println("食譜刪除未成功!" + e);
			e.printStackTrace();
			return false;			
		}	
	    
	}
	
	
	public boolean updateRecipe(RecipeBean recipeData) {
		try{
			String sqlString = "update Recipe set re_name='"+recipeData.getRename()+
					           "', brief='"+recipeData.getBrief()+
					           "', image='"+recipeData.getImage()+
					           "',INGREDIENTS='"+recipeData.getIngredient()+
					           "',Tip1='"+recipeData.getTip1()+
					           "',Tip2='"+recipeData.getTip2()+
					           "',Tip3='"+recipeData.getTip3()+
					           "',Tip4='"+recipeData.getTip4()+
					           "',Tip5='"+recipeData.getTip5()+
					           "',Tip6='"+recipeData.getTip6()+
					           "',NOTE='"+recipeData.getNote()+
					           "',people= "+recipeData.getPeople()+
					           ",Time1= "+recipeData.getTime()+
					           " Where re_id='"+recipeData.getReid()+"'";
			System.out.println(sqlString);
			Statement stmt = conn.createStatement();
		    int updatecount = stmt.executeUpdate(sqlString);
		    stmt.close();
		    if (updatecount >= 1) return true;
		      else                return false;
		}catch (Exception e) {
		    System.err.println("食譜更新未成功" + e);
			  return false;
	}		           
		}
		
	
	
	public boolean insertRecipe(RecipeBean recipeData) {
		try {
			String sqlString = "insert into Recipe values('"
					            +recipeData.getReid()+"','"
					            +recipeData.getRename()+"','"
					            +recipeData.getBrief()+"','"
					            +recipeData.getImage()+"','"
					            +recipeData.getIngredient()+"','"
					            +recipeData.getTip1()+"','"
					            +recipeData.getTip2()+"','"
					            +recipeData.getTip3()+"','"
					            +recipeData.getTip4()+"','"
					            +recipeData.getTip5()+"','"
					            +recipeData.getTip6()+"','"
					            +recipeData.getNote()+"','"
					            +recipeData.getPeople()+"','"
					            +recipeData.getTime()+"','"
					            +recipeData.getPrice()+"','"
					            +recipeData.getDiscount()+"','"
					            +recipeData.getStock()+"')";
			
			Statement stmt = conn.createStatement();
		    System.out.println(sqlString);
		    int updatecount = stmt.executeUpdate(sqlString);
		    stmt.close();
		      if (updatecount >= 1) return true;
		      else                  return false;
		    }catch (Exception e) {
			    System.err.println("食譜新增未成功" + e);
				  return false;
		}
	}

}
