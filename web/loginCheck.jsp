<%@ page contentType="text/html;charset=GB2312" %>
<%@page import="java.sql.*"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>�����û�����ϵͳ</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <%
            String strUser = (String) session.getAttribute("name");
            if (strUser == null) {
                out.println("<h2>���ȵ�¼,лл!</h2>");
                out.println("<h2>2���Ӻ�,�Զ���ת����¼ҳ��!</h2>");
                response.setHeader("refresh", "2;URL=index.jsp");
            } else {
        %>
        <%
                String userName = request.getParameter("userName");
                String userPassword = request.getParameter("userPassword");
                String userKind = request.getParameter("kind");
                session.setAttribute("name", userName);
                Connection con;
                Statement sql;
                ResultSet rs;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String uri = "jdbc:mysql://localhost:3306/liuyang";
                con = DriverManager.getConnection(uri, "root", "19960822");
                sql = con.createStatement();
                    if (userKind.equals("admin")&&userName.length()==5&&userName.startsWith("4")) {                      
                        rs = sql.executeQuery("select * from users where id='" + userName + "' and password='" + userPassword + "'");
                          if (rs.next()) {
                             response.sendRedirect("admin.jsp");
                        }
                    }
                    if(userKind.equals("savers")&&userName.length()==5&&userName.startsWith("1")){
                        rs = sql.executeQuery("select * from users where id='" + userName + "' and password='" + userPassword + "'");
                          if (rs.next()) {
                             response.sendRedirect("Save_Index.jsp");
                        }
                    }
                    if(userKind.equals("carduser")&&userName.length()==5&&userName.startsWith("2")){
                        rs = sql.executeQuery("select * from users where id='" + userName + "' and password='" + userPassword + "'");
                          if (rs.next()) {
                             response.sendRedirect("carduser.jsp");
                        }
                    }
                    if(userKind.equals("lender")&&userName.length()==5&&userName.startsWith("3")){
                        rs = sql.executeQuery("select * from users where id='" + userName + "' and password='" + userPassword + "'");
                          if (rs.next()) {
                             response.sendRedirect("LoanClerkHome.html");
                        }
                    }
                    else
                    {
                        %>
                        <script type="text/javascript">
                            alert("�û������������");
                            </script>
                    <% out.println("<h2>2���Ӻ�,�Զ����ص���¼ҳ��!</h2>");
                      response.setHeader("refresh", "2;URL=index.jsp");%>
                        <%}
                    //response.sendRedirect("index.jsp");
                  con.close();
            }
        %>
    </body>
</html>