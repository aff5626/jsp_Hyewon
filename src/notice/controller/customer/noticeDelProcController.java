package notice.controller.customer;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class noticeDelProcController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("noticeDelProcController 신호신호");

		String seq=request.getParameter("c");

		Notice n=new Notice();
		NoticeDao dao=new NoticeDao();

		int af=dao.delete(seq);
		PrintWriter out=response.getWriter();
		//어디로가라
		if(af>0){//삭제성공
			response.sendRedirect("/WEB-INF/view/customer/notice.jsp");
		}else{
			out.write("삭제오류");
		}
	}

}
