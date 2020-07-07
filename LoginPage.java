package myworks;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name="HiServlet", urlPatterns={"/loginpage"})

public class LoginPage extends HttpServlet {
        private static final long serialVersionUID = 1L;
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {
                doPost(request, response);
        }
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                if (username != null && username.trim().length() > 0 && password != null && password.trim().length() > 0) {
                        System.out.println(username + ":" + password);
                        if (username != null && username.length() != 0 && username.equals("xoxo") && password != null
                                        && password.length() != 0 && password.equals("123456789")) {
                                if (request.getParameter("remember") != null) {
                                        String remember = request.getParameter("remember");
                                        System.out.println("remember : " + remember);
                                        Cookie cUserName = new Cookie("cookuser", username.trim());
                                        Cookie cPassword = new Cookie("cookpass", username.trim());
                                        Cookie cRemember = new Cookie("cookrem", remember.trim());
                                        cUserName.setMaxAge(60 * 60 * 24 * 1);// 1 day
                                        cPassword.setMaxAge(60 * 60 * 24 * 1);
                                        cRemember.setMaxAge(60 * 60 * 24 * 1);
                                        response.addCookie(cUserName);
                                        response.addCookie(cPassword);
                                        response.addCookie(cRemember);
                                }
                                HttpSession httpSession = request.getSession();
                                httpSession.setAttribute("verify", "true");
                                httpSession.setAttribute("sessuser", username.trim());
                                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/HomePage.jsp");
                                requestDispatcher.forward(request, response);
                        } else {
                                HttpSession httpSession = request.getSession();
                                System.out.println("Login failed. Please try again!");
                                // request.setAttribute("verify", "false");
                                httpSession.setAttribute("verify", "false");
                                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/LoginPage.jsp?check=false");
                                requestDispatcher.forward(request, response);
                        }
                } else {
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("verify", "false");
                        System.out.println("Username and Password are required fields.");
                        // request.setAttribute("verify", "false");
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/LoginPage.jsp?check=false");
						                        requestDispatcher.forward(request, response);
                }
        }
}

						
