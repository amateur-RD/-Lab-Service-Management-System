<%@ page language="java" import="java.util.*" pageEncoding="GBK" %>
<!doctype html> 
<html>
<head>  
<title>��ʱ��ҳ��������</title> 
</head> 
<body> 
<script> 
var t=5;//�趨��ת��ʱ�� 
setInterval("refer()",1000); //����1�붨ʱ 
function refer(){ 
if(t==0){ 
location="login.jsp"; //#�趨��ת�����ӵ�ַ 
} 
document.getElementById('show').innerHTML="����ҳ�泤ʱ��δ������"+t+"�����ת����½ҳ��,"; // ��ʾ����ʱ 
t--; // �������ݼ� 
//����ת�ԣ� 
}
</script> 
<span id="show"></span> 
</body>
</html>
