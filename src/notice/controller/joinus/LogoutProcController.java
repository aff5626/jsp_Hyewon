package notice.controller.joinus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;

public class LogoutProcController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("logoutProc통과");
		//logout=session제거
		request.getSession().invalidate();
		response.sendRedirect("../customer/notice.do");
		//login쪽에서 완전히 나가야 함으로 폴더를 나갔다가 들어올 수 있게 주소 변경해주기
		//주소 보고 판단해주기!
		
	}

}
