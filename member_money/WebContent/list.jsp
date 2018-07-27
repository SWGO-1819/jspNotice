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
	
	sql="select * from sys.member_tbl_02 order by custno asc";
	res = conn.prepareStatement(sql).executeQuery();
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
				<li><a href="#">회원등록</a></li>
				<li><a href="#">회원목록 조회/수정</a></li>
				<li><a href="#">회원매출조회</a></li>
				<li><a href="#">홈으로</a></li>
			</ul>
		</div>
	</div>
	<div class="container">
		<div class="content">
			<h2>홈쇼핑 회원 등록</h2>
			<table>
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>거주지역</th>
				</tr>
				</thead>
				<tbody>
					<%
						String custno,custname,phone,address,joindate,grade,city;
						while(res.next()){
							custno = res.getString("custno");
							custname = res.getString("custname");
							phone = res.getString("phone");
							address = res.getString("address");
							joindate = res.getString("joindate");
							grade = res.getString("grade");
							city = String.format("%02d",res.getInt("city"));
							if(grade != null)switch(grade){
								case "A": grade="VIP";break;
								case "B": grade="일반";break;
								case "C": grade="직원";break;
							}
					%>
					<tr style="text-align:center;">
						<td><a href="update.jsp?custno=<%=custno%>"><%=custno%></a></td>
						<td><%=custname%></td>
						<td><%=phone%></td>
						<td><%=address%></td>
						<td><%=joindate%></td>
						<td><%=grade%></td>
						<td><%=city%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>