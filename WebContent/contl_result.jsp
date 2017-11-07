<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String age = (String)request.getAttribute("AGE");
	String spec = (String)request.getAttribute("SPEC");
	String astig = (String)request.getAttribute("ASTIG");
	String tpr = (String)request.getAttribute("TPR");
	String algo = (String)request.getAttribute("ALGO");
   	String rec = (String)request.getAttribute("REC");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="kor">

<style>
div.content{
  position: relative;
  margin-top: 50px;
  width: 800px;
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
	<title>contact_lenses_result</title>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" type="text/css" href="asset/css/main.css">
		<link rel="stylesheet" type="text/css" href="asset/css/content.css">
	</head>
	
	<body>
		<aside class='left'>
		</aside>
		
		<div class='content'>
		<%
			if(algo.equals("ar")){
				rec="trash";%>
				사용한 알고리즘: Association-Rule(Apriori)<br/><br/>
				age=<%=age %>, spec=<%=spec %>, astig=<%=astig %>, tpr=<%=tpr %> 일때 적용되는 연관규칙<br/><br/><%
				if(tpr.equals("reduced")){%>
					1. tpr이 reduced 일 때 추천 렌즈는 none입니다.<br/><%
				}
				if(spec.equals("myope") && tpr.equals("reduced")){%>
					2. spec가 myope이고 tpr이 reduced일 때 추천 렌즈는 none입니다.<br/><%
				}
				if(spec.equals("hypermetrope") && tpr.equals("reduced")){%>
					3. spec가 hypermetrope이고 tpr이 reduced일 때 추천 렌즈는 none입니다.<br/><%
				}
				if(astig.equals("no") && tpr.equals("reduced")){%>
					4. astig가 no이고 tpr이 reduced일 때 추천 렌즈는 none입니다.<br/><%
				}
				if(astig.equals("no") && tpr.equals("reduced")){%>
					5. astig가 no이고 tpr이 reduced일 때 추천 렌즈는 none입니다.<br/><%
				}
				if(rec.equals("soft")){%>
					6. 추천 렌즈가 soft일 때, astig는 no입니다.<br/><%
				}
				if(rec.equals("soft")){%>
					7. 추천 렌즈가 soft일 때, tpr은 normal입니다.<br/><%
				}
				if(tpr.equals("normal") && rec.equals("soft")){%>
					8. tpr이 normal이고 추천 렌즈가 soft일 때 astig는 no입니다.<br/><%
				}
				if(astig.equals("no") && rec.equals("soft")){%>
					9. astig가 no이고 추천 렌즈가 soft일 때 tpr은 normal입니다.<br/><%
				}
				if(rec.equals("soft")){%>
					10. 추천 렌즈가 soft일 때 astig는 no이고 tpr은 normal입니다.<br/><%
				}
			}
			else{%>
				<br/>
				사용한 알고리즘:
				<% if(algo.equals("or")){%> One-Rule<br/> <%}else if(algo.equals("nv")){%> Naive-Baysian<br/>
				<%} else{%> Decision-Tree<br/><%} %>
				정확도:
				<% if(algo.equals("or")){%> 70.83%<br/> <%}else if(algo.equals("nv")){%> 95.83%<br/>
				<%} else{%> 91.67%<br/><%} %> 
				<br/>
				age=<%=age %>, spec=<%=spec %>, astig=<%=astig %>, tpr=<%=tpr %> 일때 추천하는 렌즈는 <strong><font color='red'><%=rec %></font></strong>형 입니다.<br/><%} %>
				<br/><br/><br/>
				<a href="main.jsp"><input type="button" value="도메인 선택"></a>
				<button onClick="window.location='contl.jsp';" value='속성값 선택'>속성값 선택</button>
	  	</div>
	  
	  	<aside class='right'>
	  	</aside>
	  
	  	<footer>
	  		Data Mining <br>
	  		Catholic Univ.
	  	</footer>
  </body>
</html>