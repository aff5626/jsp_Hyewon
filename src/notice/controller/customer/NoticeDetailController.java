package notice.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeDetailController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 데이터베이스에서 seq로 select 조건이 필요
		String seq = request.getParameter("c");// notice.jsp에서 신호옴
		String hit = request.getParameter("h");
		NoticeDao dao = new NoticeDao();
		// getnotice할때 hit카운트 세기
		Notice n = dao.getNotice(seq, hit);
		System.out.println("NoticeDetailController 신호");

		request.setAttribute("n", n);
		request.getRequestDispatcher("/WEB-INF/view/customer/noticeDetail.jsp").forward(request, response);
	}

}
