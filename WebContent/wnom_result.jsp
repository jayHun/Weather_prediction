<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String outlook = (String)request.getAttribute("OUTLOOK");
	String temp = (String)request.getAttribute("TEMP");
	String humi = (String)request.getAttribute("HUMI");
	String windy = (String)request.getAttribute("WINDY");
	String algo = (String)request.getAttribute("ALGO");
   	String play = (String)request.getAttribute("PLAY");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="kor">

<style>
div.content{
  position: relative;
  margin-top: 50px;
  width: 700px;
  height: 400px;
  background-color: white;
  border: 7px double #008040;
  border-radius: 10px;
  float: left;
  text-align: left;
  padding-top: 50px;
}
</style>

	<head>
	<title>Weather(nominal)_result</title>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" type="text/css" href="asset/css/main.css">
		<link rel="stylesheet" type="text/css" href="asset/css/content.css">
	</head>
	
	<body>
		<aside class='left'>
		</aside>
		
		<div class='content'>
			사용한 알고리즘:
			<% if(algo.equals("or")){%> One-Rule<br/> <%}else if(algo.equals("nv")){%> Naive-Baysian<br/>
			<%} else{%> Decision-Tree<br/><%} %>
			정확도:
			<% if(algo.equals("or")){%> 71.43%<br/> <%}else if(algo.equals("nv")){%> 92.86%<br/>
			<%} else{%> 100.00%<br/><%} %>
			<br/>
			outlook=<%=outlook %>, temperature=<%=temp %>, humidity=<%=humi %>, windy=<%=windy %>일 때 외출 추천은 <strong><font color='red'><%=play %></font></strong> 입니다.<br/>
			<br><br>
			<a href="main.jsp"><input type="button" value="도메인 선택"></a>
			<button onClick="window.location='wnom.jsp';" value='속성값 선택'>속성값 선택</button>
	  	</div>
	  
	  	<aside class='right'>
	  	</aside>
	  
	  	<footer>
	  		Data Mining <br>
	  		Catholic Univ.
	  	</footer>
  </body>
</html>