<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>信用卡2</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <h1>调整信用额度</h1>
        <table border="1" width="100%">   
            
            <input type="button" name="submit" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick="javascript:history.back(-1);"value="返回上一页">
<%
 String x1=request.getParameter("a3");
  String x2=request.getParameter("a4");
 String x3=request.getParameter("a5");
   if((!x1.equals("")) &&(!x2.equals(""))&&(!x3.equals("")))
   {     
if(x1.startsWith("2"))
 {
  if(x1.length()==10)
  { 

String driverName="com.mysql.jdbc.Driver";
    try{
    Class.forName(driverName); 
    }
    
    catch(ClassNotFoundException e)
    {
    e.printStackTrace();
    }
    
String url="jdbc:mysql://127.0.0.1:3306/liuyang?user=root&password=19960822&characterEncoding=utf-8";

try
{
    Connection conn=DriverManager.getConnection(url);
    
    
  Statement statement=conn.createStatement();  
Statement statement1=conn.createStatement();    
String sql2="select * from xinyongka where kahao='" +x1+"' ";
  ResultSet rs2=statement1.executeQuery(sql2);  
  if(rs2.next())
  {
 // out.print("存在");
 if(x3.equals("correct")) 
 {
  String sql1="update xinyongka set xinyongedu=xinyongedu+'"+x2+"',keyongyue=keyongyue+'"+x2+"' where kahao='"+x1+"'"; 
 int n=statement.executeUpdate(sql1);
 out.print("更新成功");
 }
 else
   {String sql1="update xinyongka set xinyongedu=xinyongedu-'"+x2+"',keyongyue=keyongyue-'"+x2+"' where kahao='"+x1+"'"; 
   int n=statement.executeUpdate(sql1);
   out.print("更新成功");
  }
  
  }
  
  
  else { out.print("该银行卡不存在"); }
 
    
    statement.close();
     statement1.close();
    conn.close();
   }catch(SQLException e)
{e.printStackTrace();}
 }
  else out.print("不是10位数字！");
 
}
else  out.print("首位数字不是2！");
   }
else  
   {
       out.print("格式错误！");
   }  

%>

    
        
        
    </body>
</html>
