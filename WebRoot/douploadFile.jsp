<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:directive.page import="org.apache.commons.fileupload.disk.*"/>
<jsp:directive.page import="org.apache.commons.fileupload.*"/>
<jsp:directive.page import="org.apache.commons.fileupload.servlet.*"/>
<jsp:directive.page import="java.io.File"/>
<%
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
	// �������� :  FileItem���� ע��: ÿһ������ ��Ӧһ�� FileItem����(��װ)
	List<FileItem> fileItemList = fileUpload.parseRequest(request);
	//�õ��������ĸ�·��
	String rootPath = request.getRealPath("/");
	//����fileItemList
	for(FileItem item: fileItemList){
		//�������ı������ļ����͵�
		if(!item.isFormField()){
		//�õ��ı����valueֵ���� ·��+�ļ���
		String value = item.getName();
		//�õ��ļ���
		String fileName = value.substring(value.lastIndexOf("\\")+1);
		//�õ��ϴ����ļ�����
        //String fileType = fileName.substring(fileName.lastIndexOf("."));
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
		}
		}
		
	}
%>