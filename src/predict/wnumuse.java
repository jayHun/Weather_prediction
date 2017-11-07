package predict;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/wnumuse")
public class wnumuse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static double result=0;
	
    public wnumuse() {
        super();
    }
    
    static private double normalize(double x, double stddev, double mean){
		result=Math.pow(Math.E, (-1.0*Math.pow(x-mean, 2) )/(2*Math.pow(stddev,2))) / (stddev*(Math.sqrt(2.0*Math.PI)));
		return result;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String outlook = request.getParameter("outlook");
		String temperature = request.getParameter("temperature");
		int temp = Integer.parseInt(temperature);
		String humidity = request.getParameter("humidity");
		int humi = Integer.parseInt(humidity);
		String windy = request.getParameter("windy");
		String Algo = request.getParameter("Algorithm");
		double pbyes = 1.000;
		double pbno = 1.000;
		int retval = 0;
		double nstddev=7.384;
		double nmean=74.8364;
		double ystddev=5.2304;
		double ymean=72.9697;
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
			pbyes*=normalize(temp, ystddev, ymean);
			pbno*=normalize(temp, nstddev, nmean);
			/*humidity*/
			pbyes*=normalize(humi, ystddev, ymean);
			pbno*=normalize(humi, nstddev, nmean);
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
				if(humi<=75) play="yes";
				else play="no";
			}
			if(outlook.equals("overcast")) play="yes";
			if(outlook.equals("rainy")){
				if(windy.equals("true")) play="no";
				else play="yes";
			}
		}
		request.setCharacterEncoding("UTF-8");
		request.setAttribute("OUTLOOK", outlook);
		request.setAttribute("TEMP", temp);
		request.setAttribute("HUMI", humi);
		request.setAttribute("WINDY", windy);
		request.setAttribute("ALGO", Algo);
		request.setAttribute("PLAY", play);
		RequestDispatcher dis = request.getRequestDispatcher("wnum_result.jsp");
		dis.forward(request, response);
	}
}