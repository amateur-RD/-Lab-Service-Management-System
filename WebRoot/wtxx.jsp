<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*"%>
<script language="javascript" >
function wtss()
{ document.form1.action="wtss.jsp";
document.form1.submit();}
function wttj()
{ document.form1.action="wttj.jsp";
document.form1.submit();}
function wtsc()
{ document.form1.action="wtxx.jsp";
document.form1.submit();}
function wtzd()
{ document.form1.action="wtzd.jsp";
document.form1.submit();}
function checkAll()
{
   for(var i=0;i<document.test.checkboxrj.length;i++)
   {
      document.test.checkboxrj[i].checked = true;
   }
}
function uncheckAll()
{
   for(var i=0;i<document.test.checkboxrj.length;i++)
   {
       document.test.checkboxrj[i].checked = false;
    }  
}  
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




<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>�ޱ����ĵ�</title>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE7 { overflow:hidden; text-overflow:ellipsis;color: #000000; font-size: 12;}
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>
</head>
<html>
<body>
<form name="form1" method="post" >
<%@include file="conn.jsp" %>
<% 
String sql1="select  count(*) as total from problem";
ResultSet rs1=stmt.executeQuery(sql1);
rs1.next();
int total=rs1.getInt("total"); 
String sql="select  * from problem ";
ResultSet rs=stmt.executeQuery(sql);
rs.last();

int pageSize=15;
int pageCount=(total+pageSize-1)/pageSize;
int list_notice=1;//��ǰҳ
String goToPage = request.getParameter("textfield");
if (goToPage == null)
{goToPage = "1"; } 
try{list_notice= Integer.parseInt(goToPage);}
catch (NumberFormatException ex){list_notice = 1;}
if(list_notice <=1)
{list_notice = 1; }
else if(list_notice >= pageCount)
{list_notice =  pageCount;}        
int posion = (list_notice -1 ) * pageSize + 1;         //�����α��λ��,�α��λ�� (��ǰҳ - 1) * ҳ���С + 1                   
rs.absolute(posion);         //ѭ����ʾ���е����� pageSize(ÿҳ����ʾ�ļ�¼)               
//rs.isAfterLast() �α��Ƿ������һ��֮�� ˵�������Ѿ�û��¼              
int i=0;  

%>   

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="table-layout:fixed">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> ������Ϣ��</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
            <input type="hidden" name="code" value="OK">
              <input type="checkbox" name="checkboxall" onclick=sel('checkboxrj') />
              ȫѡ      &nbsp;&nbsp;
              <input type="image" src="images/add.gif" width="10" height="10" onClick="wttj()"> ���   &nbsp; 
              <input type="image" src="images/del.gif" width="10" height="10" onClick="wtsc();" > ɾ��   &nbsp;&nbsp;
              <input type="image" src="images/edit.gif" width="10" height="10" onClick="wtss()"> ����   &nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" style="table-layout:fixed">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" name="checkboxall2" onclick=sel('checkboxrj') />
        </div></td>
        <td width="6%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">����ID</span></div></td>
        <td width="9%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�ύ������</span></div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�ύʱ��</span></div></td>
        <td width="9%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">ʵ��������</span></div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�������</span></div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">ϵͳ����</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">����Ӳ�����</span></div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">����״̬</span></div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">��������</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�������</span></div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">����</span></div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">����</span></div></td>
      </tr>
      <tr>

        
<% 
 while (i<pageSize && !rs.isAfterLast())
{
        String proid=rs.getString("proid");
        String userid=rs.getString("userid");
        String prodate=rs.getString("prodate");
        String locname=rs.getString("locname");
        String softname=rs.getString("softname");
        String sysname=rs.getString("sysname");
        String hsnumber=rs.getString("hsnumber");
        String prostate=rs.getString("prostate");        
        String type=rs.getString("type");
        String prophenomenon=rs.getString("prophenomenon");
        String prosolution=rs.getString("prosolution");
out.print("<tr><td height='20' bgcolor='#FFFFFF'><div align='center'><input type='checkbox' name='checkboxrj'  value='"+proid+"'></div></td>");
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+proid+"</div></td>");
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+userid+"</div></td>");   
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+prodate+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+locname+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+softname+" </div></td>");
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+sysname+" </div></td>");   
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+hsnumber+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+prostate+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+type+" </div></td>");
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+prosolution+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+prophenomenon+" </div></td>");  

%>
<td height='20' bgcolor='#FFFFFF' class='STYLE6'><div align='center'><span class='STYLE21'><a href="wtbj.jsp?id=<%=proid%>">�༭</a></span></div></td></tr>
<% 
rs.next();
i++;
}
rs.close();
 %>
  </table></td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%"><div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;����<strong><%=total%> </strong> ����¼����ǰ��<strong> <%=list_notice%></strong> ҳ���� <strong><%=pageCount%></strong> ҳ</span></div></td>
        <td width="67%"><table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
<% 
if(list_notice < pageCount)
{out.println("<td class='STYLE22'><div align='center'><a href=wtxyy.jsp?list_notice="+ (list_notice+1) +"  height='15'>[��һҳ]</div></td></a>") ;}                   
if(list_notice > 1)
{out.println("<td class='STYLE22'><div align='center'><a href=wtsyy.jsp?list_notice="+ (list_notice-1) +"  height='15'>[��һҳ]</div></td></a>") ;}
out.println("<td class='STYLE22'><div align='center'><a href=wtsy.jsp?list_notice="+1+"  height='15'>����ҳ��</div></td></a>") ;
out.println("<td class='STYLE22'><div align='center'><a href=wtwy.jsp?list_notice="+pageCount+"  height='15'>��βҳ��</div></td></a>") ;
%>
            <td width="37" class="STYLE22"><div align="center">ת��</div></td>
            <td width="22"><div align="center">
              <input type="text" name="textfield" id="textfield"  style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">ҳ</div></td>
            <td width="35"><input type="button" onClick="wtzd();" value="ȷ��" width="26" height="15" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
 </form>
 <%
 String code=request.getParameter("code");
 if(code!=null){
 String[] id=request.getParameterValues("checkboxrj"); 

if(id==null)
{%> <script>alert("��ѡ��Ҫɾ���Ķ���");window.location="wtxx.jsp";</script> <%}
else{
for(int j=0;j<id.length;j++)
{
   int rtn=stmt.executeUpdate("delete from problem where proid="+id[j]+"");
}
%> <script>alert("ɾ���ɹ���");window.location="wtxx.jsp";</script> <%
} 
}
  %>
</body>
</html>