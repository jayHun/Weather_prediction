
<!--
	���� ȯ�� : Java, Eclipse-EE, jre1.8.0_77 
	���α׷� ���� : - weather ������ (1R, Naive-Baysian, Decision-Tree �˰��� ����)
	              - contact-lenses ������(�� 3���� �˰��� ������Ģ �˰��� �߰�)
	              - ����� �˰���, �з���Ȯ��, ��õ class �� ���			      
-->

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
  text-align: center;
  padding-top: 50px;
}
</style>

	<head>
	<title>Homework_2</title>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" type="text/css" href="asset/css/main.css">
		<link rel="stylesheet" type="text/css" href="asset/css/content.css">
	</head>
	
	<body>
		<aside class='left'>
		</aside>
		
		<div class='content'>
	    	<h3>Choose Domain</h3><br/><br/><br/>
	    	<a href="wnom.jsp"><input type="button" value="1. Weather(Nominal)"></a><br/><br/>
	    	<a href="wnum.jsp"><input type="button" value="2. Weather(Numeric)"></a><br/><br/>
	    	<a href="contl.jsp"><input type="button" value="3. Contact Lenses"></a><br/><br/>
	  	</div>
	  
	  	<aside class='right'>
	  	</aside>
	  
	  	<footer>
	  		Data Mining <br>
	  	</footer>
  </body>
</html>