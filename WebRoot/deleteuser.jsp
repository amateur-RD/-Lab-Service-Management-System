<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%@ include file="conn.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="javascript" >
function yjss()
{ document.form1.action="yjss.jsp";
document.form1.submit();}
function yjtj()
{ document.form1.action="yjtj.jsp";
document.form1.submit();}
function yjsc()
{ document.form1.action="1yjxx.jsp";
document.form1.submit();}
function yjzd()
{ document.form1.action="yjzd.jsp";
document.form1.submit();} 
function yjssh()
{
var sbid=document.getElementById("sbid").value;
var locname=document.getElementById("sysmc").value;
var yjbh=document.getElementById("yjbh").value;
var yjip=document.getElementById("yjip").value;
var yjzt=document.getElementById("yjzt").value;
if(sbid==""&&locname==""&&yjbh==""&&yjip==""&&yjzt=="")
 {
 alert("�������ѯ����");
}
 else{ 
 document.form1.action="yjssh.jsp";
 document.form1.submit();}
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
function HandleOnClose() {  
var close = confirm("ȷ���뿪��");  
if (close) 
{    window.open("right.jsp");  }
else{window.event;} 
 return message;
 }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>�ޱ����ĵ�</title>
<link rel="stylesheet" href="css1/info.css" type="text/css"/>
</head>

<body onLoad="HandleOnClose();">
<%
String sql="select count(*) as total from user where type='����Ա' or type='����'";
ResultSet rs=stmt.executeQuery(sql);
rs.next();
int total=rs.getInt("total");
String sql1="select * from user where type='����Ա' or type='����'";
ResultSet rs2=stmt.executeQuery(sql1);
rs2.last();
String type=(String)session.getAttribute("type1");
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
rs2.absolute(posion);         //ѭ����ʾ���е����� pageSize(ÿҳ����ʾ�ļ�¼)               
//rs.isAfterLast() �α��Ƿ������һ��֮�� ˵�������Ѿ�û��¼              
int i=0;  
 %>hjfhgfgdfg
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> ������Ա������Ϣ�б�</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              <input type="checkbox" name="checkbox11" id="checkbox11" />
              ȫѡ      &nbsp;&nbsp;<img src="images/add.gif" width="10" height="10" /> ���   &nbsp; <img src="images/del.gif" width="10" height="10" /> ɾ��    &nbsp;&nbsp;<img src="images/edit.gif" width="10" height="10" /> �༭   &nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" name="checkbox" id="checkbox" onclick=sel('checkboxrj')/>
        </div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�û���</span></div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�û���ɫ</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">��ϵ��ʽ</span></div></td>
        <td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">����</span></div></td>
        <td width="27%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">��ϸ����</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">��������</span></div></td>
      </tr>
      <%
      if(total!=0){
      while(!rs2.isAfterLast()&&i<pageSize){ %>
      <tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="checkbox2" id="checkbox2" value="<%=rs2.getString("userid") %>"/>
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><span class="STYLE19"><%=rs2.getString("username") %></span></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=rs2.getString("type") %></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=rs2.getString("telephone") %></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=rs2.getString("email") %></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">�û����Զ�ϵͳ�����в������й���...</div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE21"><%if(type.equals("����")){ %><a href="deleteuser.jsp?id=<%=rs2.getString("userid")%>">ɾ�� </a>|<%} %><a href="userinfo.jsp?id=<%=rs2.getString("userid")%>">�鿴</a></div></td>
      </tr>
    </td>
  </tr><%
  i++;
  rs2.next();
  }
  }
   %></table>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%"><div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;����<strong> <%=total %></strong> ����¼����ǰ��<strong> 1</strong> ҳ���� <strong>10</strong> ҳ</span></div></td>
        <td width="67%"><table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <% 
if(list_notice < pageCount)
{out.println("<td class='STYLE22'><div align='center'><a href=1yjxx.jsp?list_notice="+ (list_notice+1) +"  height='15'>[��һҳ]</div></td></a>") ;}                   
if(list_notice > 1)
{out.println("<td class='STYLE22'><div align='center'><a href=1yjxx.jsp?list_notice="+ (list_notice-1) +"  height='15'>[��һҳ]</div></td></a>") ;}
out.println("<td class='STYLE22'><div align='center'><a href=1yjxx.jsp?list_notice="+1+"  height='15'>����ҳ��</div></td></a>") ;
out.println("<td class='STYLE22'><div align='center'><a href=1yjxx.jsp?list_notice="+pageCount+"  height='15'>��βҳ��</div></td></a>") ;
%>
            <td width="37" class="STYLE22"><div align="center">ת��</div></td>
            <td width="22"><div align="center">
              <input type="text" name="textfield" id="textfield"  style="width:25px; height:16px; font-size:12px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">ҳ</div></td>
            <td width="30" class="STYLE22"><input type="button" onClick="action();" value="ȷ��" width="20" height="15" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
 </form>
</body>
</html>
