<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.camp_us.dto.MemberVO" %>

<head>
	
<!-- Summernote -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>

</head>

<style>
.btnw {
	padding: 10px 16px;
	border: none;
	background-color: #2EC4B6;
	color: white;
	border-radius: 4px;
	font-size: 18px;
	text-align: center;
	cursor: pointer;
	font-weight: 600;
}

.btnw:hover {
	background-color: #22A99C;
}

.badgec {
	width: 30px;
	height: 23px;
	font-size: 12px;
	font-weight: 700;
	line-height: 22px;
	text-align: center;
	vertical-align: baseline;
	border-radius: 0.375rem;
}

.bg-primaryc {
	background-color: #2EC4B6; /* Bootstrap 기본 파란색 */
	color: #fff;
}

.cardc {
	word-wrap: break-word;
	margin-bottom: 10px
}
.mailbox-subjectc {
  width: 230px;
}
.card-primaryc {
  border-top: 3px solid #2EC4B6;
}
.btn-primaryc {
  color: #fff;
  background-color: #2EC4B6;
  border-color: #2EC4B6;
}

.btn-primaryc:hover {
  color: #fff;
  background-color: #22A99C;
  border-color: #22A99C;
}

.btn-primaryc:focus, .btn-primary.focus {
  box-shadow: 0 0 0 0.2rem rgba(0,123,255,.5);
}

.btn-primaryc.disabled, .btn-primaryc:disabled {
  background-color: #2EC4B6;
  border-color: #2EC4B6;
  opacity: 0.65;
}
.table-hover tbody tr:hover {
  background-color: #EAF5F4 !important; /* 민트색 배경 예시 */
  cursor: pointer; /* 커서 손가락으로 */
}
.selected  {
  background-color: #EAF5F4 !important; /* 민트색 배경 예시 */
}
.mailR{
	background-color: transparent;
	
}
.mailR:hover{
	background-color: #EAF5F4;
	overflow: hidden;
	font-weight: bold;
}
.mailR.active{
	background-color: #EAF5F4;
	font-weight: bold;
}
.mailT{
	background-color: transparent;
}
.mailT:hover span{
	font-weight:bold;
	overflow: hidden;
	color: #22A99C;
}
.mailT.active{
	font-weight:bold;
	overflow: hidden;
	color: #22A99C;
}
</style>


<div style="height: 900px; padding: 15px;">
	<div>
		<span
			style="display: block; font-size: 20pt; font-weight: bold; margin-bottom: 18px; margin-left: 5px">
			메일</span>
	</div>
	<div class="row" style="display:flex; flex-direction: row;">
	<!-- 카테고리 시작 -->
		<%@ include file="/WEB-INF/views/message/category.jsp" %>
	<!-- 카테고리 끝 -->
			<!-- /.card -->
		<div class="col-md-10 " style="margin-left:auto;" >
            <div class="card card-primaryc card-outline" style="height: 810px;">
              <div class="card-header" style="height:50px">
                <span class="card-title" style="font-weight:700;">메일 보내기</span>
                <div class="float-right">
                  <button type="reset" class="btn btn-default" style="height: 35px; margin-top:-5px; line-height: 5px"
                  onclick="closeWrite()"><i class="fas fa-times"></i>&nbsp;&nbsp;창닫기</button>
                  <button type="submit" class="btn btn-primary"
                  style="height: 33px; margin-top:-5px; line-height: 5px; background-color:#2EC4B6; border: 1px solid #2EC4B6"
                  onclick="regist_go()"><i class="far fa-envelope"></i> &nbsp;&nbsp;보내기</button>
                </div>
              </div>
              <!-- /.card-header -->
              <form role="form" method="post" action="<%=request.getContextPath()%>/message/regist" name="registForm" enctype="multipart/form-data">
	              <div class="card-body">
	                <div class="form-group" style="display: flex; flex-direction: row;">
	                  <span style="display:block; width:8%; line-height:32px">받는 사람</span>
	                  <input type="text" title="받는 사람" id="mail_receiver" name="mail_receiver"
	                  	class="form-control notNull" placeholder="받는 사람을 입력해주세요.">
	                </div>
	                <div class="form-group" style="display: none;">
	                  <span style="display:block; width:8%; line-height:32px">보내는 사람</span>
	                  <input type="hidden" title="보내는 사람" id="mail_sender" name="mail_sender"
	                  	class="form-control notNull" placeholder="받는 사람을 입력해주세요." readonly value="${sessionScope.loginUser.mem_id}">
	                </div>
	                <div class="form-group" style="display: flex; flex-direction: row;">
	                  <span style="display:block; width:8%; line-height:32px">제목</span>
	                  <input type="text" title="제목" id="mail_name" name="mail_name" 
	                  	class="form-control notNull" placeholder="제목을 입력해주세요.">
	                </div>
	                <div class="form-group">
						<textarea class="textarea" name="mail_desc" id="mail_desc" rows="30"
							cols="90" placeholder="1000자 내외로 작성하세요." ></textarea>
					</div>
					<div style="display: flex; flex-direction: row;">
		                <div class="form-group" >
		                  <div id="addFileBtn" class="btn btn-default btn-file" onclick="addFile_go();" type="file" type="file" name="attachment"
		                  style="width:130px; height: 50px; line-height: 25px">
		                    <i class="fas fa-paperclip"></i>
		                    <h5 style="display:inline;line-height:40px;">&nbsp;&nbsp;파일등록</h5>
		                  </div>
		                </div>
		                <div class="fileInput"></div>
	                </div>
	              </div>
              </form>
              <!-- /.card-body -->
           </div>
           <!-- /.card -->
         </div>
    </div>
</div>

<script>
var dataNum=0;

function addFile_go(){
	//alert("!!!!");
	if($('input[name="uploadFile"]').length >=5){
		alert("파일추가는 5개까지만 가능합니다.");
		return;
	}
	
	let div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
	let input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
	let button = "<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>";

	div.append(input).append(button);
	$('.fileInput').append(div);
	
	dataNum++;
}

function remove_go(num){
	$('div[data-no="'+num+'"]').remove();
}

$('.fileInput').on('change',"input[name='uploadFile']",function(event){
	if(this.files[0].size > 1024*1024*40){
		alert("첨부파일크기는 40MB 이하만 가능합니다.");
		this.value="";				
	}
});

</script>

<script>
Summernote_go($("textarea#mail_desc"),"<%=request.getContextPath() %>") ;
</script>

<script>
function regist_go(){
	//alert("click regist btn");
	if($("input[name='title']").val()==""){ 
		alert("제목은 필수입니다.");
		$("input[name='title']").focus();
		return;
	}
	
	var inputs = $('input[name="uploadFile"]');
	for(var input of inputs){
		if(input.value==""){
			input.disabled=true;
		}
	}
	
	$("form[role='form']").submit();
	
}
</script>
</body>
