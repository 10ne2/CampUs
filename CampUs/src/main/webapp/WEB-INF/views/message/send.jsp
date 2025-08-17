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
		<div class="col-md-2" style="width:250px">
			<a class="btnw btn-primary btn-block mb-3" style="width:width:250px" onclick="mailWrite()">메일
				작성</a>
			<div class="card" style="width:250px">
				<div class="card-body p-0" style="width:250px !important">
					<ul class="nav flex-column" style="width:250px; height: 745px;">
						<li class="" style="height: 50px; ">
							<button id="btnAll" type="button" data-mail="1" class="d-flex align-items-center mailR"
							style="width: 100%; height: 100%; gap: 20px; line-height: 50px; border:none; padding:15px; overflow:hidden"
							onclick="location.href='<%=request.getContextPath()%>/message/main'">
								<i class="fas fa-inbox" style=""></i>
								<span style="display: block;">전체 메일</span>
							</button>
						</li>
						<li class="nav-item" style="height: 50px">
							<button id="btnRecv" type="button" data-mail="2" class="d-flex align-items-center mailR"
							style="width: 100%; height: 100%; gap: 20px; line-height: 50px; border:none; padding:15px"
							onclick="location.href='<%=request.getContextPath()%>/message/receive'">
								<i class="far fa-envelope" style=""></i>
								<span style="display: block;">받은 메일함</span>
								<span id="unreadCount" class="badgec bg-primaryc" style="width:auto;display: block; margin-left: auto; padding: 0 5px 0 5px">${unreadCount}</span>
							</button>
						</li>
						<li class="nav-item" style="height: 50px; border-bottom: 1px solid #ddd;">
							<button id="btnSent" type="button" data-mail="3" class="d-flex align-items-center mailR"
							style="width: 100%; height: 100%; gap: 24px; line-height: 50px; border:none; padding:15px"
							onclick="location.href='<%=request.getContextPath()%>/message/send'">
							<i class="far fa-file-alt" style="margin-left:2px"></i>
							<span style="display: block;margin-left:-2px">보낸 메일함</span>
							</button>
						</li>
						<li class="nav-item" style="height: 50px; border-bottom: 1px solid #ddd;">
							<button id="btnSent" type="button" data-mail="3" class="d-flex align-items-center mailR"
							style="width: 100%; height: 100%; gap: 24px; line-height: 50px; border:none; padding:15px"
							onclick="location.href='<%=request.getContextPath()%>/message/waste'">
							<i class="far fa-trash-alt" style="margin-left:2px"></i>
							<span style="display: block;margin-left:-2px">휴지통</span>
							</button>
						</li>
					</ul>
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->
		</div>
	<!-- 카테고리 끝 -->
		<div class="col-md-10">
			<div style=" display:flex; flex-direction: row; margin-left:8px">
				<div style="display:block;">
					<div class="card card-outline card-primaryc" style="width: 1290px;">
						<div class="card-header" style="display:flex; flex-direction: row;">
							<div style="width: 100px">
								<h3 class="card-title" style="margin-top:5px">보낸 메일함</h3>
							</div>
							<div style="width: 870px; margin-top:4px">
								<label style="margin-left: 5px; margin-bottom: -10px; font-weight: 400; color: #707070">
									<input type="radio" name="filter" value="imp" onclick="location.href='${pageContext.request.contextPath}/message/send/imp'" ${selectedFilter == 'imp' ? 'checked' : ''}>
									중요 메일
								</label>
								<label style="margin-left: 5px; margin-bottom: -10px; font-weight: 400; color: #707070">
									<input type="radio" name="filter" value="lock" onclick="location.href='${pageContext.request.contextPath}/message/send/lock'" ${selectedFilter == 'lock' ? 'checked' : ''}>
									잠긴 메일
								</label>
							</div>
							<button type="button" class="btn btn-default btn-sm" onclick="remove();">
								<i class="far fa-trash-alt"></i>
							</button>
							<button type="button" class="btn btn-default btn-sm" style="margin-left: 8px" onclick="refresh()">
									<i class="fas fa-sync-alt"></i>
							</button>
							<div class="input-group input-group-sm" style="width: 200px; margin-left:auto;">
								<input type="text" class="form-control" id="keyword" name="keyword"  placeholder="검색어를 입력해주세요." value="${pageMaker.keyword }">
								<div class="input-group-append">
									<div class="btn btn-primaryc" onclick="search_list(1)">
										<img src="<%=request.getContextPath()%>/resources/images/search.png" style="width: 15px; margin-bottom: 3px">
									</div>
								</div>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="table-responsive mailbox-messages"
							style="height: 687px; overflow-y: auto;">
							<table class="mailTable table table-hover">
								<tbody>
									<c:if test="${empty sendMailList }">
										<tr>
							   	   			<td colspan="5" class="text-center" >받은 메일이 없습니다.</td>
							   	   		</tr>
									</c:if>
									<c:if test="${not empty sendMailList }">
										<c:forEach items="${sendMailList }" var="send">
											<tr style="cursor:pointer;">
												<td style="width: 100%; min-height: 60.2px; display: flex; flex-direction: column; margin:-1.6px">
													<div style="width:100%;">
														<div style="display: flex; flex-direction: row;">
															<div class="icheck-primary" style="width:43px; height:22px; margin-left: 5px">
																<input type="checkbox" name="mail_id" value="${send.mail_id}" id="check_${send.mail_id}"> <label
																	for="check_${send.mail_id}"></label>
															</div>
															<div class="" style="display: flex; flex-direction: row;">
																<div style="margin-left:10px;">
																    <img id="impImg_${send.mail_id}" src="<%=request.getContextPath()%>/resources/images/mail_imp/${send.mail_simp }.png"
																      style="width:20px; cursor:pointer" onclick="toggleImportant(${send.mail_id})"/>
																</div>
															</div>
															<div class="" style="display: flex; flex-direction: row;">
																<div style="margin-left:10px;">
																    <img id="lockImg_${send.mail_id}" src="<%=request.getContextPath()%>/resources/images/mail_lock/${send.mail_slock }.png"
																      style="width:20px; cursor:pointer" onclick="toggleLock(${send.mail_id})"/>
																</div>
															</div>
															<div class="" style="width:150px; display:flex; flex-direction: row; margin-left:20px">
																<a style="width: 60px; line-height:30px;">
																	${send.receiver_name }
																</a>
																<a style="line-height:30px; font-size:14px; color: #999">
																	${send.mail_receiver}
																</a>
															</div>
															<div onclick="OpenWindow('<%=request.getContextPath()%>/message/detail?mail_id=${send.mail_id}','상세보기',1040,800);"
																style=" border:none; display: flex; flex-direction: row">
																<a style="width: 800px; font-size:14px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; line-height: 30px">
																		${send.mail_name }</a>
															</div>
															<div class="mailbox-date" style="margin-left:auto; line-height:30px; font-size:12px; color: #bbb">
															 	<fmt:formatDate value="${send.mail_sdate }" pattern="yy-MM-dd HH:mm" />
														 	</div>
														</div>
													</div>
												</td>	
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
							<!-- /.mail-box-messages -->
						<div class="card-footer">
						<!-- pagination.jsp -->
							<div style="display:${not empty sendMailList ? 'visible':'none' }">
								<%@ include file="/WEB-INF/views/module/pagination.jsp" %>	
							</div>	    			
	    				</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- -- -------------------------------------------------------------------------------------------------------------------------------------------------------  -->
