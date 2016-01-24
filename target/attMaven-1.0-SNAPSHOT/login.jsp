<%@ page import="googleintegration.LoadContentFromGoogle" %>
<%@ page import="java.util.HashMap"%>
<%
    LoadContentFromGoogle pleaseLoadContent = new LoadContentFromGoogle();
    HashMap<String,String> allMyPeople = pleaseLoadContent.loadUsersPasswords();
    String username = (String) request.getParameter("username");
    String password = (String) request.getParameter("password");
    String checkPassword = allMyPeople.get(username);
    
    if(password.equals(checkPassword))
    {
        session.setAttribute("currentUser", username);
    }
    
    if( session.getAttribute("currentUser") == null )
    {
        response.sendRedirect("index.html");
    } else
    {
        response.sendRedirect("test.html");
    }
%>