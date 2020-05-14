package notice.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;

public class TestController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("=-==-==-==-=");
		/*
		 * response.sendRedirect("/WEB-INF/testview/test.jsp");//화면전환 확인
		 */

		request.getRequestDispatcher("/WEB-INF/testview/test.jsp").forward(request, response);
		
	}

}
