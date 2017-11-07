<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	<title>Weather(numeric)</title>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" type="text/css" href="asset/css/main.css">
		<link rel="stylesheet" type="text/css" href="asset/css/content.css">
	</head>
	
	<body>
		<aside class='left'>
		</aside>
		
		<div class='content'>
		<center>
	    <form action="wnumuse" method="post">
	    	<table border="1" bgcolor="wheat">
	    	<caption><h3>Insert New Data</h3></caption>
			<tr>
				<td>Outlook : </td>
				<td><input type="radio" name="outlook" value="sunny">sunny
					<input type="radio" name="outlook" value="overcast">overcast
					<input type="radio" name="outlook" value="rainy">rainy
				</td>
			</tr>
			<tr>
				<td>Temperature : </td>
				<td><input type="text" name="temperature">(1~100)</td>
			</tr>
			<tr>
				<td>Humidity : </td>
				<td><input type="text" name="humidity">(1~100)</td>
			</tr>
			<tr>
				<td>Windy : </td>
				<td><input type="radio" name="windy" value="true">true
					<input type="radio" name="windy" value="false">false
				</td>
			</tr>
			<tr>
				<td>Algorithm : </td>
				<td><input type="radio" name="Algorithm" value="or">1-Rule
					<input type="radio" name="Algorithm" value="nv">Naive-Bayes
					<input type="radio" name="Algorithm" value="dt">Decision-Tree
				</td>
			</tr>
			
			</table><br><br>
			<input type="submit" value="실 행">&nbsp;<input type="reset" value="초기화">&nbsp;
			<a href="main.jsp"><input type="button" value="도메인 선택"></a>
		</form>
		</center>
	  	</div>
	  
	  	<aside class='right'>
	  	</aside>
	  
	  	<footer>
	  		Data Mining <br>
	  		Catholic Univ.
	  	</footer>
  </body>
</html>