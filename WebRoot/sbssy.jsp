<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<%!
public String codeToString(String str)
{
String s=str;
try
{
byte tempB[]=s.getBytes("ISO-8859-1");
s=new String(tempB);
return s;
}
catch(Exception e)
{
return s;
}
}%>
<%
String id=(String)session.getAttribute("id");
String sbmc=(String)session.getAttribute("sbmc");
String sblx=(String)session.getAttribute("sblx");
String sbxj=(String)session.getAttribute("sbxj");
String sj=(String)session.getAttribute("sj");
String sbsl=(String)session.getAttribute("sbsl");
session.setAttribute("id",id);
session.setAttribute("sbmc",sbmc);
session.setAttribute("sblx",sblx);
session.setAttribute("sbxj",sbxj);
session.setAttribute("sj",sj);
session.setAttribute("sbsl",sbsl);
%>
<script language="javascript" >
function sbss()
{ document.form1.action="sbss.jsp";
document.form1.submit();}
function sbtj()
{ document.form1.action="sbtj.jsp";
document.form1.submit();}
function sbsc()
{ document.form1.action="sbsc.jsp";
document.form1.submit();}
function sbsszd()
{ document.form1.action="sbsszd.jsp";
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

<body>
<form name="form1" method="post" >
<%@include file="zbrconn.jsp" %>
<% 


Class.forName(driverClass);
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt = conn.createStatement();
String sql1=new String("");
if(id==null&&sbmc==null&&sblx==null&&sbxj==null&&sj==null&&sbsl==null)
sql1="select  count(*) as total from equipment ";
if(id!=null)
sql1="select  count(*) as total from equipment where eqid like '%"+id+"%'";
if(sbmc!=null)
{
if(id!=null)
sql1=sql1.concat("  and eqname like '%"+sbmc+"%'");
else
sql1=sql1.concat("  where eqname like '%"+sbmc+"%'");
}
if(sblx!=null)
{
if(!(id==null&&sbmc==null))
sql1=sql1.concat("  and eqtype like '%"+sblx+"%'");
else
sql1=sql1.concat("  where eqtype like '%"+sblx+"%'");
}
if(sbxj!=null)
{
if(!(id==null&&sbmc==null&&sblx==null))
sql1=sql1.concat(" and eqdetail like '%"+sbxj+"%'");
else
sql1=sql1.concat(" where eqdetail like '%"+sbxj+"%'");
}
if(sj!=null)
{
if(!(id==null&&sbmc==null&&sblx==null&&sbxj==null))
sql1=sql1.concat("  and eqtime like '%"+sj+"%'");
else
sql1=sql1.concat("  where eqtime like '%"+sj+"%'");
}
if(sbsl!=null)
{
if(!(id==null&&sbmc==null&&sblx==null&&sbxj==null&&sj==null))
sql1=sql1.concat("  and eqnum like '%"+sbsl+"%'");
else
sql1=sql1.concat("  where eqnum like '%"+sbsl+"%'");
}
ResultSet rs1=stmt.executeQuery(sql1);
rs1.next();
int total=rs1.getInt("total"); 
String sql=new String("");
if(id==null&&sbmc==null&&sblx==null&&sbxj==null&&sj==null&&sbsl==null)
sql="select * from equipment ";
if(id!=null)
sql="select * from equipment where eqid like '%"+id+"%'";
if(sbmc!=null)
{
if(id!=null)
sql=sql.concat("  and eqname like '%"+sbmc+"%'");
else
sql=sql.concat("  where eqname like '%"+sbmc+"%'");
}
if(sblx!=null)
{
if(!(id==null&&sbmc==null))
sql=sql.concat("  and eqtype like '%"+sblx+"%'");
else
sql=sql.concat("  where eqtype like '%"+sblx+"%'");
}
if(sbxj!=null)
{
if(!(id==null&&sbmc==null&&sblx==null))
sql=sql.concat(" and eqdetail like '%"+sbxj+"%'");
else
sql=sql.concat(" where eqdetail like '%"+sbxj+"%'");
}
if(sj!=null)
{
if(!(id==null&&sbmc==null&&sblx==null&&sbxj==null))
sql=sql.concat("  and eqtime like '%"+sj+"%'");
else
sql=sql.concat("  where eqtime like '%"+sj+"%'");
}
if(sbsl!=null)
{
if(!(id==null&&sbmc==null&&sblx==null&&sbxj==null&&sj==null))
sql=sql.concat("  and eqnum like '%"+sbsl+"%'");
else
sql=sql.concat("  where eqnum like '%"+sbsl+"%'");
}
ResultSet rs=stmt.executeQuery(sql);
rs.last();

int pageSize=15;
int pageCount=(total+pageSize-1)/pageSize;
int list_notice=1;//��ǰҳ
String goToPage = request.getParameter("list_notice");
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
<%if(total==0&&!(id==null&&sbmc==null&&sblx==null&&sbxj==null&&sj==null&&sbsl==null)) 
{response.sendRedirect("sbss.jsp?sb=0");
 }else{ %>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="table-layout:fixed">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1">�豸��Ϣ��</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              <input type="checkbox" name="checkboxall" onclick=sel('checkboxrj') >
              ȫѡ      &nbsp;&nbsp;
              <input type="image" src="images/add.gif" width="10" height="10" onClick="sbtj()"> ���   &nbsp; 
              <input type="image" src="images/del.gif" width="10" height="10" onClick="sbsc();" > ɾ��   &nbsp;&nbsp;
              <input type="image" src="images/edit.gif" width="10" height="10" onClick="sbss()"> ����   &nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce"  style="table-layout:fixed">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" name="checkboxall2" onclick=sel('checkboxrj') />
        </div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >�豸ID</div></td>
        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >�豸����</div></td>
        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >�豸����</div></td>
        <td width="25%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >�豸ϸ��</div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >ʱ��</div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >�豸����</div></td>
         <td width="8%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >����</div></td>
      </tr>
      <tr>

        
<% 
 while (i<pageSize && !rs.isAfterLast())
{
        String eqid=rs.getString("eqid");
        String eqname=rs.getString("eqname");
        String eqtype=rs.getString("eqtype");
        String eqdetail=rs.getString("eqdetail");
        String eqtime=rs.getString("eqtime");
        String eqnum=rs.getString("eqnum");       
 
out.print("<tr><td height='20' bgcolor='#FFFFFF'><div align='center'><input type='checkbox' name='checkboxrj'  value='"+eqid+"'></div></td>");
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+eqid+" </div></td>");   
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+eqname+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+eqtype+" </div></td>"); 
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+eqdetail+" </div></td>");   
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+eqtime+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+eqnum+" </div></td>"); 

