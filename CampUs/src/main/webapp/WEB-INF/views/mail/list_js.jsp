<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.8/handlebars.min.js" ></script>
<script type="text/x-handlebars-template"  id="mail-list-template" >
{{if mails.length}}
	{{#each mails}}
	<tr style="width: 100%; display: flex; flex-direction: column;"
		data-sender="{{mail_sender}}" data-receiver="{{mail_receiver}}"
		data-unread="{{#ifEquals mail_receiver loginUser}}{{#ifEquals mail_read "0"}}true{{else}}false{{/ifEquals}}{{else}}false{{/ifEquals}}"
		data-star="{{mail_important}}"
		data-att=""
		onclick="loadDetail({{mail_id}})">
		<td style="width: 100%; min-height: 60px; display: flex; flex-direction: column;">
			<div style="width:100%; display: flex; flex-direction: row;">
				<div class="icheck-primary" style="width:48px">
					<input type="checkbox" value="{{mail_id}}" id="check_{{mail_id}}">
					<label for="check_{{mail_id}}"></label>
				</div>

				<div>
					<img id="readImg" src="{{contextPath}}/resources/images/{{#ifEquals mail_read "0"}}nread{{else}}read{{/ifEquals}}.png" style="width:20px; cursor:pointer"/>
				</div>

				<div style="width:150px; display:flex; flex-direction: row; margin-left:10px">
					<a style="line-height:30px;">
						{{#ifEquals mail_sender loginUser}}{{receiver_name}}{{else}}{{sender_name}}{{/ifEquals}}
					</a>
					<a style="line-height:30px; margin-left:15px; font-size:14px; color: #999">
						{{#ifEquals mail_sender loginUser}}{{mail_receiver}}{{else}}{{mail_sender}}{{/ifEquals}}
					</a>
				</div>

				<div class="mailbox-date" style="margin-left:auto; line-height:30px; font-size:12px; color: #bbb">
				 	{{#ifEquals mail_sender loginUser}}{{prettifyDate mail_rdate}}{{else}}{{prettifyDate mail_sdate}}{{/ifEquals}}
				</div>
			</div>
		</td>

		<td style="min-height: 55px; border:none; display: flex; flex-direction: row; margin-top:-25px">
			<div class="mailbox-subjectc" style=" margin-left:60px; overflow: hidden; text-overflow: ellipsis;">
				<a style="font-size:14px; color: #999">
					{{#ifEquals mail_sender loginUser}}[보낸메일함]{{else}}[받은메일함]{{/ifEquals}}
				</a>
				<a style="font-size:14px;">{{mail_name}}</a>
			</div>
			<div class="mailbox-star" style="margin-left: auto; ">
				<img id="starImg" src="{{contextPath}}/resources/images/{{#ifEquals mail_important "0"}}imp{{else}}imp_act{{/ifEquals}}.png" style="width:20px; cursor:pointer" onclick="starClick()"/>
			</div>
		</td>
	</tr>
	{{/Each}}

	{{else}}
    <tr>
      <td colspan="5" class="text-center">메일이 없습니다.</td>
    </tr>
  {{/if}}
</script>
<script>

var mailList = Handlebars.compile($("#mail-list-template").html());

function renderMailList(mails) {
  const contextPath = '<%=request.getContextPath()%>';
  const context = {
    mails: mails,
    contextPath: contextPath       // 서버 context path도 같이 넣어주세요
  };
  const html = mailList(context);
  $('#mailListContainer').html(html);
}

function fetchMails(box) {
	  $.ajax({
	    url: "<%=request.getContextPath()%>/api/mail/list",
	    method: 'GET',
	    data: { box },
	    dataType: 'json',
	    success: function(data) {
	      renderMailList(data);
	    },
	    error: function() {
	      document.getElementById('mailListContainer').innerHTML =
	        '<tr><td colspan="5" style="text-align:center;">메일 불러오기 실패</td></tr>';
	    }
	  });
	}

document.getElementById('btnAll').addEventListener('click', () => fetchMails('all'));
document.getElementById('btnInbox').addEventListener('click', () => fetchMails('inbox'));

document.addEventListener('DOMContentLoaded', () => fetchMails('all'));
</script>