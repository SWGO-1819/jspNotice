<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");

String user="system";
String pw="oracle";
String url ="jdbc:oracle:thin:@localhost:1521:xe";
String sql="";
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection(url,user,pw);

String action = request.getParameter("action");
ResultSet res;

switch(action){
case "member_insert":
	String
	custno= request.getParameter("custno"),
	custname= request.getParameter("custname"),
	phone = request.getParameter("phone"),
	address = request.getParameter("address"),
	joindate = request.getParameter("joindate"),
	grade = request.getParameter("grade"),
	city=request.getParameter("city");
	sql = "update sys.member_tbl_02 values('%s','%s','%s','%s','%s','%s','%s')";
	sql = String.format(sql, custno, custname, phone, address, joindate, grade, city);
break;
case "member_update":
	custno= request.getParameter("custno");
	custname= request.getParameter("custname");
	phone = request.getParameter("phone");
	address = request.getParameter("address");
	joindate = request.getParameter("joindate");
	grade = request.getParameter("grade");
	city=request.getParameter("city");
	sql = "update sys.member_tbl_02 set";
	sql +="custname='%s'";
	sql +="phone='%s'";
	sql +="address='%s'";
	sql +="joindate='%s'";
	sql +="grade='%s'";
	sql +="city='%s'";
	sql +="where custno =%s";
	sql = String.format(sql, custno, custname, phone, address, joindate,grade, city,custno);
break;
}
conn.prepareStatement(sql).executeUpdate();
%>
<script>
	alert("완료");
	location.replace("./");
</script>