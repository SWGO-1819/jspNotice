<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String user = "system";
	String pw = "oracle";
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	String sql="";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(url,user,pw);
	ResultSet res;
	
	sql="select custno from sys.member_tbl_02 where rownum<=1 order by custno desc";
	res = conn.prepareStatement(sql).executeQuery();
	int custno=10001;
	if(res.next()){
		custno = res.getInt(1)+1;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/common.css">
</head>
<body>
	<div class="header">
		<h3 class="Logo">쇼핑몰 회원관리</h3>
		<div class="gnb">
			<ul>
				<li><a href="./index.jsp">회원등록</a></li>
				<li><a href="./update.jsp">회원목록 조회/수정</a></li>
				<li><a href="./list.jsp">회원매출조회</a></li>
				<li><a href="./index.jsp">홈으로</a></li>
			</ul>
		</div>
	</div>
	<div class="container">
		<div class="content">
			<h2>홈쇼핑 회원 등록</h2>
			<form action="./action.jsp" method="post">
				<input type="hidden" name="action"  value="member_insert">
				<table>
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tr>
						<th>회원번호(자동발생)</th>
						<td><input type="text" name="custno" size="20" value="<%=custno%>"></td>
					</tr>
					<tr>
						<th>회원성명</th>
						<td><input type="text" name="custname" size="20"></td>
					</tr>
					<tr>
						<th>회원전화</th>
						<td><input type="text" name="phone" size="30"></td>
					</tr>
					<tr>
						<th>회원주소</th>
						<td><input type="text" name="address" size="40"></td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><input type="text" name="joindate" size="30"></td>
					</tr>
					<tr>
						<th>고객등급(A:VIP,B:일반,C:직원)</th>
						<td><input type="text" name="grade" size="20"></td>
					</tr>
					<tr>
						<th>도시코드</th>
						<td><input type="text" name="city" size="20"></td>
					</tr>
				</table>
				<div class="btn_group">
					<button type="submit">등록</button>
					<button type="button" href="./list.jsp">조회</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>