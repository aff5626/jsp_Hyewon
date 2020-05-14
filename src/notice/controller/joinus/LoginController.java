package notice.controller.joinus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;

public class LoginController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("**LoginController통과**");
		
		request.getRequestDispatcher("loginForm.jsp").forward(request, response);
		// (/)login 쪽에 안넣으면 기존의 주소에 /를 안넣은 주소를 더해주겠다는 의미 
		
	}

}
