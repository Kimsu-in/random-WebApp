<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<style>
	body{
	background-color: #ADD8E6;
	}
	h2{
		color: #191970;
		text-align: center;
	}
	h4{
		text-align: center;
		border:3px solid;
		border-color: #E0FFFF;
		padding: 10px 10px;
	}
	button{
		background-color: #4169E1;
		color: white;
		text-align: center;
		border-radius: 5px;
		font-size: 17px; 
		padding: 10px 10px;
		cursor: pointer;
		display: block;
		margin: auto;
	}
	
</style>
<meta charset="UTF-8">
<title>음식점 랜덤 출력</title>
</head>
<body>
<div>
	<h2>안동시 송천동 음식점</h2>
</div>
<div>
<h4>
<%
	Connection conn = null;
	try {
		Class.forName("org.sqlite.JDBC");
		String dbFile = "C:\\DB.Browser.for.SQLite-3.12.2-win64\\DB Browser for SQLite\\db\\random.db";
		conn = DriverManager.getConnection("jdbc:sqlite:" + dbFile);

		Statement stat = conn.createStatement();
		ResultSet rs = stat.executeQuery("SELECT Id, Name, Category, Address, Phone, Url FROM Kakao WHERE id IN (SELECT id FROM Kakao ORDER BY RANDOM() LIMIT 3)");
		while(rs.next()) {
			String name = rs.getString("Name");
			String category = rs.getString("Category");
			String address = rs.getString("Address");
			String phone = rs.getString("Phone");
			String url = rs.getString("Url");
			out.println("<div>");
			out.println(name+"<br>");
			out.println(category+"<br>");
			out.println(address+"<br>");
			out.println(phone+"<br>");
			out.println("<a href="+url+">"+url+"</a>");
			out.println("<br>");
			out.println("</div>");
			out.println("<br>");
		}
	}catch(Exception e){ 
		e.printStackTrace();
		out.println("연결실패");
  	}finally {
		if(conn!=null) {
			try {
				conn.close();
			}catch(Exception e) {}
		}
	}
%>
</h4>
</div>

<br>
<button onclick="location.href='resrandom.jsp'">다시!!</button>
<br>
<button onclick="location.href='Main.html'">메인화면</button>
</body>
</html>
