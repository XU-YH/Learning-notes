package ex06;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/*MySQL�У�BLOB�Ǹ�����ϵ�У�������TinyBlob��Blob��MediumBlob��LongBlob���⼸������֮���Ψһ�������ڴ洢�ļ�������С�ϲ�ͬ�� 
MySQL������BLOB���� 
���� ��С(��λ���ֽ�) 
TinyBlob ��� 255 
Blob ��� 65K 
MediumBlob ��� 16M 
LongBlob ��� 4G 
*/

public class BlobTest {

	public static void main(String[] args) throws SQLException, IOException {
		BlobTest bt = new BlobTest();
		//bt.insert();
		bt.read();
	}

	public void read() throws SQLException, IOException {
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select * from t_blob where id = ?";
			psts = conn.prepareStatement(sql);
			psts.setInt(1, 1);
			rs = psts.executeQuery();
			while (rs.next()) {
				InputStream in = rs.getBinaryStream("c_blob");
				File file = new File("c:/2.jpg");
				OutputStream out = new BufferedOutputStream(
						new FileOutputStream(file));
				byte[] buff = new byte[1024];
				for (int i = 0; (i = in.read(buff)) > 0;) {
					out.write(buff, 0, i);
				}
				out.close();
				in.close();
			}
		} finally {
			JdbcUtil.free(rs, psts, conn);
		}
	}

	public void insert() throws SQLException, IOException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.getConnection();
			String sql = "insert into t_blob(c_blob) values(?) ";
			ps = conn.prepareStatement(sql);
			File file = new File("c:/1.jpg");
			InputStream in = new BufferedInputStream(new FileInputStream(file));
			ps.setBinaryStream(1, in, file.length());
			int i = ps.executeUpdate();
			in.close();
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
	}
}
