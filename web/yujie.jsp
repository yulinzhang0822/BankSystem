<%-- 
    Document   : xinyongedu
    Created on : 2018-6-9, 11:21:14
    Author     : 10407
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>信用卡4</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <h1>预借现金!</h1>
            <input type="button" name="submit" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick="javascript:history.back(-1);"value="返回上一页">   
   <form action="yujie2.jsp"method="post"name="frmmain">
       请输入信用卡卡号：
       <input type="text" name="a3"/>
       <br>
       请输入信用卡密码：   
       <input type="password" name="a5"/>
       <br>
       请输入预借的额度：    
          <input type="text" name="a4"/>
          <br>
       
       <input type="submit" value="确定" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
       </form>
  <br>         
   <input type="button" value="更改密码" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick="window.location.href='yujie3.jsp';"/>
    </body>
</html>