%>
<td height='20' bgcolor='#FFFFFF' class='STYLE6'><div align='center'><span class='STYLE21'><a href="sbbj.jsp?id=<%=eqid%>">�༭</a></span></div></td></tr>
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
{out.println("<td class='STYLE22'><div align='center'><a href=sbssy.jsp?list_notice="+ (list_notice+1) +"  height='15'>[��һҳ]</div></td></a>") ;}                   
if(list_notice > 1)
{out.println("<td class='STYLE22'><div align='center'><a href=sbssy.jsp?list_notice="+ (list_notice-1) +"  height='15'>[��һҳ]</div></td></a>") ;}
out.println("<td class='STYLE22'><div align='center'><a href=sbssy.jsp?list_notice="+1+"  height='15'>����ҳ��</div></td></a>") ;
out.println("<td class='STYLE22'><div align='center'><a href=sbssy.jsp?list_notice="+pageCount+"  height='15'>��βҳ��</div></td></a>") ;
%>
            <td width="37" class="STYLE22"><div align="center">ת��</div></td>
            <td width="22"><div align="center">
              <input type="text" name="textfield" id="textfield"  style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">ҳ</div></td>
            <td width="30" class="STYLE22"><input type="button" onClick="sbsszd();" value="ȷ��" width="20" height="15" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
 </form>
</body>
<%}%>