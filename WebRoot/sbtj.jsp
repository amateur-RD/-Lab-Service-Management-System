<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.admin.bean.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="conn.jsp"%>
<%@ page import="java.util.Date,java.text.*"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
</head>
<body>
  <%  
   Date date = new Date(); 
   SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
   String today = df.format(date); 
  %>
  <form class="bs-docs-example form-horizontal" action="sbtj.jsp">   
  <table class="table table-bordered">
              <tbody>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">1</td>
                  <td width="15%">�豸�ɣ�</td>
                  <td width="30%"><input type="text" name="sbid" required></td>
                </tr>
                
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">2</td>
                  <td width="15%">�豸����</td>
                  <td width="30%"><input type="text" name="sbmc" required></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">3</td>
                  <td width="15%">�豸����</td>
                  <td width="30%"><select type="text" name="sblx" style="width:120px;" required>
                  <option value="PC">PC</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
                  <option value="ͶӰ��">ͶӰ��</option>
                  <option value="����ʵ�����">����ʵ�����</option>
                  </select>
                  </td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">4</td>
                  <td width="15%" height="78">�豸ϸ��</td>
                  <td width="30%"><textarea  name="sbxj" style="width:500px;height:78px;"></textarea></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">5</td>
                  <td width="15%" >ʱ��</td>
                  <td width="30%"><input type="time" name="sj" value="<%=today%>" required></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">6</td>
                  <td width="15%">�豸����</td>
                  <td width="30%"><input type="number" name="sbsl" style="width:60px;" required></td>
                </tr>
                  <tr><td colspan="3">
            <ul class="pager">
              <li><input type="submit" value="����"></li>&nbsp;&nbsp;
              <li><input type="reset" value="����"></li>
            </ul>
          </td></tr>
              </tbody>
         </table>    
         </form>
         <%
         response.setCharacterEncoding("gbk");
         request.setCharacterEncoding("gbk");
         String sbid=request.getParameter("sbid");
         String sbmc=Tools.toChinese(request.getParameter("sbmc"));
         String sblx=Tools.toChinese(request.getParameter("sblx"));
         String sbxj=Tools.toChinese(request.getParameter("sbxj"));
         String sj=Tools.toChinese(request.getParameter("sj"));
         String sbsl=Tools.toChinese(request.getParameter("sbsl"));
         if(sbid!=null)
         {
         int rtn=stmt.executeUpdate("insert into equipment(eqid,eqname,eqtype,eqdetail,eqtime,eqnum) values('"+sbid+"','"+sbmc+"','"+sblx+"','"+sbxj+"','"+sj+"','"+sbsl+"')");
         String sql1="select  count(*) as total from equipment";
         out.print("<script>alert('��ӳɹ���');window.location='1sbxx.jsp';</script>");
         }
          %>
     </body>
