package predict;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contluse")
public class contluse extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public contluse() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String age = request.getParameter("age");
		String spec = request.getParameter("spec");
		String astig = request.getParameter("astig");
		String tpr = request.getParameter("tpr");
		String Algo = request.getParameter("Algorithm");
		double pbnone = 1.000;
		double pbsoft = 1.000;
		double pbhard = 1.000;
		ArrayList<Double> list = new ArrayList<Double>();
		double max=0.0;
		String rec = "soft";
		String bestrec = "none";
		
		/* One-Rule */
		if(Algo.equals("or")){
			if(tpr.equals("reduced")) rec="none";
			else rec="soft";
		}
		/* Naive-Bayes */
		else if(Algo.equals("nv")){
			/* age */
			if(age.equals("young")){ 
				pbnone*=(4.0/15.0);
				pbsoft*=(2.0/5.0);
				pbhard*=(2.0/4.0);
			}
			else if(age.equals("pre-presbyopic")){ 
				pbnone*=(5.0/15.0);
				pbsoft*=(2.0/5.0);
				pbhard*=(1.0/4.0);
			}
			else{
				pbnone*=(6.0/15.0);
				pbsoft*=(1.0/5.0);
				pbhard*=(1.0/4.0);
			}
			/* Spectacle Prescription */
			if(spec.equals("myope")){
				pbnone*=(7.0/15.0);
				pbsoft*=(2.0/5.0);
				pbhard*=(3.0/4.0);
			}
			else{
				pbnone*=(8.0/15.0);
				pbsoft*=(3.0/5.0);
				pbhard*=(1.0/4.0);
			}
			/* Astigmatism */
			if(astig.equals("no")){
				pbnone*=(7.0/15.0);
				pbsoft*=(5.0/5.0);
				pbhard*=(0.0/4.0);
			}
			else{
				pbnone*=(8.0/15.0);
				pbsoft*=(0.0/5.0);
				pbhard*=(4.0/4.0);
			}
			/* Tear Production Rate */
			if(tpr.equals("normal")){
				pbnone*=(3.0/15.0);
				pbsoft*=(5.0/5.0);
				pbhard*=(4.0/4.0);
			}
			else{
				pbnone*=(12.0/15.0);
				pbsoft*=(0.0/5.0);
				pbhard*=(0.0/4.0);
			}
			
			pbnone*=(15.0/24.0);
			pbsoft*=(5.0/24.0);
			pbhard*=(4.0/24.0);
			
			list.add(pbnone);
			list.add(pbsoft);
			list.add(pbhard);
			
			max = Collections.max(list);
			if(max==pbnone){
				rec = "none";
				bestrec = rec;
			}
			else if(max==pbsoft){
				rec = "soft";
				bestrec = rec;
			}
			else{
				rec = "hard";
				bestrec = rec;
			}
		}
		/* Decision Tree */
		else if(Algo.equals("dt")){
			if(tpr.equals("reduced")){
				rec = "none";
			}
			if(tpr.equals("normal")){
				if(astig.equals("no")) rec = "soft";
				else{
					if(spec.equals("myope")) rec = "hard";
					else rec = "none";
				}
			}
		}
		else if(Algo.equals("ar")){
			request.setAttribute("AGE", age);
			request.setAttribute("SPEC", spec);
			request.setAttribute("ASTIG", astig);
			request.setAttribute("TPR", tpr);
			request.setAttribute("ALGO", Algo);
			request.setAttribute("REC", rec);
			
			RequestDispatcher dis = request.getRequestDispatcher("contl_result.jsp");
			dis.forward(request, response);
		}
		
		request.setAttribute("AGE", age);
		request.setAttribute("SPEC", spec);
		request.setAttribute("ASTIG", astig);
		request.setAttribute("TPR", tpr);
		request.setAttribute("ALGO", Algo);
		request.setAttribute("REC", rec);
		
		RequestDispatcher dis = request.getRequestDispatcher("contl_result.jsp");
		dis.forward(request, response);
	}
}