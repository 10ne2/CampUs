
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
						<button id="btnStar" type="button" class="mailT" style="width: 100px; height: 70px; text-align: center; list-style: none; border:none; margin-top:4px">
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
							<button id="btnAll" type="button" class="d-flex align-items-center mailR"
							style="width: 100%; height: 100%; gap: 20px; line-height: 50px; border:none; padding:15px; overflow:hidden">
								<i class="fas fa-inbox" style=""></i>
								<span style="display: block;">전체 메일함</span>
							</button>
						</li>
						<li class="nav-item" style="height: 50px">
							<button id="btnRecv" type="button" class="d-flex align-items-center mailR"
							style="width: 100%; height: 100%; gap: 20px; line-height: 50px; border:none; padding:15px">
								<i class="far fa-envelope" style=""></i>
								<span style="display: block;">받은 메일함</span>
								<span class="badgec bg-primaryc" style="width:auto;display: block; margin-left: auto; padding: 0 5px 0 5px">${unreadCount}</span>
							</button>
						</li>
						<li class="nav-item" style="height: 50px; border-bottom: 1px solid #ddd;">
							<button id="btnSent" type="button" class="d-flex align-items-center mailR"
							style="width: 100%; height: 100%; gap: 24px; line-height: 50px; border:none; padding:15px">
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
							<input type="text" class="form-control" placeholder="검색어를 입력해주세요." value="${pageMaker.keyword }">
							<div class="input-group-append">
								<div class="btn btn-primaryc" onclick="serch_list(1)">
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
							<button type="button" class="btn btn-default btn-sm">
								<i class="far fa-trash-alt"></i>
							</button>
							<button type="button" class="btn btn-default btn-sm">
								<i class="fas fa-reply"></i>
							</button>
						</div>
						<!-- /.btn-group -->
						<button type="button" class="btn btn-default btn-sm">
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
								<tr style="width: 100%;  display: flex; flex-direction: column;" data-sender="${mail.mail_sender}" data-receiver="${mail.mail_receiver}"
									data-unread="${mail.mail_receiver == loginUser.mem_id and (mail.mail_read == '0')}">
									<td style="width: 100%; min-height: 60px; display: flex; flex-direction: column;">
										<div style="width:100%; display: flex; flex-direction: row;">
											<div class="icheck-primary" style="width:48px">
												<input type="checkbox" value="${mail.mail_id}" id="check_${mail.mail_id}"> <label
													for="check_${mail.mail_id}"></label>
											</div>
											<div class="" style="">
												<img id="readImg" src="<%=request.getContextPath()%>/resources/images/${mail.mail_read == 0 ? 'nread' : 'read'}.png" style="width:20px; cursor:pointer"/>
											</div>
											<div class="" style="width:150px; display:flex; flex-direction: row; margin-left:10px">
												<a style="line-height:30px;">
													${mail.mail_sender == sessionScope.loginUser.mem_id ? mail.receiver_name : mail.sender_name}
												</a>
												<a style="line-height:30px; margin-left:15px; font-size:14px; color: #999">
													${mail.mail_sender == sessionScope.loginUser.mem_id ? mail.mail_receiver : mail.mail_sender}
												</a>
											</div >
											<div class="mailbox-date" style="margin-left:auto; line-height:30px; font-size:12px; color: #bbb">
											 	<fmt:formatDate value="${mail.mail_sender == sessionScope.loginUser.mem_id ? mail.mail_rdate : mail.mail_sdate}" pattern="yy-MM-dd HH:mm" />
											</div>
										</div>
									</td>
									<td style="min-height: 55px; border:none; display: flex; flex-direction: row; margin-top:-25px">
										<div class="mailbox-subjectc" style=" margin-left:60px; overflow: hidden; text-overflow: ellipsis;">
											<a style="font-size:14px; color: #999">
												${mail.mail_sender == sessionScope.loginUser.mem_id ? "[받은메일함]" : "[보낸메일함]"}
											</a>
											<a style="font-size:14px;">${mail.mail_name }</a>
										</div>
										<div class="mailbox-star" style="margin-left: auto; ">
											<img id="starImg" src="<%=request.getContextPath()%>/resources/images/${mail.mail_important == 0 ? 'imp' : 'imp_act'}.png" style="width:20px; cursor:pointer" onclick="starClick()"/>
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
			<div class="card card-primaryc card-outline"
				style="height: 810px; overflow-y: auto;">
				<!-- /.card-header -->
				<div class="card-body p-0" >
					<div class="mailbox-read-info" style="padding:15px">
						<div style="display: flex; flex-direction: row;">
							<h5 style="margin-bottom:15px">전자정부 풀스택 503호 1조(시스아웃) ERD 및 화면정의서 제출합니다.</h5>
							<span class="mailbox-read-time float-right" style="display:block; width: 200px; margin-top:12px; margin-left:auto; text-align:right;">2025년 7월 19일 오후 3:07</span>
						</div>
						<div style="display: flex; flex-direction: row;">
							<span style="width: 80px; display:block; line-height: 28px">받는 사람</span>
							<div style=" height: 30px; background-color: #DFFCF9; border-radius:15px; display: flex; flex-direction: row;">
								<span style="display:block; margin-left:15px; line-height: 28px">김원희</span>
								<span style="display:block; margin-left:15px; line-height: 28px; margin-right:15px">&lt;rla9513@naver.com&gt;</span>
							</div>
							<div style="margin-left:auto;">
								<button type="button" class="btn btn-default btn-sm"
									data-container="body" title="Reply">
									<i class="fas fa-reply"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm"
									data-container="body" title="Delete">
									<i class="far fa-trash-alt"></i>
								</button>
							</div>
						</div>
					</div>
					<!-- /.mailbox-controls -->
					<div class="mailbox-read-message" style="padding:15px">
						<p>Hello John,</p>

						<p>Keffiyeh blog actually fashion axe vegan, irony biodiesel.
							Cold-pressed hoodie chillwave put a bird on it aesthetic, bitters
							brunch meggings vegan iPhone. Dreamcatcher vegan scenester
							mlkshk. Ethical master cleanse Bushwick, occupy Thundercats banjo
							cliche ennui farm-to-table mlkshk fanny pack gluten-free. Marfa
							butcher vegan quinoa, bicycle rights disrupt tofu scenester
							chillwave 3 wolf moon asymmetrical taxidermy pour-over. Quinoa
							tote bag fashion axe, Godard disrupt migas church-key tofu blog
							locavore. Thundercats cronut polaroid Neutra tousled, meh food
							truck selfies narwhal American Apparel.</p>

						<p>
							Thanks,<br>Jane
						</p>
					</div>
					<!-- /.mailbox-read-message -->
				</div>
				<!-- /.card-body -->
				<div class="card-footer bg-white" style="margin-bottom: 10px; display: flex; flex-direction: row;">
					<a href="#" download class="btn btn-default">
					    <i class="fas fa-paperclip"></i> Attachment
					</a>
                  	<span style="display: block; margin-left: 10px; line-height: 38px">1,234 KB</span>
				</div>
				
				</div>
				<!-- /.card-footer -->
			</div>
			<!-- /.card -->
			<div class="col-md-10 mailWriteForm " style="margin-left:auto; display:none;" >
	            <div class="card card-primaryc card-outline" style="height: 810px;">
	              <div class="card-header" style="height:50px">
	                <span class="card-title" style="font-weight:700;">메일 보내기</span>
	                <div class="float-right">
	                  <button type="reset" class="btn btn-default" style="height: 35px; margin-top:-5px; line-height: 5px" onclick="closeWrite()"><i class="fas fa-times"></i>창닫기</button>
	                  <button type="submit" class="btn btn-primary" style="height: 33px; margin-top:-5px; line-height: 5px; background-color:#2EC4B6; border: 1px solid #2EC4B6"><i class="far fa-envelope"></i> Send</button>
	                </div>
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body">
	                <div class="form-group" style="display: flex; flex-direction: row;">
	                  <span style="display:block; width:8%; line-height:32px">받는 사람</span>
	                  <input class="form-control" placeholder="받는 사람을 입력해주세요.">
	                </div>
	                <div class="form-group" style="display: flex; flex-direction: row;">
	                  <span style="display:block; width:8%; line-height:32px">제목</span>
	                  <input class="form-control" placeholder="제목을 입력해주세요.">
	                </div>
	                <div class="form-group" >
	                  <textarea class="form-control" style="height: 500px"> </textarea>
	                </div>
	                <div class="form-group" style="display: flex-direction: row;">
	                  <div class="btn btn-default btn-file">
	                    <i class="fas fa-paperclip"></i> 파일 선택
	                    <input type="file" name="attachment">
	                  </div>
	                  <p class="help-block" style="margin-left:15px; margin-top:13px; line-height: 10px">Max. 32MB</p>
	                </div>
	              </div>
	              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
		</div>
	</div>

