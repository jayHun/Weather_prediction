<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="kor">

<style>
div.content{
  position: relative;
  margin-top: 50px;
  width: 850px;
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
	<title>contact_lenses</title>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" type="text/css" href="asset/css/main.css">
		<link rel="stylesheet" type="text/css" href="asset/css/content.css">
	</head>
	
	<body>
		<aside class='left'>
		</aside>
		
		<div class='content'>
		<center>
		<form action="contluse" method="post">
	    	<table border="1" bgcolor="wheat">
	    	<caption><h3>Insert New Data</h3></caption>
			<tr>
				<td>Age : </td>
				<td><input type="radio" name="age" value="young">young
					<input type="radio" name="age" value="pre-presbyopic">pre-presbyopic
					<input type="radio" name="age" value="presbyopic">presbyopic
				</td>
			</tr>
			<tr>
				<td>Spectacle Prescription : </td>
				<td><input type="radio" name="spec" value="myope">myope
					<input type="radio" name="spec" value="hypermetrope">hypermetrope
				</td>
			</tr>
			<tr>
				<td>Astigmatism : </td>
				<td><input type="radio" name="astig" value="yes">yes
					<input type="radio" name="astig" value="no">no
				</td>
			</tr>
			<tr>
				<td>Tear Production Rate : </td>
				<td><input type="radio" name="tpr" value="reduced">reduced
					<input type="radio" name="tpr" value="normal">normal
				</td>
			</tr>
			<tr>
				<td>Algorithm : </td>
				<td><input type="radio" name="Algorithm" value="or">1-Rule
					<input type="radio" name="Algorithm" value="nv">Naive-Bayes
					<input type="radio" name="Algorithm" value="dt">Decision-Tree
					<input type="radio" name="Algorithm" value="ar">Association-Rule
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