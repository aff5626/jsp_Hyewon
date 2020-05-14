package notice.controller.customer;

import java.io.FileInputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.coyote.Response;

import notice.controller.Controller;

public class DownloadController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("다운로드 통과~~~");
		String path = request.getParameter("p");// noticeDetail(p=customer/upload(경로)
		String fname = request.getParameter("f");// noticeDetail(&f=${n.filesrc }파일 이름)
		String urlPath = path + "/" + fname;

		String realpath = request.getServletContext().getRealPath(urlPath);// path구하기
		System.out.println("=realpath=" + urlPath);
		response.setHeader("Content-Disposition", "attachment filename=" + new String(fname.getBytes(), "ISO8859_1"));

		FileInputStream fin = new FileInputStream(realpath);
		ServletOutputStream sout = response.getOutputStream();

		byte[] buf = new byte[1024];
		int size = 0;
		// -1=end of file
		while ((size = fin.read(buf, 0, 1024)) != -1) {
			// 파일이 없을때까지 돌아라
			sout.write(buf, 0, size);
		}
		fin.close();
		sout.close();

	}

}
