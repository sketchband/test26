package test26;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MenberDAO {
	
	private DBConnectionMgr pool;
	
	public MenberDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void InsertProc(MemberBean bean) {
		Connection con = null;
		PreparedStatement stmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "insert into MEMBER11 values(?,?,?,?,?,?,?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, bean.getId());
			stmt.setString(2, bean.getPw());
			stmt.setString(3, bean.getName());
			stmt.setString(4, bean.getEmail());
			stmt.setString(5, bean.getJob());
			String hobby[] = bean.getHobby();
			char hb[] = {'0','0','0','0','0','0'};
			String lists[] = {"축구","게임","공부","영화","낚시","독서"};
			for(int i=0;i<hobby.length;i++) {
				for(int j=0;j<lists.length;j++) {
					if(hobby[i].equals(lists[j]))
						hb[j] = '1';
				}
			}
			stmt.setString(6, new String(hb));
			stmt.setString(7, bean.getZipcode());
			stmt.setString(8, bean.getAddress());
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,stmt);
		}
	}
	
	public Vector<zipcodeBean> ZipCode(String area3){
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Vector<zipcodeBean> vlist = new Vector<zipcodeBean>();
		
		try {
			con = pool.getConnection();
			String sql = "select * from tblZipcode where area3 like ? ";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, "%"+area3+"%");
			rs = stmt.executeQuery();
			while(rs.next()) {
				zipcodeBean bean = new zipcodeBean();
				bean.setZipcode(rs.getString("zipcode"));
				bean.setArea1(rs.getString("area1"));
				bean.setArea2(rs.getString("area2"));
				bean.setArea3(rs.getString("area3"));
				vlist.addElement(bean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,stmt,rs);
		}
		return vlist;
	}
	
}
