package shoppingMall;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//當進行『結帳』時，如果按下『放棄購物』超連結，瀏覽器會要求此程式
@WebServlet("/AbortRecipeServlet")
public class AbortRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AbortRecipeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        RecipeShoppingCart cart = (RecipeShoppingCart)session.getAttribute("RecipeShoppingCart");
		if (cart != null) {
			//由session物件中移除ShoppingCart物件
			session.removeAttribute("RecipeShoppingCart");
	}
		response.sendRedirect(response.encodeRedirectURL ("./RecipeSelectServlet2?page=1"));
		return;
	}

}
