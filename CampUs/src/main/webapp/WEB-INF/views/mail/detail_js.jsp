<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.8/handlebars.min.js" ></script>
<script type="text/x-handlebars-template"  id="mail-detail-template" >
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
</script>
<script>

Handlebars.registerHelper({
		"ifEquals": function(a, b, options) {
		  return (a == b) ? options.fn(this) : options.inverse(this);
		},
		"prettifyDate":function(timeValue){ 
			 var dateObj=new Date(timeValue);
	         var year=dateObj.getFullYear();
	         var month = String(dateObj.getMonth() + 1).padStart(2, '0');
	         var date = String(dateObj.getDate()).padStart(2, '0');
	         var hours = String(dateObj.getHours()).padStart(2, '0');
	         var minutes = String(dateObj.getMinutes()).padStart(2, '0');
	         return year+"-"+month+"-"+date+ " " + hours + ":" + minutes;
		 },
		 "splitFileName":function(fullName, index){
			 if (typeof fullName !== 'string') return '';
			  let parts = fullName.split('$$');
			  return parts[index] || '';
		 }
});


</script>
<script>

var mailDetail= Handlebars.compile($("#mail-detail-template").html());

function loadDetail(mail_id){
	
	$.ajax({
		url:"<%=request.getContextPath()%>/api/mail/detail?mail_id="+mail_id,
		method:"get",
		contentType:'application/json',
		success:function(responseData){
			$('.mailDetailList').html(mailDetail(responseData));
			$('#mail_desc').html(responseData.mail_desc);
			
		},
		error:function(error){
			alert("서버장애가 발생했습니다.");
			console.log(responseData);
			
		}
	});
}

</script>