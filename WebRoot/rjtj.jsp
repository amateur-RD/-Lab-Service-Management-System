<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.admin.bean.Tools"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.io.*"%>
<%@ include file="conn.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:directive.page import="org.apache.commons.fileupload.disk.*"/>
<jsp:directive.page import="org.apache.commons.fileupload.*"/>
<jsp:directive.page import="org.apache.commons.fileupload.servlet.*"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<script language="javascript">
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BootStrap  Demo</title>
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
  <form class="bs-docs-example form-horizontal" action="rjtj.jsp" method="post" enctype="multipart/form-data" >   
  <table class="table table-bordered">
              <tbody>            
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">1</td>
                  <td width="15%">�������</td>
                  <td width="30%"><input type="text" name="rjmc" required/></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">2</td>
                  <td width="15%">�������</td>
                  <td width="30%"><select name="rjlx" required>
                  <option value="���" selected>���</option>
                  <option value="���ݿ�" selected>���ݿ�</option>
                  <option value="ͼ�δ���" selected>ͼ�δ���</option>
                  <option value="�칫���" selected>�칫���</option>                  
                  <option value="��Ƶ����" selected>��Ƶ����</option>
                  <option value="��Ϸ����" selected>��Ϸ����</option>
                  <option value="��ʱͨѶ" selected>��ʱͨѶ</option>
                  <option value="ϵͳ����" selected>ϵͳ����</option>
                  <option value="��ȫ���" selected>��ȫ���</option>              
                  <option value="��ѧ���" selected>��ѧ���</option>
                  <option value="��ý�����" selected>��ý�����</option></select>
                  </td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">3</td>
                  <td width="15%" height="78">���ʹ��˵��</td>
                  <td width="30%"><textarea name="rjsysm" rows="10" cols="30" required></textarea></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">4</td>
                  <td width="15%">�ϴ�ʹ�ý̳��ĵ�</td>
                  <td width="30%"><input type="file" name="upfile" border=��1��/></td>
                </tr>
                 <tr><td colspan="3">
            <ul class="pager">
              <li><input type="submit" value="����"></li>&nbsp;&nbsp;<li><input type="reset" value="����"></li>
            </ul>
          </td></tr>
              </tbody>
         </table>    
     <%
     response.setCharacterEncoding("UTF-8");
     request.setCharacterEncoding("UTF-8");
     //���ж��Ƿ����ļ��ϴ�����enctype="multipart/form-data"
     boolean isFileUpload = ServletFileUpload.isMultipartContent(request);
//������ļ��ϴ�����
     if(isFileUpload){
//�õ��ļ��ϴ�����
	FileItemFactory factory = new DiskFileItemFactory();
	//�����ļ��ϴ�������
	ServletFileUpload fileUpload = new ServletFileUpload(factory);
	//�����ļ��ϴ���ı����ʽ
	fileUpload.setHeaderEncoding("UTF-8");
	// �������� :  FileItem���� ע��: ÿһ������ ��Ӧһ�� FileItem����(��װ)List<FileItem> fileItemList = fileUpload.parseRequest(request);
	Iterator items; 
	items = fileUpload.parseRequest(request).iterator();   
	//�õ��������ĸ�·��
	String rootPath = request.getRealPath("/");
	//����fileItemList
			//�õ��ļ���
	String fileName =null;
	String a="3",b="3",c="3";
	while (items.hasNext()) {
	     FileItem item = (FileItem) items.next();   
		//�������ı������ļ����͵�
		if(!item.isFormField()){
		//�õ��ı����valueֵ���� ·��+�ļ���
		String value = item.getName();
		//�õ��ϴ����ļ�����
        //String fileType = fileName.substring(fileName.lastIndexOf("."));
        fileName = new java.util.Date().getTime()+"";
		//ָ���ļ����·��
		String realPath = rootPath+"/"+"upload";
		//�����ļ���ŵ�Ŀ¼��ע�� Ŀ¼Ҳ���ļ�
		File file = new File(realPath);
		//���Ŀ¼������
		if(!file.isDirectory()){
			//�����ļ��ϴ�Ŀ¼
			file.mkdirs();
		}
		File newFile = new File(realPath+"/"+fileName);
		//��newFile�ļ���д������
		item.write(newFile);
		}else{
		if("rjmc".equals(item.getFieldName())){
		    a=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8").trim();
		    }
		if("rjlx".equals(item.getFieldName())){
		    b=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8").trim();
		   }
		if("rjsysm".equals(item.getFieldName())){
		    c=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8").trim();
		 }
      }
      }
      int rtn=stmt.executeUpdate("insert into soft(sname,stype,sinstruction,sfile) values('"+a+"','"+b+"','"+c+"','"+fileName+"')");
      out.print("<script>alert('��ӳɹ���');window.location='1rjxx.jsp';</script>");
      }
     %>
     </body>
     </html>
