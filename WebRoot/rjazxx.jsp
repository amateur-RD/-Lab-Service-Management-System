<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<script language="javascript" >
function rjazss()
{ document.form1.action="rjazss.jsp";
document.form1.submit();}
function rjaztj()
{ document.form1.action="rjaztj.jsp";
document.form1.submit();}
function rjazsc()
{ document.form1.action="rjazsc.jsp";
document.form1.submit();}
function rjazzd()
{ document.form1.action="rjazzd.jsp";
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
<%@include file="conn.jsp" %>
<% 
String sql1="select  count(*) as total from softinstall";
ResultSet rs1=stmt.executeQuery(sql1);
rs1.next();
int total=rs1.getInt("total"); 
String sql="select  * from softinstall ";
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

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="table-layout:fixed">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> �����װ��Ϣ��</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              <input type="checkbox" name="checkboxall" onclick=sel('checkboxrj') >
              ȫѡ      &nbsp;&nbsp;
              <input type="image" src="images/add.gif" width="10" height="10" onClick="rjaztj()"> ���   &nbsp; 
              <input type="image" src="images/del.gif" width="10" height="10" onClick="rjazsc();" > ɾ��   &nbsp;&nbsp;
              <input type="image" src="images/edit.gif" width="10" height="10" onClick="rjazss()"> ����   &nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
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
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >��ϢID</div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >Ӳ��ID</div></td>
        <td width="17%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >ϵͳID</div></td>
        <td width="16%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >���ID</div></td>
        <td width="18%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >��װʱ��</div></td>
        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >�û�ID</div></td>
        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >����</div></td>
      </tr>
      <tr>

        
<% 
if(total!=0){
 while (i<pageSize && !rs.isAfterLast())
{
        String infoid=rs.getString("infoid");
        String hsid=rs.getString("hsid");
        String sysid=rs.getString("sysid");
        String sid=rs.getString("sid");
        String time=rs.getString("time");
        String userid=rs.getString("userid");
        
 
out.print("<tr><td height='20' bgcolor='#FFFFFF'><div align='center'><input type='checkbox' name='checkboxrj'  value='"+infoid+"'></div></td>");
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+infoid+" </div></td>");   
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+hsid+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+sysid+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+sid+" </div></td>"); 
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+time+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+userid+" </div></td>"); 

%>
<td height='20' bgcolor='#FFFFFF' class='STYLE6'><div align='center'><span class='STYLE21'><a href="rjazbj.jsp?id=<%=infoid%>">�༭</a></span></div></td></tr>
<% 

rs.next();
i++;
}
rs.close();
}
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
{out.println("<td class='STYLE22'><div align='center'><a href=rjazxx.jsp?list_notice="+ (list_notice+1) +"  height='15'>[��һҳ]</div></td></a>") ;}                   
if(list_notice > 1)
{out.println("<td class='STYLE22'><div align='center'><a href=rjazxx.jsp?list_notice="+ (list_notice-1) +"  height='15'>[��һҳ]</div></td></a>") ;}
out.println("<td class='STYLE22'><div align='center'><a href=rjazxx.jsp?list_notice="+1+"  height='15'>����ҳ��</div></td></a>") ;
out.println("<td class='STYLE22'><div align='center'><a href=rjazxx.jsp?list_notice="+pageCount+"  height='15'>��βҳ��</div></td></a>") ;
%>
            <td width="37" class="STYLE22"><div align="center">ת��</div></td>
            <td width="22"><div align="center">
              <input type="text" name="textfield" id="textfield"  style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">ҳ</div></td>
            <td width="30" class="STYLE22"><input type="button" onClick="rjazzd();" value="ȷ��" width="20" height="15" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
 </form>
</body>
