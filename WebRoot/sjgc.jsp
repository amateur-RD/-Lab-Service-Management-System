<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.admin.bean.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date,java.text.*"%>
<script src="layer/jquery-1.11.1.min.js"></script>
<script src="layer/layer.min.js"></script>
<script language="javascript" >
<%  
   Date date = new Date(); 
   SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
   String today = df.format(date); 
  %>
function sjtj()
{ document.form1.action="sjtj.jsp";
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
<link rel="stylesheet" type="text/css" href="css1/info.css">

</head>

<body>
<form name="form1" method="post" >
<%@include file="conn.jsp" %>
<%
String name=(String)session.getAttribute("username1");
session.setAttribute("name1",name); 
String sql1="select  count(*) as total from event";
ResultSet rs1=stmt.executeQuery(sql1);
rs1.next();
int total=rs1.getInt("total"); 
String sql="select  eventid,request.reqdescribe,event.solution,event.perior,event.state,event.type,event.time,event.username,event.reqid from event,request where event.reqid=request.reqid";
ResultSet rs=stmt.executeQuery(sql);
rs.last();
String type1=(String)session.getAttribute("type1");
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
                <td width="94%" valign="bottom"><span class="STYLE1">�¼��㳡</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              <input type="hidden" name="code" value="OK">
              <input type="checkbox" name="checkboxall" onclick=sel('checkboxrj') >
              ȫѡ      &nbsp;&nbsp;
              <input type="image" src="images/add.gif" width="10" height="10" onClick="sjtj()"> ���   &nbsp;
              <input type="image" src="images/del.gif" width="10" height="10" onClick="sjsc();" > ɾ��   &nbsp;&nbsp;
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
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >�¼����</div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >�¼�����</div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >�������</div></td>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >���ȼ�</div></td>
        <td width="7%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >�¼�״̬</div></td>
        <td width="7%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >�¼�����</div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center'>�Ǽ�ʱ��</div></td>
        <td width="7%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >������</div></td>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >����</div></td>
      </tr>
      <tr>

        
<% 
if(total!=0){
 while (i<pageSize &&!rs.isAfterLast())
{
        String eventid=rs.getString(1);
        String description=rs.getString(2);
        String username1=rs.getString(8);
        String solution=rs.getString(3);
        String perior=rs.getString(4);
        String state =rs.getString(5);
        String time =rs.getString(7);
        String type =rs.getString(6);
        if(state.equals((String)"�ѽ��"))
        {
        state="<font color=red><strong>"+state+"</strong></font>";
        }       
        if(perior.equals((String)"��")&&state.equals((String)"δ���"))
        {
        perior="<font color=#00FF00>"+perior+"</font>";
        } 
        if(perior.equals((String)"��")&&state.equals((String)"δ���"))
        {
        perior="<font color=#0090F8>"+perior+"</font>";
        }
%>
<tr><td height="20" bgcolor="#FFFFFF"><div align="center"><input type="checkbox" name="checkboxrj"  value=<%=eventid%>></div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> <a href="javascript:openLogin(<%=eventid %>);"><%=eventid %></a></div></td> 
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;'  onmouseover='changeTitle(this)'><font title=" <%=description%>"><%=description%></font></div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;'  onmouseover='changeTitle(this)'><font title=" <%=solution%>"><%=solution%></font>  </div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> <%=perior%></div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> <%=state%></div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> <%=type%></div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> <%=time%></div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> <%=username1%></div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE6'><div align='center'><span class='STYLE21'><%if(type1.equals("����Ա")||type1.equals("����")){ %><a href="sjbj.jsp?id=<%=eventid%>">�༭</a><%} else{%>�༭<%} %></span></div></td></tr>
<% 
rs.next();
i++;
}
rs.close();}
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
{out.println("<td class='STYLE22'><div align='center'><a href=sjgc.jsp?list_notice="+ (list_notice+1) +"  height='15'>[��һҳ]</div></td></a>") ;}                   
if(list_notice > 1)
{out.println("<td class='STYLE22'><div align='center'><a href=sjgc.jsp?list_notice="+ (list_notice-1) +"  height='15'>[��һҳ]</div></td></a>") ;}
out.println("<td class='STYLE22'><div align='center'><a href=sjgc.jsp?list_notice="+1+"  height='15'>����ҳ��</div></td></a>") ;
out.println("<td class='STYLE22'><div align='center'><a href=sjgc.jsp?list_notice="+pageCount+"  height='15'>��βҳ��</div></td></a>") ;
%>
            <td width="37" class="STYLE22"><div align="center">ת��</div></td>
            <td width="22"><div align="center">
              <input type="text" name="list_notice" id="list_notice"  style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">ҳ</div></td>
            <td width="30" class="STYLE22"><input type="button" onClick="rjzd();" value="ȷ��" width="20" height="15" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>

<div id=win style="display:none; POSITION:absolute; left:50%; top:50%; width:300px; height:200px; margin-left:-300px; margin-top:-200px; border:1px solid #888; background-color:#E9F3FC;">
<input type="image" src="images/fanhui.gif" width="20" height="20" onClick="closeLogin()"  class="btns" style="right:0px;">
<form  name="form" action="sjgc.jsp" method="post">
<table>
<tr><td width="15%"><input id=bbb type="hidden" name="eventid" value="aaa" style="background-color:#E9F3FC;">�������</td>
                  <td width="30%"><textarea  name="jjff" style="width:200px;height:78px;"></textarea></td></tr> 
<tr><td width="15%" >���ʱ��</td>
                  <td width="30%"><input type="text" name="evedate" value="<%=today%>" required></td></tr>             
    <tr><td colspan="3" align="center">  
                      
<input type="submit" value="������"></td></tr>
</table>
</form>
<script language="javascript" >
function openLogin(id)
{document.getElementById("bbb").value=id;
document.getElementById("win").style.display="";
//document.write(id); 

}
function closeLogin()
{document.getElementById("win").style.display="none";}
</script>
 
 <%
 String jjff=Tools.toChinese(request.getParameter("jjff"));
 String eventid=request.getParameter("eventid");
 String evedate=request.getParameter("evedate");
 String code=request.getParameter("code");
 if(type1.equals("����Ա")||type1.equals("����")){
  if(code!=null)
 {
 String[] id=request.getParameterValues("checkboxrj"); 

   if(id==null)
   {%> <script>alert("��ѡ��Ҫɾ���Ķ���");window.location="sjgc.jsp";</script> <%}
   else{
       for(int j=0;j<id.length;j++)
       {
   int rtn=stmt.executeUpdate("delete from event where eventid="+id[j]+"");
       }
%> <script>alert("ɾ���ɹ���");window.location="sjgc.jsp";</script> 
<%    } 
}
if(eventid!=null)
{
int rtn1=stmt.executeUpdate("update event set state='�ѽ��' where eventid="+eventid+"");
int rtn2=stmt.executeUpdate("update event set solution='"+jjff+"' where eventid="+eventid+"");
int rtn3=stmt.executeUpdate("delete request where '"+eventid+"' =(select event.eventid from request,event where event.reqid=request.reqid");
int rtn4=stmt.executeUpdate("insert into knowledge(description,solve,time,name) select request.reqdescribe,event.solution,event.time,event.username from request,event where request.reqid=event.reqid and eventid="+eventid+" AND event.state='�ѽ��'");

%> <script>alert("����ɹ���");window.location="sjgc.jsp";</script> <%}}else{%> <script>alert("�Բ�����û�����Ȩ�ޣ�");window.location="1rjxx.jsp";</script> <%}
%>
</body>
 

