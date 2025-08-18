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
  width: 90px;
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
			style="display: block; width:50px; font-size: 20pt; font-weight: bold; margin-bottom: 18px; margin-left: 5px;cursor:pointer"
			onclick="location.href='<%=request.getContextPath()%>/message/main'" >
			메일</span>
	</div>
	<div class="row" style="display:flex; flex-direction: row;">
	<!-- 카테고리 시작 -->
		<%@ include file="/WEB-INF/views/message/category.jsp" %>
	<!-- 카테고리 끝 -->
		<div class="col-md-10">
			<div style=" display:flex; flex-direction: row; margin-left:8px">
				<div style="display:block;">
					<div class="card card-outline card-primaryc" style="width: 1290px;">
						<div class="card-header" style="display:flex; flex-direction: row;">
							<div style="width: 60px">
								<h3 class="card-title" style="margin-top:5px">휴지통</h3>
							</div>
							<button type="button" class="btn btn-default btn-sm" onclick="allWaste();">
								<span>비우기</span>
							</button>
							<button type="button"
								class="btn btn-default btn-sm checkbox-toggle" style="margin-left:925px" onclick="all_click()">
								<i class="far fa-square"></i>
							</button>
							<button type="button" class="btn btn-default btn-sm" style="margin-left:10px" onclick="backMail()">
								<span>복구</span>	
							</button>
							<button type="button" class="btn btn-default btn-sm" style="margin-left:10px" onclick="deleteMail()">
								<span>영구삭제</span>
							</button>
							<button type="button" class="btn btn-default btn-sm" style="margin-left:10px" onclick="refresh();">
								<i class="fas fa-sync-alt"></i>
							</button>
						</div>
						<!-- /.card-header -->
						<div class="table-responsive mailbox-messages"
							style="height: 687px; overflow-y: auto;">
							<table class="mailTable table table-hover">
								<tbody>
									<c:if test="${empty wasteList }">
										<tr>
							   	   			<td colspan="5" class="text-center" >휴지통에 메일이 없습니다.</td>
							   	   		</tr>
									</c:if>
									<c:if test="${not empty wasteList }">
										<c:forEach items="${wasteList }" var="waste">
											<tr >
												<td style="width: 100%; min-height: 60.2px; display: flex; flex-direction: column; margin:-1.6px">
													<div style="width:100%;">
														<div style="display: flex; flex-direction: row;">
															<div class="icheck-primary" style="width:43px; height:22px; margin-left: 5px">
																<input type="checkbox" name="mail_id" value="${waste.mail_id}" id="check_${waste.mail_id}"> <label
																	for="check_${waste.mail_id}"></label>
															</div>
															<div class="" style="display: flex; flex-direction: row;">
																<div style="margin-left:10px;">
																    <img id="readImg_" src="<%=request.getContextPath()%>/resources/images/read/${waste.mail_sender == sessionScope.loginUser.mem_id ? waste.mail_sread : waste.mail_rread }.png"
																      style="width:20px; cursor:pointer"/>
																</div>
															</div>
															<div class="" style="width:150px; display:flex; flex-direction: row; margin-left:20px">
																<a style="width: 60px; line-height:30px;">
																	${waste.mail_sender == sessionScope.loginUser.mem_id ? waste.receiver_name : waste.sender_name }
																</a>
																<a style="line-height:30px; font-size:14px; color: #999">
																	${waste.mail_sender == sessionScope.loginUser.mem_id ? waste.mail_receiver : waste.mail_sender}
																</a>
															</div>
															<div class="mailbox-subjectc" style=" overflow: hidden; text-overflow: ellipsis;">
																<a style="font-size:14px; color: #999">
																	${waste.mail_sender == sessionScope.loginUser.mem_id ? "[보낸메일함]" : "[받은메일함]"}
																</a>
															</div>
															<div onclick="OpenWindow('<%=request.getContextPath()%>/message/detailwaste?mail_id=${waste.mail_id}','상세보기',1040,800);" 
																style=" border:none; display: flex; flex-direction: row">
																<a style="width: 800px; font-size:14px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; line-height: 30px">
																		${waste.mail_name }</a>
															</div>
															<div class="mailbox-date" style="margin-left:auto; line-height:30px; font-size:12px; color: #bbb">
															 	<fmt:formatDate value="${waste.mail_ddate}" pattern="yy-MM-dd HH:mm" />
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
						<div class="card-footer">
						<!-- pagination.jsp -->
							<div style="display:${not empty wasteList ? 'visible':'none' }">
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
    location.href = "${pageContext.request.contextPath}/message/waste";
}
</script>

<script>
function backMail(){
	let checked = document.querySelectorAll('input[name="mail_id"]:checked');
	
	if (checked.length === 0) {
        alert("복구할 메일을 선택하세요.");
        return;
    }
	
	let answer = confirm("정말 복구하시겠습니까?");
	if(!answer) return;
	
	let mail_id = Array.from(checked).map(cb => cb.value);
	let params = mail_id.join(",")
	
	location.href = "backwaste?mail_id=" + params;
}
</script>

<script>
function deleteMail(){
	let checked = document.querySelectorAll('input[name="mail_id"]:checked');
	
	if (checked.length === 0) {
        alert("영구삭제할 메일을 선택하세요.");
        return;
    }
	
	let answer = confirm("복구가 불가능합니다. 정말 삭제하시겠습니까?");
	if(!answer) return;
	
	let mail_id = Array.from(checked).map(cb => cb.value);
	let params = mail_id.join(",")
	
	location.href = "delete?mail_id=" + params;
}
</script>

<script>
function allWaste() {
	let wasteCount = document.querySelectorAll('input[name="mail_id"]').length;

    if (wasteCount === 0) {
        alert("휴지통이 비어 있습니다.");
        return;
    }
    
    if (!confirm("정말 휴지통을 비우시겠습니까?")) return;

    // 모든 휴지통 메일 삭제
    location.href = "allWaste";
}
</script>

<script>
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
</script>