<%@ page pageEncoding="GBK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML lang=gb2312>
  <HEAD>
		<link rel="icon" href="style/base/favicon.ico" type="image/x-icon">
			<link rel="stylesheet" href="style/base/jw.css" type="text/css" media="all">
				<link rel="stylesheet" href="style/standard/jw.css" type="text/css" media="all">
					<script language="javascript">
			    function MmCheck(){
			       var obj=document.getElementById("TextBox3")
			       var obj1=document.getElementById("TextBox4")
			       if (!obj.value.equals(obj1.value)){
			          alert("�����������벻һ����");
			          return false;
			       }
			       
			       
			    }
			    function Email_Changed(){
					var obj = document.getElementById("TextBox8");
					str=obj.value;
	              
					var reg = /^[1-9]([0-9]{16}|[0-9]{13})[xX0-9]$/g;
					var r = str.match(reg);
		             
					if(r==null){
							alert("���֤�Ų��Ϸ���");
							return false;
					}
				}
					</script
					>
					
					<script language=javascript>
	ratingMsgs = new Array(6);
   ratingMsgColors = new Array(6);
   barColors = new Array(6);
   ratingMsgs[0] = "��";
   ratingMsgs[1] = "��";
   ratingMsgs[2] = "��";
   ratingMsgs[3] = "ǿ";
    ratingMsgs[4] = "ǿ";
    ratingMsgs[5] = "δ����"; //��������޷�����״��
   ratingMsgColors[0] = "#aa0033";
   ratingMsgColors[1] = "#aa0033";
   ratingMsgColors[2] = "#f5ac00";
   //ratingMsgColors[3] = "#6699cc";
   ratingMsgColors[3] = "#093";
   ratingMsgColors[4] = "#093";
  ratingMsgColors[5] = "#676767";
   barColors[0] = "#aa0033";
   barColors[1] = "#aa0033";
   barColors[2] = "#ffcc33";
   //barColors[3] = "#6699cc";
   barColors[3] = "#093";
   barColors[4] = "#093";
   barColors[5] = "#676767";
   var che=0;
   var min_passwd_len = 6; 
   function CreateRatePasswdReq(pwd) {
     if (!isBrowserCompatible) {
       return;
     }
       
   // if(!document.getElementById) return false;
   // var pwd = document.getElementById("xkl");
     if(!pwd) return false; 
     passwd=pwd.value;
     if (passwd.length < min_passwd_len)   {
       if (passwd.length > 0) {
         DrawBar(0);
       } else {
         ResetBar();
       }
     } else {
     //�ڳ��ȼ��󣬼��������ɸ��Ӷ�
       rating = checkPasswdRate(passwd);
       che=rating;
       DrawBar(rating);

     }
   }

  function getElement(name) {
    if (document.all) {
      return document.all(name);
    }
    return document.getElementById(name);
  }

  function DrawBar(rating) {
    var posbar = getElement('posBar');
    var negbar = getElement('negBar');
    var passwdRating = getElement('passwdRating');
    var barLength = getElement('passwdBar').width;
    if (rating >= 0 && rating <= 4) { //We successfully got a rating
      if (rating == 0) {
        posbar.style.width = barLength / 4 + "px";
        negbar.style.width = barLength / 4 * (3 - rating) + "px";
      } else {
        posbar.style.width = barLength / 4 * rating + "px";
        negbar.style.width = barLength / 4 * (4 - rating) + "px";
      }
    } else {
      posbar.style.width = "0px";
      negbar.style.width = barLength + "px";
      rating = 5; // Not rated Rating
    }
    posbar.style.background = barColors[rating];
    passwdRating.innerHTML = "<font color='" + ratingMsgColors[rating] +
                             "'>"
        + ratingMsgs[rating] + "</font>";
  }

  //Resets the password strength bar back to its initial state without any message showing.
  function ResetBar() {
    var posbar = getElement('posBar');
    var negbar = getElement('negBar');
    var passwdRating = getElement('passwdRating');
    var barLength = getElement('passwdBar').width;
    posbar.style.width = "0px";
    negbar.style.width = barLength + "px";
    passwdRating.innerHTML = "";
  }
  /* Checks Browser Compatibility */
  var agt = navigator.userAgent.toLowerCase();
  var is_op = (agt.indexOf("opera") != -1);
  var is_ie = (agt.indexOf("msie") != -1) && document.all && !is_op;
  var is_mac = (agt.indexOf("mac") != -1);
  var is_gk = (agt.indexOf("gecko") != -1);
  var is_sf = (agt.indexOf("safari") != -1);
  function gff(str, pfx) {
    var i = str.indexOf(pfx);
    if (i != -1) {
      var v = parseFloat(str.substring(i + pfx.length));
      if (!isNaN(v)) {
        return v;
      }
    }
    return null;
  }
  function Compatible() {
    if (is_ie && !is_op && !is_mac) {
      var v = gff(agt, "msie ");
      if (v != null) {
        return (v >= 6.0);
      }
    }
    if (is_gk && !is_sf) {
      var v = gff(agt, "rv:");
      if (v != null) {
        return (v >= 1.4);
      } else {
        v = gff(agt, "galeon/");
        if (v != null) {
          return (v >= 1.3);
        }
      }
    }
    if (is_sf) {
      var v = gff(agt, "applewebkit/");
      if (v != null) {
        return (v >= 124);
      }
    }
    return false;
  }

  /* We also try to create an xmlhttp object to see if the browser supports it */
  var isBrowserCompatible = Compatible();

  //CharMode���� 
  //����ĳ���ַ���������һ��. 
  function CharMode(iN) {
    if (iN >= 48 && iN <= 57) //���� 
      return 1;
    if (iN >= 65 && iN <= 90) //��д��ĸ 
      return 2;
    if (iN >= 97 && iN <= 122) //Сд 
      return 4;
    else
      return 8; //�����ַ� 
  }
  //bitTotal���� 
  //�������ǰ���뵱��һ���ж�����ģʽ 
  function bitTotal(num) {
    var modes = 0;
    for (i = 0; i < 4; i++) {
      if (num & 1)
        modes++;
      num >>>= 1;
    }
    return modes;
  }
  //checkStrong���� 
  //���������ǿ�ȼ��� 
  function checkPasswdRate(sPW) {
    if (sPW.length < min_passwd_len)
      return 0; //����̫�� 
    var Modes = 0;
    for (i = 0; i < sPW.length; i++) {
      //����ÿһ���ַ������ͳ��һ���ж�����ģʽ. 
      Modes |= CharMode(sPW.charCodeAt(i));
    }
    che=Modes;
    return bitTotal(Modes);
  }


	</script>