<!-- -- -------------------------------------------------------------------------------------------------------------------------------------------------------  -->
<!-- -- -------------------------------------------------------------------------------------------------------------------------------------------------------  -->
<!-- -- -------------------------------------------------------------------------------------------------------------------------------------------------------  -->

<form id="jobForm" style="display:none;">	
	<input type='text' name="page" value="1" />
	<input type='text' name="keyword" value="" />
	<input type='text' name="perPageNum" value="" />
</form>
<script>
function search_list(page){
	let keyword = document.querySelector('#keyword').value;
	let perPageNum = 12;
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
function refresh() {
    location.href = "${pageContext.request.contextPath}/message/send";
}
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function toggleImportant(mailId) {
    $.post('${pageContext.request.contextPath}/message/toggleSImp', { mail_id: mailId }, function(data) {
        if(data.success) {
            let iconSrc = data.newStatus === 1
                ? '${pageContext.request.contextPath}/resources/images/mail_imp/1.png'
                : '${pageContext.request.contextPath}/resources/images/mail_imp/0.png';
            $('#impImg_' + mailId).attr('src', iconSrc);
        }
    });
}

function toggleLock(mailId) {
    $.post('${pageContext.request.contextPath}/message/toggleSLock', { mail_id: mailId }, function(data) {
        if(data.success) {
            let iconSrc = data.newStatus === 1
                ? '${pageContext.request.contextPath}/resources/images/mail_lock/1.png'
                : '${pageContext.request.contextPath}/resources/images/mail_lock/0.png';
            $('#lockImg_' + mailId).attr('src', iconSrc);
        }
    });
}
</script>