<script>
	function all_click(){
		const checkboxes = document.querySelectorAll('input[type="checkbox"]');
		const btn = document.querySelector('.checkbox-toggle i');
		
		let allCheck = true;
		
		checkboxes.forEach(cb =>{
			if(!cb.checked){
				allCheck = false;
			}
		});
		
		checkboxes.forEach(cb => {
			cb.checked = !allCheck;
		});
		
		if (!allChecked) {
	        btn.classList.remove('fa-square');
	        btn.classList.add('fa-check-square');
	    } else {
	        btn.classList.remove('fa-check-square');
	        btn.classList.add('fa-square');
	    }
	}
	
	function mailWrite() {
		  // 기존 화면 숨기기
		  document.querySelectorAll('.mailList, .mailDetail').forEach(el => {
		    el.style.display = 'none';
		  });

		  // 작성 화면 보이기
		  document.querySelectorAll('.mailWriteForm').forEach(el => {
		    el.style.display = 'block';

		    // 주소에 write=true 추가
		    const url = new URL(window.location);
		    url.searchParams.set('write', 'true');
		    history.pushState({}, '', url);
		  });
		}
	
	function closeWrite() {
	    // 작성 폼 숨기고
	    document.querySelectorAll('.mailWriteForm').forEach(el => {
	      el.style.display = 'none';
	    });

	    // 기존 화면 다시 보이게
	    document.querySelectorAll('.mailList, .mailDetail').forEach(el => {
	      el.style.display = 'block';
	    });

	    // URL에서 write 파라미터 제거
	    const url = new URL(window.location);
	    url.searchParams.delete('write');
	    history.pushState({}, '', url);
	  }

