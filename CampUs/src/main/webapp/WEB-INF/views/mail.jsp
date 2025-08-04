<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
  overflow: hidden;
  text-overflow: ellipsis;
  width: 230px;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
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
</style>



<div style="height: 900px; padding: 15px;">
	<div>
		<span
			style="display: block; font-size: 20pt; font-weight: bold; margin-bottom: 18px;">
			메일</span>
	</div>
	<div class="row"">
		<div class="col-md-2">
			<a href="compose.html" class="btnw btn-primary btn-block mb-3">메일
				작성</a>
			<div class="cardc" style="width: 100%; height: 70px">
				<div class="" style="width: 100%">
					<div
						style="width: 100%; display: flex; text-align: center; flex-direction: row; justify-content: center; gap:20px;">
						<div style="width: 50px; height: 70px; list-style: none;">
							<span
								style="display: block; text-align: center; font-size: 25px; color: #22A99C; font-weight: bold;">12</span>
							<span style="display: block; text-align: center; font-size: 15px">안읽음</span>
						</div>
						<div
							style="width: 50px; height: 70px; text-align: center; list-style: none; margin-top: 5px">
							<img src="<%=request.getContextPath()%>/resources/images/imp.png"
								style="width: 30px; margin: 0 0 5px -1px"></img> <span
								style="display: block; font-size: 15px">중요</span>
						</div>
						<div
							style="width: 50px; height: 70px; text-align: center; list-style: none; margin-top: 5px">
							<img src="<%=request.getContextPath()%>/resources/images/att.png"
								style="width: 30px; margin: 0 0 5px -1px"></img> <span
								style="display: block; font-size: 15px">첨부</span>
						</div>
					</div>
				</div>
			</div>
			<div class="card">

				<div class="card-body p-0">
					<ul class="nav nav-pills flex-column" style="height: 668px">
						<li class="nav-item" style="height: 50px"><a href="#"
							class="d-flex align-items-center nav-link"
							style="height: 100%; gap: 20px; line-height: 50px"> <i
								class="fas fa-inbox" style=""></i> <span style="display: block;">전체
									메일함</span>
						</a></li>
						<li class="nav-item" style="height: 50px"><a href="#"
							class="d-flex align-items-center nav-link"
							style="height: 100%; gap: 20px; line-height: 50px"> <i
								class="far fa-envelope" style=""></i> <span
								style="display: block;">받은 메일함</span> <span
								class="badgec bg-primaryc"
								style="display: block; margin-left: auto;">12</span>
						</a></li>
						<li class="nav-item"
							style="height: 50px; border-bottom: 1px solid #ddd;"><a
							href="#" class="d-flex align-items-center nav-link"
							style="height: 100%; gap: 24px; line-height: 50px"> <i
								class="far fa-file-alt" style=""></i> <span
								style="display: block;">보낸 메일함</span>
						</a>
					</ul>
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->
			<!-- /.card -->
		</div>
		<!-- /.col -->
		<div class="col-md-3">
			<div class="card card-outline card-primaryc">
				<div class="card-header">
					<h3 class="card-title">목록</h3>
					<div class="card-tools">
						<div class="input-group input-group-sm">
							<input type="text" class="form-control" placeholder="검색어를 입력해주세요.">
							<div class="input-group-append">
								<div class="btn btn-primaryc" style="">
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
							class="btn btn-default btn-sm checkbox-toggle">
							<i class="far fa-square"></i>
						</button>
						<div class="btn-group">
							<button type="button" class="btn btn-default btn-sm">
								<i class="far fa-trash-alt"></i>
							</button>
							<button type="button" class="btn btn-default btn-sm">
								<i class="fas fa-share"></i>
							</button>
						</div>
						<!-- /.btn-group -->
						<button type="button" class="btn btn-default btn-sm">
							<i class="fas fa-sync-alt"></i>
						</button>
						<!-- /.float-right -->
					</div>
					<div class="table-responsive mailbox-messages"
						style="height: 680px; overflow-y: auto;">
						<table class="table table-hover table-striped">
							<tbody>
								<tr style="width: 100%; height: 110px; display: flex; flex-direction: column;">
									<td style="width: 360px; height: 60px;">
										<div style="width:100%; display: flex; flex-direction: row;">
											<div class="icheck-primary" style="weight:20%">
												<input type="checkbox" value="" id="check1"> <label
													for="check1"></label>
											</div>
											<div class="" style="width:200px; display:flex; flex-direction: row;">
												<a style="line-height:30px; margin-left:30px;">김원희</a>
												<a style="line-height:30px; margin-left:15px; font-size:14px; color: #999">20190101</a>
											</div >
											<div class="mailbox-date" style=" margin-left: auto; line-height:30px; font-size:12px; color: #bbb">오후 5:30</div>
										</div>
									</td>
									<td style="height: 100px; border:none; display: flex; flex-direction: row; margin-top:-25px">
										<div class="mailbox-subjectc" style=" margin-left:70px; overflow: hidden; text-overflow: ellipsis;">
											<a style="font-size:14px; color: #999">[보낸편지함]</a>
											<a style="font-size:14px;">전자정부 풀스택 503호 1조(시스아웃) ERD 및 화면정의서 제출합니다.</a>
										</div>
										<div class="mailbox-star" style="margin: 10px 0 0 20px; ">
											<a href="#">
												<i class="fas fa-star text-warning"></i>
											</a>
										</div>
									</td>
									
								</tr>
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
		<!-- /.col -->
		<div class="col-md-7">
			<div class="card card-primaryc card-outline"
				style="height: 810px; overflow-y: auto;">
				<!-- /.card-header -->
				<div class="card-body p-0">
					<div class="mailbox-read-info">
						<h5>Message Subject Is Placed Here</h5>
						<h6>
							From: support@adminlte.io <span
								class="mailbox-read-time float-right">15 Feb. 2015 11:03
								PM</span>
						</h6>
					</div>
					<!-- /.mailbox-read-info -->
					<div class="mailbox-controls with-border text-center">
						<div class="btn-group">
							<button type="button" class="btn btn-default btn-sm"
								data-container="body" title="Delete">
								<i class="far fa-trash-alt"></i>
							</button>
							<button type="button" class="btn btn-default btn-sm"
								data-container="body" title="Reply">
								<i class="fas fa-reply"></i>
							</button>
							<button type="button" class="btn btn-default btn-sm"
								data-container="body" title="Forward">
								<i class="fas fa-share"></i>
							</button>
						</div>
						<!-- /.btn-group -->
						<button type="button" class="btn btn-default btn-sm" title="Print">
							<i class="fas fa-print"></i>
						</button>
					</div>
					<!-- /.mailbox-controls -->
					<div class="mailbox-read-message">
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
				<div class="card-footer bg-white">
					<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
						<li><span class="mailbox-attachment-icon"><i
								class="far fa-file-pdf"></i></span>

							<div class="mailbox-attachment-info">
								<a href="#" class="mailbox-attachment-name"><i
									class="fas fa-paperclip"></i> Sep2014-report.pdf</a> <span
									class="mailbox-attachment-size clearfix mt-1"> <span>1,245
										KB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
										class="fas fa-cloud-download-alt"></i></a>
								</span>
							</div></li>
						<li><span class="mailbox-attachment-icon"><i
								class="far fa-file-word"></i></span>

							<div class="mailbox-attachment-info">
								<a href="#" class="mailbox-attachment-name"><i
									class="fas fa-paperclip"></i> App Description.docx</a> <span
									class="mailbox-attachment-size clearfix mt-1"> <span>1,245
										KB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
										class="fas fa-cloud-download-alt"></i></a>
								</span>
							</div></li>
						<li><span class="mailbox-attachment-icon has-img"><img
								src="../../dist/img/photo1.png" alt="Attachment"></span>

							<div class="mailbox-attachment-info">
								<a href="#" class="mailbox-attachment-name"><i
									class="fas fa-camera"></i> photo1.png</a> <span
									class="mailbox-attachment-size clearfix mt-1"> <span>2.67
										MB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
										class="fas fa-cloud-download-alt"></i></a>
								</span>
							</div></li>
						<li><span class="mailbox-attachment-icon has-img"><img
								src="../../dist/img/photo2.png" alt="Attachment"></span>

							<div class="mailbox-attachment-info">
								<a href="#" class="mailbox-attachment-name"><i
									class="fas fa-camera"></i> photo2.png</a> <span
									class="mailbox-attachment-size clearfix mt-1"> <span>1.9
										MB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
										class="fas fa-cloud-download-alt"></i></a>
								</span>
							</div></li>
					</ul>
				</div>
				<!-- /.card-footer -->
				<div class="card-footer">
					<div class="float-right">
						<button type="button" class="btn btn-default">
							<i class="fas fa-reply"></i> Reply
						</button>
						<button type="button" class="btn btn-default">
							<i class="fas fa-share"></i> Forward
						</button>
					</div>
					<button type="button" class="btn btn-default">
						<i class="far fa-trash-alt"></i> Delete
					</button>
					<button type="button" class="btn btn-default">
						<i class="fas fa-print"></i> Print
					</button>
				</div>
				<!-- /.card-footer -->
			</div>
			<!-- /.card -->
		</div>
	</div>
</div>