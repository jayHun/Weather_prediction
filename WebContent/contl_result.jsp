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
				����� �˰���: Association-Rule(Apriori)<br/><br/>
				age=<%=age %>, spec=<%=spec %>, astig=<%=astig %>, tpr=<%=tpr %> �϶� ����Ǵ� ������Ģ<br/><br/><%
				if(tpr.equals("reduced")){%>
					1. tpr�� reduced �� �� ��õ ����� none�Դϴ�.<br/><%
				}
				if(spec.equals("myope") && tpr.equals("reduced")){%>
					2. spec�� myope�̰� tpr�� reduced�� �� ��õ ����� none�Դϴ�.<br/><%
				}
				if(spec.equals("hypermetrope") && tpr.equals("reduced")){%>
					3. spec�� hypermetrope�̰� tpr�� reduced�� �� ��õ ����� none�Դϴ�.<br/><%
				}
				if(astig.equals("no") && tpr.equals("reduced")){%>
					4. astig�� no�̰� tpr�� reduced�� �� ��õ ����� none�Դϴ�.<br/><%
				}
				if(astig.equals("no") && tpr.equals("reduced")){%>
					5. astig�� no�̰� tpr�� reduced�� �� ��õ ����� none�Դϴ�.<br/><%
				}
				if(rec.equals("soft")){%>
					6. ��õ ��� soft�� ��, astig�� no�Դϴ�.<br/><%
				}
				if(rec.equals("soft")){%>
					7. ��õ ��� soft�� ��, tpr�� normal�Դϴ�.<br/><%
				}
				if(tpr.equals("normal") && rec.equals("soft")){%>
					8. tpr�� normal�̰� ��õ ��� soft�� �� astig�� no�Դϴ�.<br/><%
				}
				if(astig.equals("no") && rec.equals("soft")){%>
					9. astig�� no�̰� ��õ ��� soft�� �� tpr�� normal�Դϴ�.<br/><%
				}
				if(rec.equals("soft")){%>
					10. ��õ ��� soft�� �� astig�� no�̰� tpr�� normal�Դϴ�.<br/><%
				}
			}
			else{%>
				<br/>
				����� �˰���:
				<% if(algo.equals("or")){%> One-Rule<br/> <%}else if(algo.equals("nv")){%> Naive-Baysian<br/>
				<%} else{%> Decision-Tree<br/><%} %>
				��Ȯ��:
				<% if(algo.equals("or")){%> 70.83%<br/> <%}else if(algo.equals("nv")){%> 95.83%<br/>
				<%} else{%> 91.67%<br/><%} %> 
				<br/>
				age=<%=age %>, spec=<%=spec %>, astig=<%=astig %>, tpr=<%=tpr %> �϶� ��õ�ϴ� ����� <strong><font color='red'><%=rec %></font></strong>�� �Դϴ�.<br/><%} %>
				<br/><br/><br/>
				<a href="main.jsp"><input type="button" value="������ ����"></a>
				<button onClick="window.location='contl.jsp';" value='�Ӽ��� ����'>�Ӽ��� ����</button>
	  	</div>
	  
	  	<aside class='right'>
	  	</aside>
	  
	  	<footer>
	  		Data Mining <br>
	  		Catholic Univ.
	  	</footer>
  </body>
</html>