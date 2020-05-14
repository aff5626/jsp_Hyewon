package notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import notice.db.DBCon;
import notice.vo.Member;

public class MemberDao {

	public Member getMember(String uid) throws Exception {
		//

		String sql = "select * from member where id=?";
		Connection con = DBCon.getConnection();// 미리 만들어준 커넥션 명령어에 연결해주기

		PreparedStatement pstmt = con.prepareStatement(sql);

		pstmt.setString(1, uid);// form에서 입력한 uid받기
		ResultSet rs = pstmt.executeQuery();
		Member m = null;
		//잘들어왔나 검사하기
		if(rs.next()) {
			m=new Member();
			m.setId(rs.getString("id"));
			m.setPwd(rs.getString("pwd"));
			
			System.out.println("m.id"+m.getId());
			
		}
		rs.close();
		pstmt.close();
		con.close();

		return m;//m으로 리턴해주기(리턴타입을 멤버로 약속했기때문)
	}

}
