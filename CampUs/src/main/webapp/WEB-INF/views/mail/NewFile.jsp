<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="card-body p-0" >
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
					<button type="button" class="btn btn-default btn-sm" data-container="body" title="Reply">
						<i class="fas fa-reply"></i>
					</button>
					<button type="button" class="btn btn-default btn-sm" data-container="body" title="Delete">
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
			<div id="mailDesc" class="mailbox-read-message" style="padding:15px">
				<div>{{mail_desc}}</div>
			</div>
		</div>
	</div>
</div>
<div class="card-footer bg-white" style="margin-bottom: 10px; display: flex; flex-direction: row;">
	<a href="#" download class="btn btn-default">
	    <i class="fas fa-paperclip"></i> Attachment
	</a>
</div>
</body>
</html>