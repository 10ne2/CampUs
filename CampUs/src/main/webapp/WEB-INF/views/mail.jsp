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
	<div class="row">
		<div class="col-md-2" style="width:250px">
			<a class="btnw btn-primary btn-block mb-3" style="width:width:250px" onclick="mailWrite()">메일
				작성</a>
			<div class="cardc" style="width: width:250px; height: 70px">
				<div class="" style="width: 100%">
					<div
						style="width: 250px; display: flex; text-align: center; flex-direction: row; justify-content: center; gap:0px;">
						<button id="btnUnread" type="button" class="mailT" style="width: 100px; height: 70px; list-style: none; border:none;">
							<span style="display: block; text-align: center; font-size: 25px; color: #22A99C; font-weight: bold;">${unreadCount }</span>
							<span style="display: block; text-align: center; font-size: 15px">안읽음</span>
						</button>
						<button id="btnStar" type="button" class="mailT"
						style="width: 100px; height: 70px; text-align: center; list-style: none; border:none; margin-top:4px"
						onclick="location.href='<%=request.getContextPath()%>/mail/list4'">
							<img id="imgStar" src="<%=request.getContextPath()%>/resources/images/imp.png" style="width: 30px; margin: 0 0 5px -1px"></img>
								<span style="display: block; font-size: 15px">중요</span>
						</button>
						<button id="btnAtt" type="button" class="mailT" style="width: 100px; height: 70px; text-align: center; list-style: none; border:none; margin-top:4px">
							<img id="imgAtt" src="<%=request.getContextPath()%>/resources/images/att.png" style="width: 30px; margin: 0 0 5px -1px"></img>
								<span style="display: block; font-size: 15px">첨부</span>
						</button>
					</div>
				</div>
			</div>
			<div class="card">

				<div class="card-body p-0" style="width:250px !important">
					<ul class="nav flex-column" style="width:250px; height: 668px;">
						<li class="" style="height: 50px; ">
							<button id="btnAll" type="button" data-mail="1" class="d-flex align-items-center mailR"
							style="width: 100%; height: 100%; gap: 20px; line-height: 50px; border:none; padding:15px; overflow:hidden"
							onclick="location.href='<%=request.getContextPath()%>/mail/list'">
								<i class="fas fa-inbox" style=""></i>
								<span style="display: block;">전체 메일함</span>
							</button>
						</li>
						<li class="nav-item" style="height: 50px">
							<button id="btnRecv" type="button" data-mail="2" class="d-flex align-items-center mailR"
							style="width: 100%; height: 100%; gap: 20px; line-height: 50px; border:none; padding:15px"
							onclick="location.href='<%=request.getContextPath()%>/mail/list3'">
								<i class="far fa-envelope" style=""></i>
								<span style="display: block;">받은 메일함</span>
								<span id="unreadCount" class="badgec bg-primaryc" style="width:auto;display: block; margin-left: auto; padding: 0 5px 0 5px">${unreadCount}</span>
							</button>
						</li>
						<li class="nav-item" style="height: 50px; border-bottom: 1px solid #ddd;">
							<button id="btnSent" type="button" data-mail="3" class="d-flex align-items-center mailR"
							style="width: 100%; height: 100%; gap: 24px; line-height: 50px; border:none; padding:15px"
							onclick="location.href='<%=request.getContextPath()%>/mail/list2'">
							<i class="far fa-file-alt" style="margin-left:2px"></i>
							<span style="display: block;margin-left:-2px">보낸 메일함</span>
							</button>
						</li>
					</ul>
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->
			<!-- /.card -->
		</div>
		<!-- /.col -->
		<div class="col-md-3 mailList" style="display:block">
			<div class="card card-outline card-primaryc">
				<div class="card-header">
					<h3 class="card-title">목록</h3>
					<div class="card-tools">
						<div class="input-group input-group-sm">
							<input type="text" class="form-control" id="keyword" name="keyword"  placeholder="검색어를 입력해주세요." value="${pageMaker.keyword }">
							<div class="input-group-append">
								<div class="btn btn-primaryc" onclick="search_list(1)">
									<img src="<%=request.getContextPath()%>/resources/images/search.png" style="width: 15px; margin-bottom: 3px">
								</div>
							</div>
						</div>
					</div>
					<!-- /.card-tools -->
				</div>
				<!-- /.card-header -->
				<div class="card-body p-0">
					<div class="mailbox-controls">
						<!-- Check all button -->
						<button type="button"
							class="btn btn-default btn-sm checkbox-toggle" onclick="all_click()">
							<i class="far fa-square"></i>
						</button>
						<div class="btn-group">
							<button type="button" class="btn btn-default btn-sm" onclick="remove();">
								<i class="far fa-trash-alt"></i>
							</button>
						</div>
						<!-- /.btn-group -->
						<button type="button" class="btn btn-default btn-sm" onclick="refresh()">
							<i class="fas fa-sync-alt"></i>
						</button>
						
						<!-- /.float-right -->
					</div>
					<div class="table-responsive mailbox-messages"
						style="height: 660px; overflow-y: auto;">
						<table class="mailTable table table-hover">
							<tbody>
								<c:if test="${empty mailList }">
									<tr>
						   	   			<td colspan="5" class="text-center" >메일이 없습니다.</td>
						   	   		</tr>
							   </c:if>
							   <c:if test="${not empty mailList }">
							   	<c:forEach items="${mailList }" var="mail">
								<tr style="width: 100%; display: flex; flex-direction: column;" data-sender="${mail.mail_sender}" data-receiver="${mail.mail_receiver}"
									data-unread="${mail.mail_receiver == loginUser.mem_id and (mail.mail_read == '0')}" data-mail-id="${mail.mail_id}"
									data-star="${mail.mimp_id}" data-att=""
									onclick="loadDetail(${mail.mail_id}); toggleCheckbox(this); asRead(${mail.mail_id})">
									<td style="width: 100%; min-height: 63px; display: flex; flex-direction: column;">
										<div style="width:100%; display: flex; flex-direction: row;">
											<div class="icheck-primary" style="width:48px">
												<input type="checkbox" name="mail_id" value="${mail.mail_id}" id="check_${mail.mail_id}"> <label
													for="check_${mail.mail_id}"></label>
											</div>
											<div class="" style="">
											  <c:choose>
											    <c:when test="${mail.mread_id == 0}">
											      <img id="readImg_${mail.mail_id}" src="<%=request.getContextPath()%>/resources/images/nread.png"
											      style="width:20px; cursor:pointer"/>
											    </c:when>
											    <c:otherwise>
											      <img id="readImg_${mail.mail_id}" src="<%=request.getContextPath()%>/resources/images/read.png"
											      style="width:20px; cursor:pointer"/>
											    </c:otherwise>
											  </c:choose>
											</div>
											<div class="" style="width:150px; display:flex; flex-direction: row; margin-left:10px">
												<a style="line-height:30px;">
													${mail.mail_sender == sessionScope.loginUser.mem_id ? mail.receiver_name : mail.sender_name}
												</a>
												<a style="line-height:30px; margin-left:15px; font-size:14px; color: #999">
													${mail.mail_sender == sessionScope.loginUser.mem_id ? mail.mail_receiver : mail.mail_sender}
												</a>
											</div>
											<div class="mailbox-date" style="margin-left:auto; line-height:30px; font-size:12px; color: #bbb">
											 	<fmt:formatDate value="${mail.mail_sender == sessionScope.loginUser.mem_id ? mail.mail_rdate : mail.mail_sdate}" pattern="yy-MM-dd HH:mm" />
											</div>
										</div>
									</td>
									<td style="min-height: 55px; border:none; display: flex; flex-direction: row; margin-top:-25px">
										<div class="mailbox-subjectc" style=" margin-left:60px; overflow: hidden; text-overflow: ellipsis;">
											<a style="font-size:14px; color: #999">
												${mail.mail_sender == sessionScope.loginUser.mem_id ? "[보낸메일함]" : "[받은메일함]"}
											</a>
											<a style="font-size:14px;">${mail.mail_name }</a>
										</div>
										<div class="mailbox-star" style="margin-left: auto; ">
											<c:choose>
											    <c:when test="${mail.mimp_id == 0}">
											      <img id="starImg_${mail.mail_id}" src="<%=request.getContextPath()%>/resources/images/imp.png"
											      style="width:20px; cursor:pointer" onclick="starClick(${mail.mail_id})"/>
											    </c:when>
											    <c:otherwise>
											      <img id="starImg_${mail.mail_id}" src="<%=request.getContextPath()%>/resources/images/imp_act.png"
											      style="width:20px; cursor:pointer" onclick="starClick(${mail.mail_id})"/>
											    </c:otherwise>
											  </c:choose>
										</div>
									</td>
								</tr>
								</c:forEach>
								</c:if>
							</tbody>
						</table>
						<!-- /.table -->
					</div>
					<!-- /.mail-box-messages -->
				</div>
				<!-- /.card-body -->
				<div class="card-footer">
						<!-- pagination.jsp -->
							<div <%-- style="display:${not empty noticeList ? 'visible':'none' }; --%>">
								<%@ include file="/WEB-INF/views/module/pagination.jsp" %>	
							</div>	    			
	    				</div>	
			</div>
			<!-- /.card -->
		</div>
		<!-- /.col -->
		<div class="col-md-7 mailDetail" style="display:block">
			<div class="card card-primaryc card-outline mailDetailList" style="height: 810px; overflow-y: auto;">
				<div class="card-body p-0">
					<div class="mailListItem" data-mail_id="{{mail_id}}">
						<div class="mailbox-read-info" style="padding:15px">
							<div style="display: flex; flex-direction: row;">
								<h5 id="mailName" style="margin-bottom:15px; line-height: 35px">{{mail_name }}</h5>
								<span id="mailDate" class="mailbox-read-time float-right" style="display:block; width: 200px; margin-top:12px; margin-left:auto; text-align:right;">
									{{#ifEquals mail_sender loginUser}}{{prettifyDate mail_rdate}}{{else}}{{prettifyDate mail_sdate}}{{/ifEquals}}</span>
							</div>
							<div style="display: flex; flex-direction: row; margin-bottom: 10px">
								<span style="width: 80px; display:block; line-height: 28px">보낸 사람</span>
								<div style=" height: 30px; background-color: #DFFCF9; border-radius:15px; display: flex; flex-direction: row;">
									<span id="mailTargetName" style="display:block; margin-left:15px; line-height: 28px">
										{{#ifEquals mail_sender loginUser}}{{receiver_name}}{{else}}{{sender_name}}{{/ifEquals}}</span>
									<span id="mailTargetEmail" style="display:block; margin-left:15px; line-height: 28px; margin-right:15px">
										{{#ifEquals mail_sender loginUser}}{{receiver_email}}{{else}}{{sender_email}}{{/ifEquals}}</span>
								</div>
								<div style="margin-left:auto;">
									<button type="button" class="btn btn-default btn-sm" data-container="body" title="Delete" onclick="remove_detail();">
										<i class="far fa-trash-alt"></i>
									</button>
								</div>
							</div>
							<div style="display: flex; flex-direction: row;">
								<span style="width: 80px; display:block; line-height: 28px">받는 사람</span>
								<div style=" height: 30px; background-color: #DFFCF9; border-radius:15px; display: flex; flex-direction: row;">
									<span id="mailTargetName" style="display:block; margin-left:15px; line-height: 28px">
										{{#ifEquals mail_sender loginUser}}{{sender_name}}{{else}}{{receiver_name}}{{/ifEquals}}</span>
									<span id="mailTargetEmail" style="display:block; margin-left:15px; line-height: 28px; margin-right:15px">
										{{#ifEquals mail_sender loginUser}}{{sender_email}}{{else}}{{receiver_email}}{{/ifEquals}}</span>
								</div>
							</div>
						</div>
						<div id="mailDesc" class="mailbox-read-message" style="padding:15px">
							<div id="mail_desc"></div>
						</div>
					</div>
				</div>
				<div>
					{{#each mailFileList}}
						<div class="col-sm-4" style="cursor:pointer;" onclick="location.href='<%=request.getContextPath() %>/api/mail/getFile?mafile_no={{this.mafile_no}}';">
				   			<div class="info-box">
				    	 		<span class="info-box-icon bg-yellow"><i class="fa fa-copy"></i></span>
				      			<div class="info-box-content">
				     	 	  		<span class="info-box-number">{{splitFileName this.mafile_name 1}}</span>
				     			</div>
				  	 		</div>
				   		</div>
					{{/each}}
				</div>
				
			</div>
				<!-- /.card-footer -->
		</div>
			<!-- /.card -->
		<div class="col-md-10" style="margin-left:auto; display:none;" >
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
              <form role="form" method="post" action="<%=request.getContextPath()%>/mail/regist" name="registForm" enctype="multipart/form-data">
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

<%@ include file="/WEB-INF/views/mail/detail_js.jsp" %>

<form id="jobForm" style="display:none;">	
	<input type='text' name="page" value="1" />
	<input type='text' name="keyword" value="" />
	<input type='text' name="perPageNum" value="" />
</form>
<script>
function search_list(page){
	let keyword = document.querySelector('#keyword').value;
	let perPageNum = 7;
	let form = document.querySelector("#jobForm");
	
	//alert(perPageNum+":"+searchType+":"+keyword);
	
	form.keyword.value = keyword;
	form.page.value = page;
	form.perPageNum.value = perPageNum;
	
	//console.log($(form).serialize());
	form.submit();
	
}
</script>

<script>
Summernote_go($("textarea#mail_desc"),"<%=request.getContextPath() %>") ;

function regist_go(){
	/* alert("click regist"); */
	var form = document.registForm;
	
	var inputNotNull = document.querySelectorAll(".notNull");
	for(var input of inputNotNull){
		if(!input.value){
			alert(input.getAttribute("title")+"은 필수입니다.");
			input.focus();
			return;
		}
	}
	
	form.submit();
}
</script>

<script>
function remove(){
	//alert("click remove btn");
	let checked = document.querySelectorAll('input[name="mail_id"]:checked');
	
	if (checked.length === 0) {
        alert("삭제할 메일을 선택하세요.");
        return;
    }
	
	let answer = confirm("정말 삭제하시겠습니다.");
	if(!answer) return;
	
	let mail_id = Array.from(checked).map(cb => cb.value);
	let params = mail_id.join(",")
	
	location.href="remove?mail_id="+mail_id.join(",");
}
</script>

<script>
function refresh() {
    location.reload();
}
</script>

<script>
var dataNum=0;

function addFile_go(){
	//alert("!!!!");
	if($('input[name="uploadFile"]').length >=3){
		alert("파일추가는 3개까지만 가능합니다.");
		return;
	}
	
	let div=$('<div>').addClass("inputRow").attr("data-no",dataNum).css("margin","3px");
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


<script>/* 체크박스 전체 선택 */
	function all_click(){
		const checkboxes = document.querySelectorAll('input[name="mail_id"]');
		const allChecked = Array.from(checkboxes).every(cb => cb.checked);
		  
		  if (allChecked) {
		    // 모두 체크되어 있으면 해제
		    checkboxes.forEach(cb => {
		    	cb.checked = false;
		    	cb.closest('tr').style.backgroundColor = '';
		    });
		  } else {
		    // 하나라도 체크 안 되어 있으면 모두 선택
		    checkboxes.forEach(cb => {
		    	cb.checked = true;
		    	cb.closest('tr').style.backgroundColor = '#EAF5F4'; // 선택된 행 배경색
		    });
		  }
		  
	}
	
	function toggleCheckbox(row) {
	    let checkbox = row.querySelector('input[type="checkbox"]');
	    checkbox.checked = !checkbox.checked;
	    
	    if(checkbox.checked){
	    	row.style.backgroundColor = "#EAF5F4";
	    } else {
	    	row.style.backgroundColor = "";
	    }
	}
	
	
	function mailWrite() {
		/* 메일 작성 클릭시 화면 바뀜 */
		  document.querySelectorAll('.mailList, .mailDetail').forEach(el => {
		    el.style.display = 'none';
		  });

		  document.querySelectorAll('.mailWriteForm').forEach(el => {
		    el.style.display = 'block';

		    const url = new URL(window.location);
		    url.searchParams.set('write', 'true');
		    history.pushState({}, '', url);
		  });
		}
	
	function closeWrite() {
		/* 메일 작성 창 닫기 시 화면 바뀜 */
	    document.querySelectorAll('.mailWriteForm').forEach(el => {
	      el.style.display = 'none';
	    });

	    document.querySelectorAll('.mailList, .mailDetail').forEach(el => {
	      el.style.display = 'block';
	    });

	    const url = new URL(window.location);
	    url.searchParams.delete('write');
	    history.pushState({}, '', url);
	  }

</script>


<script>/* 중요(별) 클릭 이벤트 */
function starClick(mail_id) {
	  $.ajax({
	    url: '<%=request.getContextPath()%>/api/mail/imp',
	    method: 'get',
	    data: { mail_id: mail_id },
	    success: function(response) {
	      if (response === 'success') {
	        // 현재 이미지 요소 선택
	        const $img = $('#starImg_' + mail_id);

	        // 이미지 경로 기준으로 토글 (imp.png <-> imp_act.png)
	        const impSrc = '<%=request.getContextPath()%>/resources/images/imp.png';
	        const impActSrc = '<%=request.getContextPath()%>/resources/images/imp_act.png';

	        if ($img.attr('src') === impSrc) {
	          $img.attr('src', impActSrc);
	        } else {
	          $img.attr('src', impSrc);
	        }
	      } else {
	        alert('오류가 발생했습니다: ' + response);
	      }
	    },
	    error: function() {
	      alert('서버 통신 중 오류가 발생했습니다.');
	    }
	  });
	}
</script>

<script>
function asRead(mail_id) {
	  $.ajax({
	    url: '<%=request.getContextPath()%>/api/mail/read',
	    method: 'post',
	    contentType: 'application/json',
	    data: JSON.stringify({ mail_id: mail_id }),
	    success: function() {
	      // 성공 시 이미지 변경
	      $('#readImg_' + mail_id).attr('src', '<%=request.getContextPath()%>/resources/images/read.png');
	    },
	    error: function() {
	      alert('읽음 처리에 실패했습니다.');
	    }
	  });
	}
</script>

<!-- <script>/* 카테고리 선택 시 목록 변경 */
	const myId = '${sessionScope.loginUser.mem_id}';
	const btnAll = document.getElementById('btnAll');
	const btnSent = document.getElementById('btnSent');
	const btnRecv = document.getElementById('btnRecv');
	const btnUnread = document.getElementById('btnUnread');
	const btnStar = document.getElementById('btnStar');
	const btnAtt = document.getElementById('btnAtt');
	
	const rows = document.querySelectorAll(".mailTable tbody tr");
	
	function filterMail(type) {
	  rows.forEach(row => {
	    const sender = row.getAttribute('data-sender');
	    const receiver = row.getAttribute('data-receiver');
	    const unread = row.getAttribute('data-unread');
	    const star = row.getAttribute('data-star');
	    const att = row.getAttribute('data-att');
	
	    if (type === 'all') {
	          row.style.display = '';
	          return;
	    	}
	    if (type === 'sent') {
	        row.style.display = sender === myId ? '' : 'none';
	          return;
	   		}
	    if (type === 'recv') {
	        row.style.display = receiver === myId ? '' : 'none';
	          return;
	    	}	
	    if (type === 'unread') {
	        row.style.display = unread === 'true' ? '' : 'none';
	          return;
	        }
	    if (type === 'star') {
	        row.style.display = star === '1' ? '' : 'none';
	          return;
	        }
	    if (type === 'att') {
	        row.style.display = att === '1' ? '' : 'none';
	          return;
	        }
	  });
	}
	// 기본: 전체 메일 보여주기
	filterMail('all');
	
	btnAll.addEventListener('click', () => {
		filterMail('all')
		history.replaceState(null, '', '?mail=1');
	});
	
	btnRecv.addEventListener('click', () => {
		filterMail('recv')
		history.replaceState(null, '', '?mail=2');
	});
	
	btnSent.addEventListener('click', () => {
		filterMail('sent')
		history.replaceState(null, '', '?mail=3');
	});
	
	btnUnread.addEventListener('click', () => {
		filterMail('unread')
		history.replaceState(null, '', '?mail=4');	
	});
	btnStar.addEventListener('click', () => {
		filterMail('star')
		history.replaceState(null, '', '?mail=5');
	});
	btnAtt.addEventListener('click', () => {
		filterMail('att')
		history.replaceState(null, '', '?mail=6');
	});
	
</script> -->
<script>/* 중요, 첨부 카테고리 마우스 오버 */
	const basePath = "<%=request.getContextPath()%>/resources/images/";
	
	// 중요 버튼
	const imgStar = document.getElementById("imgStar");
	const starBtn = document.getElementById('btnStar');
	
	starBtn.addEventListener("mouseover", () => {
	  imgStar.src = basePath + "imp_hover.png";
	});
	starBtn.addEventListener("mouseout", () => {
	  imgStar.src = basePath + "imp.png";
	});
	
	// 첨부 버튼
	const attBtn = document.getElementById("btnAtt");
	const imgAtt = document.getElementById("imgAtt");
	
	attBtn.addEventListener("mouseover", () => {
		  imgAtt.src = basePath + "att_hover.png";
	});
	attBtn.addEventListener("mouseout", () => {
		  imgAtt.src = basePath + "att.png";
	});
</script>

	
	
	
