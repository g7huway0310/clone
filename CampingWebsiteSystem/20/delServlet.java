

import java.io.IOException;
import java.sql.Connection;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class delServlet
 */
@WebServlet("/delServlet")
public class delServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	
		String del = request.getParameter("delete");
		
		DataSource ds = null;
		InitialContext ctxt = null;
		Connection conn = null;
        
		try {
			// 建立Context Object,連到JNDI Server
			ctxt = new InitialContext();
          
			// 使用JNDI API找到DataSource
			ds = (DataSource) ctxt.lookup("java:comp/env/jdbc/xe");
			conn = ds.getConnection();
			CampingDAO DAO = new CampingDAO(conn);
			
			DAO.deleteCamping(del);

			

			request.getRequestDispatcher("Campinginsert.jsp").forward(request, response);

		} catch (Exception e) {
			// TODO: handle exception
		}

	}
}