</script>
<script>
	function starClick(){
		const img = document.querySelector('#starImg');
		
		const srcOn = "<%=request.getContextPath()%>/resources/images/imp.png";
	    const srcOff = "<%=request.getContextPath()%>/resources/images/imp_act.png";
	    
	    img.src = img.src.includes(srcOn) ? srcOff : srcOn;
	    
	}
	
</script>
<script>
	document.querySelectorAll(".table-hover tbody tr").forEach(row => {
		row.addEventListener("click",function(){
			document.querySelectorAll(".table-hover tbody tr").forEach(r => {
			
			r.classList.remove("selected");
			const cb = r.querySelector("input[type='checkbox']");
		      if (cb) cb.checked = false;
			});
			
	        this.classList.add("selected");
	        const checkbox = this.querySelector("input[type='checkbox']");
	        if (checkbox) checkbox.checked = true;
	        
		});
	});
	
	const mailR = document.querySelectorAll('.mailR');
	mailR[0].classList.add('active');
	mailR.forEach(mail => {
		mail.addEventListener('click', ()=>{
			mailR.forEach(m => m.classList.remove('active'));
			mail.classList.add('active');
		})
	})
</script>
<script>
    const myId = '${sessionScope.loginUser.mem_id}'; // JSTL EL 변수를 JS에 넣기

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
      });
    }

    // 기본: 전체 메일 보여주기
    filterMail('all');

    btnAll.addEventListener('click', () => {
    	filterMail('all')
    	history.replaceState(null, '', '?mail=1');
    });
    
    btnSent.addEventListener('click', () => filterMail('sent'));
    btnRecv.addEventListener('click', () => {
    	filterMail('recv');
    	history.replaceState(null, '', '?mail=3');
    });
    btnUnread.addEventListener('click', () => filterMail('unread'));
</script>
<script>
  const basePath = "<%=request.getContextPath()%>/resources/images/";

  // 중요 버튼
  const btnStar = document.getElementById("btnStar");
  const imgStar = document.getElementById("imgStar");

  btnStar.addEventListener("mouseover", () => {
    imgStar.src = basePath + "imp_hover.png";
  });
  btnStar.addEventListener("mouseout", () => {
    imgStar.src = basePath + "imp.png";
  });

  // 스팸 버튼
  const btnAtt = document.getElementById("btnAtt");
  const imgAtt = document.getElementById("imgAtt");

  btnAtt.addEventListener("mouseover", () => {
	  imgAtt.src = basePath + "att_hover.png";
  });
  btnAtt.addEventListener("mouseout", () => {
	  imgAtt.src = basePath + "att.png";
  });
</script>