<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.admin.bean.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="conn.jsp"%>
<%@ page import="java.util.Date,java.text.*"%>
<script language="javascript" >
function sjtj()
{ document.form1.action="sjtj.jsp";
document.form1.submit();}
function sjsc()
{ document.form1.action="sjsc.jsp";
document.form1.submit();}
function sel(a)
{
  o=document.getElementsByName(a)
  for(i=0;i<o.length;i++)
  o[i].checked=event.srcElement.checked
 }
 function changeTitle(obj){
 if(obj.offsetWidth>obj.parentElement.offsetWidth){
  obj.title=obj.innerText;
 }else{
  obj.title="";
 }
}
</script>
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
   SimpleDateFormat df = new SimpleDateFormat("yy/MM/dd HH:mm:ss"); 
   String today = df.format(date); 
  %>
  <%String name=(String)session.getAttribute("name1"); %>
  <form class="bs-docs-example form-horizontal" action="sjtj.jsp">   
  <table class="table table-bordered">
              <tbody>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">1</td>
                  <td width="10%">�¼�����</td>
                  <td width="30%"><textarea  name="sjms" style="width:400px;height:78px;"></textarea></td>
                </tr>  
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">2</td>
                  <td width="10%">�������</td>
                  <td width="30%"><textarea  name="jjff" style="width:400px;height:78px;"></textarea></td>
                </tr>  
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">3</td>
                  <td width="10%">���ȼ�</td>
                  <td width="30%"><select type="text" name="yxj" style="width:400px;" required>
                  <option value=" "> </option>
                  <option value="��">��</option>
                  <option value="��">��</option>
                  <option value="��">��</option></select>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">4</td>
                  <td width="10%">�¼�״̬</td>
                  <td width="30%"><select type="text" name="sjzt" style="width:400px;" required>
                  <option value=" "> </option>
                  <option value="�ѵǼ�">�ѵǼ�</option>
                  <option value="�ѽ��">�ѽ��</option></select>
                </tr>  
                 <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">5</td>
                  <td width="10%">�¼�����</td>
                  <td width="30%"><select type="text" name="sjlx" style="width:400px;" required>
                  <option value=" "> </option>
                  <option value="�칫�豸">�칫�豸</option>
                  <option value="�칫���">�칫���</option>
                  <option value="�������">�������</option></select>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">6</td>
                  <td width="10%" >�Ǽ�ʱ��</td>
                  <td width="30%"><input type="text" name="djsj" style="width:400px;" value="<%=today%>" required></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">7</td>
                  <td width="10%" >������</td>
                  <td width="30%"><input type="text" name="clr" style="width:400px;" value="<%=name%>" required></td>
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
         String djsj=request.getParameter("djsj");
         String type=(String)session.getAttribute("type1");
         if(type.equals("����Ա")||type.equals("����")){
         if(djsj!=null)
         { 
         String clr=Tools.toChinese(request.getParameter("clr")); 
         String sjms=Tools.toChinese(request.getParameter("sjms"));
         String jjff=Tools.toChinese(request.getParameter("jjff"));
         String yxj=Tools.toChinese(request.getParameter("yxj"));
         String sjzt=Tools.toChinese(request.getParameter("sjzt"));  
         String sjlx=Tools.toChinese(request.getParameter("sjlx"));        
         int rtn=stmt.executeUpdate("insert into event(username,solution,describe,perior,state,time,type) values('"+clr+"','"+jjff+"','"+sjms+"','"+yxj+"','"+sjzt+"','"+djsj+"','"+sjlx+"')");
         out.print("<script>alert('��ӳɹ���');window.location='sjgc.jsp';</script>");
         }
         }{out.print("<script>alert('�Բ�����û�����Ȩ�ޣ�');window.location='1rjxx.jsp';</script>");}
       
         %> 
     </body>
     </html>
