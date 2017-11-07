package predict;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/wnomuse")
public class wnomuse extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public wnomuse() {
        super();

    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String outlook = request.getParameter("outlook");
		String temp = request.getParameter("temperature");
		String humi = request.getParameter("humidity");
		String windy = request.getParameter("windy");
		String Algo = request.getParameter("Algorithm");
		double pbyes = 1.000;
		double pbno = 1.000;
		int retval = 0;
		String play = "yes";
		
		/*One-Rule*/
		if(Algo.equals("or")){
			if(outlook.equals("sunny")) play="no";
		}
		
		/*Naive-Bayes*/
		else if(Algo.equals("nv")){
			/*outlook*/
			if(outlook.equals("sunny")){ 
				pbyes*=(2.0/9.0);
				pbno*=(3.0/5.0);
			}
			else if(outlook.equals("overcast")){ 
				pbyes*=(4.0/9.0);
				pbno*=0.0;
			}
			else{
				pbyes*=(3.0/9.0);
				pbno*=(2.0/5.0);
			}
			/*temperature*/
			if(temp.equals("cool")){
				pbyes*=(3.0/9.0);
				pbno*=(1.0/5.0); 
			}
			else if(temp.equals("mild")){
				pbyes*=(4.0/9.0);
				pbno*=(2.0/5.0);
			}
			else{
				pbyes*=(2.0/9.0);
				pbno*=(2.0/5.0);
			}
			/*humidity*/
			if(humi.equals("normal")){
				pbyes*=(6.0/9.0);
				pbno*=(1.0/5.0);
			}
			else{
				pbyes*=(3.0/9.0);
				pbno*=(4.0/5.0);
			}
			/*windy*/
			if(windy.equals("true")){
				pbyes*=(3.0/9.0);
				pbno*=(3.0/5.0);
			}
			else{
				pbyes*=(6.0/9.0);
				pbno*=(2.0/5.0);
			}
			
			pbyes*=(9.0/14.0);
			pbno*=(5.0/14.0);
			retval=Double.compare(pbyes, pbno);
			
			if(retval<0){
				play="no";
			}
			else if(retval>0){
				play="yes";
			}
			else{
				play="either";
			}
		}
		
		/*Decision Tree*/
		else{
			if(outlook.equals("sunny")){
				if(humi.equals("normal")) play="yes";
				else play="no";
			}
			if(outlook.equals("overcast")) play="yes";
			if(outlook.equals("rainy")){
				if(windy.equals("true")) play="no";
				else play="yes";
			}
		}
		
		request.setAttribute("OUTLOOK", outlook);
		request.setAttribute("TEMP", temp);
		request.setAttribute("HUMI", humi);
		request.setAttribute("WINDY", windy);
		request.setAttribute("ALGO", Algo);
		request.setAttribute("PLAY", play);
		RequestDispatcher dis = request.getRequestDispatcher("wnom_result.jsp");
		dis.forward(request, response);
	}
}