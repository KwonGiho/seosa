package bookshop.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CustomerDBBean {
	
	private static CustomerDBBean instance = new CustomerDBBean();
	   
    public static CustomerDBBean getInstance() {
    	return instance;
    }
   
    private CustomerDBBean() {}
   
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
        return ds.getConnection();
    }

    //�쉶�썝媛��엯
    public void insertMember(CustomerDataBean member) 
    throws Exception {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
           	 "insert into member values (?,?,?,?,?,?,?,?)");
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPasswd());
            pstmt.setString(3, member.getName());
            pstmt.setTimestamp(4, member.getReg_date());
            pstmt.setString(5, member.getTel());
            pstmt.setString(6, member.getAddress());
          
            pstmt.executeUpdate();
        }catch(Exception ex) {
        	ex.printStackTrace();
        } finally {
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
    }

	 public int userCheck(String id, String passwd) //�궗�슜�옄 �씤利앹쿂由�
	 throws Exception {
		 Connection conn = null;
         PreparedStatement pstmt = null;
		 ResultSet rs= null;
         String dbpasswd="";
		 int x=-1;
       
		 try {
			conn = getConnection();
           
            pstmt = conn.prepareStatement(
            	"select passwd from member where id = ?");
            pstmt.setString(1, id);
            rs= pstmt.executeQuery();

			if(rs.next()){
				dbpasswd= rs.getString("passwd"); 
				if(dbpasswd.equals(passwd))
					x= 1; //�씤利� �꽦怨�
				else
					x= 0; //鍮꾨�踰덊샇 ��由�
			}else
				x= -1;//�빐�떦 �븘�씠�뵒 �뾾�쓬
         }catch(Exception ex) {
        	 ex.printStackTrace();
         } finally {
			 if (rs != null) 
				 try { rs.close(); } catch(SQLException ex) {}
             if (pstmt != null) 
            	 try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) 
            	 try { conn.close(); } catch(SQLException ex) {}
         }
		 return x;
	 }

	 public int confirmId(String id) //以묐났�븘�씠�뵒 泥댄겕
	 throws Exception {
		 Connection conn = null;
         PreparedStatement pstmt = null;
		 ResultSet rs= null;
		 int x=-1;
       
		 try {
			 conn = getConnection();
           
             pstmt = conn.prepareStatement(
           	  "select id from member where id = ?");
             pstmt.setString(1, id);
             rs= pstmt.executeQuery();

			 if(rs.next())
				 x= 1; //�빐�떦 �븘�씠�뵒 �엳�쓬
			 else
				 x= -1;//�빐�떦 �븘�씠�뵒 �뾾�쓬		
         }catch(Exception ex) {
             ex.printStackTrace();
         } finally {
			 if (rs != null) 
				 try { rs.close(); } catch(SQLException ex) {}
             if (pstmt != null) 
            	 try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) 
            	 try { conn.close(); } catch(SQLException ex) {}
         }
		 return x;
	 }
	 
	 //�쉶�썝�젙蹂대�� �닔�젙�븯湲� �쐞�빐 湲곗〈�쓽 �젙蹂대�� �몴�떆
     public CustomerDataBean getMember(String id) 
     throws Exception {
    	 Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         CustomerDataBean member=null;
         
         try {
        	 conn = getConnection();
           
             pstmt = conn.prepareStatement(
           	     "select * from member where id = ?");
             pstmt.setString(1, id);
             rs = pstmt.executeQuery();

             if (rs.next()) {
            	 member = new CustomerDataBean();
            	 
                 member.setId(rs.getString("id"));
                 member.setPasswd(rs.getString("passwd"));
				 member.setName(rs.getString("name"));
				 member.setReg_date(rs.getTimestamp("reg_date")); 
                 member.setTel(rs.getString("tel"));
                 member.setAddress(rs.getString("address"));     
			 }
         }catch(Exception ex) {
             ex.printStackTrace();
         }finally {
             if (rs != null) 
            	 try { rs.close(); } catch(SQLException ex) {}
             if (pstmt != null) 
            	 try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) 
            	 try { conn.close(); } catch(SQLException ex) {}
         }
		 return member;
     }
   
     public void updateMember(CustomerDataBean member) //�쉶�썝�쓽 �젙蹂댁닔�젙
     throws Exception {
    	 Connection conn = null;
         PreparedStatement pstmt = null;
       
         try {
        	 conn = getConnection();
           
             pstmt = conn.prepareStatement(
               "update member set passwd=?,name=?,tel=?,address=? "+
               "where id=?");
             pstmt.setString(1, member.getPasswd());
             pstmt.setString(2, member.getName());
             pstmt.setString(3, member.getTel());
             pstmt.setString(4, member.getAddress());
             pstmt.setString(5, member.getId());
           
             pstmt.executeUpdate();
         }catch(Exception ex) {
             ex.printStackTrace();
         }finally {
             if (pstmt != null) 
            	 try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) 
            	 try { conn.close(); } catch(SQLException ex) {}
         }
     }
   
     public int deleteMember(String id, String passwd) //�쉶�썝�깉�눜
     throws Exception {
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs= null;
         String dbpasswd="";
         int x=-1;
         
         try {
			 conn = getConnection();

             pstmt = conn.prepareStatement(
           	  "select passwd from member where id = ?");
             pstmt.setString(1, id);
             rs = pstmt.executeQuery();
           
			 if(rs.next()){
				 dbpasswd= rs.getString("passwd"); 
				 if(dbpasswd.equals(passwd)){
					 pstmt = conn.prepareStatement("delete from member where id=?");
                     pstmt.setString(1, id);
                     pstmt.executeUpdate();
					 x= 1; //�쉶�썝�깉�눜 �꽦怨�
				 }else
					 x= 0; //鍮꾨�踰덊샇 ��由�
			 }
         }catch(Exception ex) {
             ex.printStackTrace();
         }finally {
             if (rs != null) 
            	 try { rs.close(); } catch(SQLException ex) {}
             if (pstmt != null) 
            	 try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) 
            	 try { conn.close(); } catch(SQLException ex) {}
         }
		 return x;
     }

}