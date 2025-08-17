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
			<a class="btnw btn-primary btn-block mb-3" style="width:250px" onclick="location.href='<%=request.getContextPath()%>/message/registForm'">메일
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
							<i class="far fa-file-alt" style="margin-left:2px"></i>
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
		<!-- /.col -->
	<div class="col-md-10">
		<div style=" display:flex; flex-direction: row;">
			<div class="col-md-6" style="display:block;">
				<div class="card card-outline card-primaryc" style="heigh: 500px">
					<div class="card-header" style="display:flex; flex-direction: row;">
						<div>
							<h3 class="card-title" style="margin-top:5px">받은 메일함</h3>
						</div>
						<div style="margin-left:auto">
							<button type="button" class="btn btn-default btn-sm" onclick="refresh()">
									<i class="fas fa-sync-alt"></i>
							</button>
							<button type="button" class="btn btn-default btn-sm" onclick="refresh()">
									<i class="fas fa-sync-alt"></i>
							</button>
						</div>
					</div>
					<!-- /.card-header -->
					<div class="table-responsive mailbox-messages"
						style="height: 420px; overflow-y: auto;">
						<table class="mailTable table table-hover">
							<tbody>
								<c:if test="${empty receiveList }">
									<tr>
						   	   			<td colspan="5" class="text-center" >받은 메일이 없습니다.</td>
						   	   		</tr>
								</c:if>
								<c:if test="${not empty receiveList }">
									<c:forEach items="${receiveList }" var="receive">
										<tr onclick="OpenWindow('<%=request.getContextPath()%>/message/detail?mail_id=${receive.mail_id}','상세보기',1040,800);" style="cursor:pointer;">
											<td style="width: 100%; min-height: 48px; display: flex; flex-direction: column; margin:-1.6px">
												<div style="width:100%;">
													<div style="display: flex; flex-direction: row;">
														<div class="" style="display: flex; flex-direction: row;">
															<div style="margin-left:10px;">
															    <img id="readImg_" src="<%=request.getContextPath()%>/resources/images/mail_read/${receive.mail_rread }.png"
															      style="width:20px; cursor:pointer"/>
															</div>
														</div>
														<div class="" style="width:150px; display:flex; flex-direction: row; margin-left:20px">
															<a style="width: 60px; line-height:30px;">
																${receive.sender_name }
															</a>
															<a style="line-height:30px; font-size:14px; color: #999">
																${receive.mail_sender}
															</a>
														</div>
														<div style=" border:none; display: flex; flex-direction: row">
															<a style="width: 300px; font-size:14px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; line-height: 30px">
																	${receive.mail_name }</a>
														</div>
														<div class="mailbox-date" style="margin-left:auto; line-height:30px; font-size:12px; color: #bbb">
														 	<fmt:formatDate value="${receive.mail_rdate }" pattern="yy-MM-dd HH:mm" />
													 	</div>
													</div>
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
				</div>
			<!-- /.card -->
				<div class="col-md-6" style="display:block; heigh: 500px">
					<div class="card card-outline card-primaryc">
						<div class="card-header" style="display:flex; flex-direction: row;">
							<div>
								<h3 class="card-title"  style="margin-top:5px">보낸 메일함</h3>
							</div>
							<div style="margin-left:auto">
								<button type="button" class="btn btn-default btn-sm" onclick="refresh()">
										<i class="fas fa-sync-alt"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm" onclick="refresh()">
										<i class="fas fa-sync-alt"></i>
								</button>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="table-responsive mailbox-messages"
							style="height: 420px; overflow-y: auto;">
							<table class="mailTable table table-hover">
								<tbody>
									<c:if test="${empty sendList }">
									<tr>
						   	   			<td colspan="5" class="text-center" >보낸 메일이 없습니다.</td>
						   	   		</tr>
									</c:if>
									<c:if test="${not empty sendList }">
										<c:forEach items="${sendList }" var="send">
											<tr onclick="OpenWindow('<%=request.getContextPath()%>/message/detail?mail_id=${send.mail_id}','상세보기',1040,800);" style="cursor:pointer;">
												<td style="width: 100%; min-height: 48px; display: flex; flex-direction: column; margin:-1.6px">
													<div style="width:100%;">
														<div style="display: flex; flex-direction: row;">
															<div class="" style="display: flex; flex-direction: row;">
																<div style="margin-left:10px;">
																    <img id="readImg_" src="<%=request.getContextPath()%>/resources/images/mail_read/${send.mail_sread }.png"
																      style="width:20px; cursor:pointer"/>
																</div>
															</div>
															<div class="" style="width:150px; display:flex; flex-direction: row; margin-left:20px">
																<a style="width: 60px; line-height:30px;">
																	${send.receiver_name }
																</a>
																<a style="line-height:30px; font-size:14px; color: #999">
																	${send.mail_receiver }
																</a>
															</div>
															<div style=" border:none; display: flex; flex-direction: row">
																<a style="width: 300px; font-size:14px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; line-height: 30px">
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
							<!-- /.table -->
						</div>
							<!-- /.mail-box-messages -->
						</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</div>
			<div class="col-md-12"style="display:block;">
				<div class="card card-outline card-primaryc">
					<div class="card-header" style="display:flex; flex-direction: row;">
						<div>
							<h3 class="card-title" style="margin-top:5px">휴지통</h3>
						</div>
						<div style="margin-left:auto">
							<button type="button" class="btn btn-default btn-sm" onclick="refresh()">
									<i class="fas fa-sync-alt"></i>
							</button>
							<button type="button" class="btn btn-default btn-sm" onclick="refresh()">
									<i class="fas fa-sync-alt"></i>
							</button>
						</div>
					</div>
					<!-- /.card-header -->
					<div class="table-responsive mailbox-messages"
						style=" overflow-y: auto; height:255px;">
						<table class="mailTable table table-hover">
							<tbody>
								<c:if test="${empty wasteList }">
									<tr>
						   	   			<td colspan="5" class="text-center" >휴지통에 메일이 없습니다.</td>
						   	   		</tr>
									</c:if>
									<c:if test="${not empty wasteList }">
										<c:forEach items="${wasteList }" var="waste">
											<tr onclick="OpenWindow('<%=request.getContextPath()%>/message/detail?mail_id=${waste.mail_id}','상세보기',1040,800);" style="cursor:pointer;">
												<td style="width: 100%; min-height: 48px; display: flex; flex-direction: column; margin:-2.2px">
													<div style="width:100%;">
														<div style="display: flex; flex-direction: row;">
															<div class="" style="display: flex; flex-direction: row;">
																<div style="margin-left:10px;">
																    <img id="readImg_"
																    src="<%=request.getContextPath()%>/resources/images/mail_read/${waste.mail_sender == sessionScope.loginUser.mem_id ? waste.mail_rread : waste.mail_sread}.png"
																      style="width:20px; cursor:pointer"/>
																</div>
															</div>
															<div class="" style="width:150px; display:flex; flex-direction: row; margin-left:20px">
																<a style="width: 60px; line-height:30px;">
																	${waste.mail_sender == sessionScope.loginUser.mem_id ? waste.receiver_name : waste.sender_name}
																</a>
																<a style="line-height:30px; font-size:14px; color: #999">
																	${waste.mail_sender == sessionScope.loginUser.mem_id ? waste.mail_receiver : waste.mail_sender}
																</a>
															</div>
															<div style=" border:none; display: flex; flex-direction: row">
																<a style="width: 900px; font-size:14px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; line-height: 30px">
																		${waste.mail_name }</a>
															</div>
															<div class="mailbox-date" style="margin-left:auto; line-height:30px; font-size:12px; color: #bbb">
															 	<fmt:formatDate
															 	value="${waste.mail_sender == sessionScope.loginUser.mem_id ? waste.mail_rdate : waste.mail_sdate}" pattern="yy-MM-dd HH:mm" />
														 	</div>
														</div>
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
			</div>
		</div>
	</div>
		<!-- /.col -->
			<!-- /.card -->
		<div class="col-md-10 mailWriteForm " style="margin-left:auto; display:none;" >
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