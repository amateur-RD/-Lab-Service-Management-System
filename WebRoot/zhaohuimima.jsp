<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%@ page import="com.admin.bean.Tools"%>
<html>
<head>
<LINK href="css/Default.css" type=text/css rel=stylesheet>
<title>�һ�����</title>
<style type="text/css">
/* formbox */
.wrong{width:200px;height:20px;line-height:20px;padding-left:30px;background:url(images/error_20100904.gif) no-repeat;position:absolute;font-size:12px;}
.right{width:100px;height:20px;position:absolute;background:url(images/ok_20100904.gif) no-repeat;}
</style>
</head>
<body>
<center><br><br>
<br><h1>�һ�����</h1><hr><br>
<a href="login.jsp" ><font color="blue" size="3">���ص�½����</font></a><br><br>
<form method="post" action="zhaohuimima.jsp">
��&nbsp;��&nbsp;����<input type="text" name="userName" action-data="text=����������¼ʱ���û���"><br><br>��&nbsp;&nbsp;&nbsp;&nbsp;�䣺<input type="text" name="Mail"><br><br>
��&nbsp;&nbsp;&nbsp;&nbsp;����<input type="text" name="Name"><br>
<br>
<input type="submit" value="�ύ">
<input type="reset" value="����">
</form>
<script type="text/javascript">
// ����ʾ��
var checkobj={
	userName:"userName",   //��֤���ĺ���
	mail:"Mail" ,    //��֤��ֵ
	chinese:"Name",
}
XformCheck(document.forms[0],checkobj);
test();
/*
descript : XformCheck;
author   : popper.w
date     : 2008-6-22
@pram xfromElement ��Ҫ����form����
@pram checkobj ������Ҫ������
Ĭ����mail���ʼ���ַ����phone���ֻ���̶��绰����num�����֣���chinese�����֣���empty���Ƿ�Ϊ�գ���length�����ȣ���url��url��ַ�Ϸ����ȼ��
//���磺���ĳһ��nameΪ"xxx"��Ҫ���email��ʽ�����checkobj�����{mail:"xxx"}����������Ǽ���Ƿ�Ϊ�գ���ֱ�����{xxx,"xxx"}����*/
function XformCheck(xfromElement,checkobj){
	var om={};
	if(checkobj){
		om=checkobj
	}
	if(!xfromElement){
		return false;
	}
		for(var o in checkobj){
			xfromElement[checkobj[o]].onblur=function(e){
				e=window.event||e;
				var eSrc=e.srcElement||e.target;
				var Xvalue=trim(this.value);
				if(isEmpty(Xvalue)){
					ShowMes(eSrc,"�����Ϊ��","wrong");
				}else{
					switch(this.name){
						case om.chinese:
					if(!isChinese(Xvalue)){
						ShowMes(eSrc,"��������Ϊ����","wrong");
					}else{
						ShowMes(eSrc,"","right");
				}
				break;
				case om.mail:
					if(!isEmail(Xvalue)){
						ShowMes(eSrc,"�����ַ����ȷ","wrong");
					}else{
						ShowMes(eSrc,"","right");
				}
				break;
				case om.length :
				if(!isProperLen(Xvalue)){
					ShowMes(eSrc,"���Ȳ���ȷ","wrong");
				}else{
					ShowMes(eSrc,"","right");
				}
				break;   
				default :
					ShowMes(eSrc,"","right")
			}
			}
	}
}
/*�ж�Ϊ��*/
function isEmpty(o){
	return o==""?true:false;
}
/*�ж��Ƿ�Ϊ���ʳ��� 6-32 λ*/
function isProperLen(o){
	var len=o.replace(/[^\x00-\xff]/g,"11").length;
	if(len>20||len<6){
		return false;
	}else{
		return true;
	}
}
function isChinese(o){
	var reg=/^[\u4E00-\u9FA5]+$/;
	return reg.test(o);
}
/*ȥ���հ��ַ�*/
function trim(str){
	return str.replace(/(^\s*)|(\s*$)/g, "");
}
function ShowMes(o,mes,type){
	if(!o.ele){
		var Xmes=document.createElement("div");
		document.body.appendChild(Xmes);
		o.ele=Xmes;
	}
	o.ele.className=type;
	o.ele.style.display="block";
	o.ele.style.left=(XgetPosition(o).x+220)+"px";
	o.ele.style.top=XgetPosition(o).y+"px";
	o.ele.innerHTML=mes;
	}
}
function XgetPosition(e){
	var left = 0;
	var top  = 0;
	while(e.offsetParent){
		left += e.offsetLeft;
		top  += e.offsetTop;
		e= e.offsetParent;
	}
	left += e.offsetLeft;
	top  += e.offsetTop;
	return {
		x:left, y:top
	};
}
</script>
<%
String name=request.getParameter("userName");
if(name!=null)
{%><%@ include file="conn.jsp"%><% 
int i=0;
String h1="";
String h2="";
String h3="";
String mail=request.getParameter("Mail");
String name2=Tools.toChinese(request.getParameter("Name"));
Class.forName(driverClass);
ResultSet rs=stmt.executeQuery("select *from user");
while(rs.next()) {
if(name.equals(rs.getString("userid")))
{
i=1;
h1=rs.getString("email");
h2=rs.getString("username");
if(name2.equals(h2)&&mail.equals(h1))
{
%>
<script language="javascript">window.alert("�����һسɹ�������<%=rs.getString("password")%>");</script>
<a href="login.jsp">���ص�½</a><%
break;}
}
}
if(i==1){
if(!name2.equals(h2)){%>
<script language="javascript">window.alert("������ע��ʱ��ͬ��");</script><%}
if(!mail.equals(h1)){%>
<script language="javascript">window.alert("������ע��ʱ��ͬ��");</script><%}
}
if(i==0){%>
<script language="javascript">window.alert("�û��������ڣ�");</script><%}
stmt.close();
conn.close();
}
%>
</center>
</body>
</html>