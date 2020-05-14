package notice.controller.joinus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.MemberDao;
import notice.vo.Member;

public class LoginProcController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// login폼에서 보내준거 name,pass 받기
		System.out.println("**LoginPocController통과**");
		String uid = request.getParameter("id");
		String pwd = request.getParameter("password");
		
		MemberDao dao = new MemberDao();
		//vo.member class만들기(set and getter사용)
		//uid보내기
		Member m =dao.getMember(uid);
		
		if(m==null) {
			request.setAttribute("error", "아이디 오류");
			request.getRequestDispatcher("loginForm.jsp").forward(request, response);//아이디가 틀리면 
		}else if(!m.getPwd().equals(pwd)) {//앞 : 입력받은 값 뒤 : 데이터베이스 안의 값
			request.setAttribute("error", "비밀번호 오류");
			request.getRequestDispatcher("loginForm.jsp").forward(request, response);//아이디가 틀리면 
		}else {
			//로그인 성공시
			request.getSession().setAttribute("uid", uid);
			response.sendRedirect("../customer/notice.do");
		}
		
		
		
		
		request.getRequestDispatcher("loginForm.jsp").forward(request, response);
		// (/)login 쪽에 안넣으면 기존의 주소에 /를 안넣은 주소를 더해주겠다는 의미 
		
	}

}