</HEAD>

	<body>
		<form name="Form1" method="post" action="mmxg.aspx?xh=B12110926&amp;gnmkdm=N121502" id="Form1">
<input type="hidden" name="__VIEWSTATE" value="dDwxMDIyOTMyNDk0Ozs+Uv8u7gyGkHQ8FbZola4r+gZyvpo=" />

			<!-- �๦�ܲ����� -->
			<!-- ������ʾ����ʼ -->
			<div class="main_box">
				<div class="mid_box">
					<div class="title">
						<p>

							<!-- ��ѯ�õ�����������ʾ���� -->
						</p>
					</div>
					<!-- From���� -->
					<span class="formbox">
						<div id="div1">
							<TABLE class="formlist" id="Table1" style=" WIDTH:500px" align="center">
								<TR>
									<TD align=right><span id="Label1">�û�����</span></TD>

									<TD><input name="TextBox1" type="text" value="B12110926" readonly="readonly" id="TextBox1" disabled="disabled" class="text_nor" /></TD>
								</TR>
								
								
								<TR>
									<TD align=right><span id="Label2">����ԭ���룺</span></TD>
									<TD><input name="TextBox2" type="password" id="TextBox2" class="text_nor" /></TD>
								</TR>
								<TR class="trbg1">
									<TD align=right><span id="Label3">���������룺</span></TD>

									<TD>
									<div style="FLOAT: left">	
									<input name="TextBox3" type="password" id="TextBox3" class="text_nor" onkeyup="CreateRatePasswdReq(this);" />
									</div>
								<div style="PADDING-LEFT: 10px;FLOAT: left">												
													<table cellSpacing=0 cellPadding=0 border=0 style="FLOAT: left" >													
															
															<tr>
																<td >
																	<table id=passwdBar cellSpacing=0 cellPadding=0 width=120  style="FLOAT: left"
																		bgColor=#ffffff border=0>
																		<tbody>

																			<tr>
																				<td id=posBar width=0% bgColor=#e0e0e0 height=10></td>
																				<td id=negBar width="100%" bgColor=#e0e0e0 height=10></td>
																			</tr>
																		</tbody>
																	</table>
																																
																</td>																
															</tr>														
														
													</table>											
								</div>

								<div  style="PADDING-LEFT: 10px;FLOAT: left;PADDING-TOP: 6px" id="passwdRating"></div>	
									</TD>
								</TR>
								<TR>
									<TD align=right><span id="Label4">ȷ�������룺</span></TD>
									<TD>
									
									<input name="Textbox4" type="password" id="Textbox4" class="text_nor" />
									
									
									</TD>
								</TR>

								<TR class="trbg1">
									
									<TD align=center colspan=2><input type="submit" name="Button1" value="��  ��" id="Button1" class="button" onclick="return MmCheck();" /></TD>
								</TR>
								
								<TR>
									<TD colSpan="2"></TD>
								</TR>
							</TABLE>							
						</div>
					</span>
					<div class="footbox">
						<em class="footbox_con">
							<span class="pagination"></span>
							<span class="footbutton"></span>
							<!-- �ײ���ťλ�� -->
						</em>
					</div>
				</div>

			</div>
			<!-- ������ʾ������ -->
		</form>
	</body>
</HTML>
