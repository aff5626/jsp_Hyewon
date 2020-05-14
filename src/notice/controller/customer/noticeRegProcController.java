package notice.controller.customer;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class noticeRegProcController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("noticeRegProcController 신호신호");
		/*
		 * String title = request.getParameter("title"); String content =
		 * request.getParameter("content"); // 파일 추가 받는 파라미터 추가하기 String file =
		 * request.getParameter("file");
		 */

		// 경로 지정
		/*String path = "customer/upload";// 외관상의 주소를 가지고 진짜 주소 찾기
		ServletContext ctx = request.getServletContext();
		path = ctx.getRealPath(path);//*/		
		//path따로 가져오기
		String path = this.getClass().getResource("").getPath();
		
		path=path.substring(1,path.indexOf(".metadata"))+
				"jspWebm18_mvc2/WebContent/customer/upload";
		
		System.out.println("getpath" + path);
		MultipartRequest req = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8",
				new DefaultFileRenamePolicy());// 업로드 사이즈 크기를 지정
		// 파일이름이 중복으로 올라갈때 리네임해서 서버에 올려줌(안그러면 이름1 원본파일 사라짐
		// 멀티파트 형식으로 바꿔서 받아주기(이제requst안씀)
		// 파일 추가 받는 파라미터 추가하기
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String file = req.getFilesystemName("file");//시스템내의 파일이름,중복된 파일도 올릴 수 있게 이름이 바뀜
		String uid = req.getParameter("uid");
		String orgFile = req.getOriginalFileName("file");//오리지널 파일 이름
		
		
		
		
		System.out.println("title 신호옴" + title);// url인코딩 방식에서 다른 방식으로 변경하여 null로 신호
		System.out.println("file신호 옴" + file);
		System.out.println("writer="+uid);
		System.out.println("orgfilesrc="+orgFile);
		//n에 담아서 보내주기
		Notice n = new Notice();
		n.setTitle(title);
		n.setContent(content);
		n.setWriter(uid);
		n.setFilesrc(file);
		n.setOrgfilesrc(orgFile);

		
		//패키징 n 해서 보내주기
		NoticeDao dao = new NoticeDao();
		int af = dao.insert(n);

		PrintWriter out = response.getWriter();
		// 목록으로 이동
		if (af > 0)
			response.sendRedirect("notice.do");
		else
			out.println("글쓰기오류");

	}

}
