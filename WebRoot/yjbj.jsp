<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<link rel="stylesheet" type="text/css" href="css1/bootstrap-responsive.min.css">
<link rel="stylesheet" type="text/css" href="css1/bootstrap.min.css">
<script src="js1/jquery.js"></script>
<script src="js1/bootstrap.min.js"></script>
<style type="text/css">
/* ������ʽ S */
body{margin:20px 20px 20px 20px}
h1, h2, h3, .masthead p, .subhead p, .marketing h2, .lead {font-family: "Helvetica Neue",Helvetica,Arial,"Microsoft Yahei UI","Microsoft YaHei",SimHei,"����",simsun,sans-serif;font-weight: normal;}
/* ������ʽ E */
/* ����դ��ϵͳʾ������ʽ S */
.show-grid [class*="span"] {
    background-color: #EEEEEE;
    border-radius: 3px 3px 3px 3px;
    line-height: 40px;
    min-height: 40px;
    text-align: center;
}
.show-grid {
    margin-bottom: 20px;
    margin-top: 10px;
}
.show-grid [class*="span"]:hover {
    background-color: #DDDDDD;
}
.show-grid [class*="span"] [class*="span"] {
    background-color: #CCCCCC;
}
.show-grid .show-grid [class*="span"] {
    margin-top: 5px;
}
.show-grid [class*="span"] [class*="span"] [class*="span"] {
    background-color: #999999;
}
/* ����դ��ϵͳʾ������ʽ E */
/* ���ڱ�����ʽ S */
.bs-docs-example:after {
    background-color: #F5F5F5;
    border: 1px solid #DDDDDD;
    border-radius: 4px 0 4px 0;
    color: #9DA0A4;
    content: "�����Ϣ";
    font-size: 12px;
    font-weight: bold;
    left: -1px;
    padding: 3px 7px;
    position: absolute;
    top: -1px;
}
form.bs-docs-example {
    padding-bottom: 19px;
}
.bs-docs-example {
    background-color: #FFFFFF;
    border: 1px solid #DDDDDD;
    border-radius: 4px 4px 4px 4px;
    margin: 15px 0;
    padding: 39px 19px 14px;
    position: relative;
}
.bs-docs-example-submenus .dropup > .dropdown-menu, .bs-docs-example-submenus .dropdown > .dropdown-menu {
    display: block;
    margin-bottom: 5px;
    position: static;
}
.bs-docs-example-submenus {
    min-height: 180px;
}
/* ���ڱ�����ʽ E */
</style>
<%@include file="zbrconn.jsp" %>
<%
String id=request.getParameter("id");
session.setAttribute("id",id);

Class.forName(driverClass);
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt = conn.createStatement();
String sql="select  * from hardsoft where hsid="+id+"";
ResultSet rs=stmt.executeQuery(sql);
rs.next();
String hsid=rs.getString("hsid");
String eqid=rs.getString("eqid");
String locid=rs.getString("locid");
String hsnumber=rs.getString("hsnumber");
String hsip=rs.getString("hsip");
String hsstate=rs.getString("hsstate");
%>     
  <form class="bs-docs-example form-horizontal" action="yjbjh.jsp">   
  <table class="table table-bordered">
              <tbody>
                
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">1</td>
                  <td width="15%">�豸ID</td>
                  <td width="30%"><input type="text" name="sbid" value="<%=eqid %>"></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">2</td>
                  <td width="15%">λ��ID</td>
                  <td width="30%"><input type="text" name="wzid" value="<%=locid %>"></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">3</td>
                  <td width="15%" height="78">Ӳ�����</td>
                  <td width="30%"><input type="text" name="yjbh"  value="<%=hsnumber %>"></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">4</td>
                  <td width="15%" height="78">Ӳ��IP</td>
                  <td width="30%"><input type="text" name="yjip" value="<%=hsip %>"></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">5</td>
                  <td width="15%" height="78">Ӳ��״̬</td>
                  <td width="30%"><input type="text" name="yjzt" value="<%=hsstate %>"></td>
                </tr>
                  <tr><td colspan="3">
            <ul class="pager">
              <li><input type="submit" value="����"></li>&nbsp;&nbsp;
              <li><input type="reset" value="����"></li>
              <input type="hidden" name="id"  value="<%=id %>">
            </ul>
          </td></tr>
              </tbody>
         </table>    
         </form>
     
