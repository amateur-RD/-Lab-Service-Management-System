<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date,java.text.*"%>
<%@ page import="com.admin.bean.Tools" %>
<%@ include file="conn.jsp" %>
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

  <form class="bs-docs-example form-horizontal" action="apply.jsp">   
  <table class="table table-bordered">
              <tbody>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">1</td>
                  <td width="15%">��������</td>
                  <td width="30%"><select type="text" name="locname" required>
                  <option value="A��">A��</option>
                  <option value="B��">B��</option>
                  <option value="D��">D��</option>
                  <option value="M��">M��</option>
                  <option value="����չ����">����չ����</option></td>
                </tr>
                 <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">2</td>
                  <td width="15%">����ʹ������</td>
                  <td width="30%"><input type="date" name="time" required/>              
                  </td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">3</td>
                  <td width="15%">�γ̽ڴ�</td>
                  <td width="30%"><select name="jieci">
                  <option value="1,2��">1,2��</option>
                  <option value="1,2,3��">1,2,3��</option>
                  <option value="3,4��">3,4��</option>
                  <option value="3,4,5��">3,4,5��</option>
                  <option value="����">����</option>
                  <option value="5,6��">5,6��</option>
                  <option value="7,8��">7,8��</option>
                  <option value="����">����</option>
                  <option value="10,11��">10,11��</option>
                  <option value="10,11,12��">10,11,12��</option>                  
                  </td>
                </tr>
               <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">4</td>
                  <td width="15%">�γ�</td>
                  <td width="30%"><input type="text" name="course" required/>              
                  </td>
                </tr>
                  <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">5</td>
                  <td width="15%">������</td>
                  <td width="30%"><input type="text" name="username" required/>              
                  </td>
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
            Date date = new Date(); 
            SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
            String today = df.format(date); 
            String username1=request.getParameter("username");
            if(username1!=null){
            String locname=Tools.toChinese(request.getParameter("locname"));
            String time=Tools.toChinese(request.getParameter("time"));
            String jieci=Tools.toChinese(request.getParameter("jieci"));
            String course=Tools.toChinese(request.getParameter("course"));
            int rtn=stmt.executeUpdate("insert into labuse(locname,time,applytime,jieci,course,username,state) values('"+locname+"','"+time+"','"+today+"','"+jieci+"','"+course+"','"+Tools.toChinese(username1)+"','��ԤԼ')");
            out.print("<script>alert('����ɹ���');window.location='search.jsp';</script>");
            }
            %>
         </html>
     
