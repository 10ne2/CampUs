<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form role="form" method="post" action="regist" name="registForm">
	              <div class="card-body">
	                <div class="form-group" style="display: flex; flex-direction: row;">
	                  <span style="display:block; width:8%; line-height:32px">받는 사람</span>
	                  <input class="form-control notNull" placeholder="받는 사람을 입력해주세요.">
	                </div>
	                <div class="form-group" style="display: flex; flex-direction: row;">
	                  <span style="display:block; width:8%; line-height:32px">제목</span>
	                  <input class="form-control notNull" placeholder="제목을 입력해주세요.">
	                </div>
	                <div class="form-group" >
	                  <textarea name="content" id="content" class="textarea form-control notNull" style="height: 500px"> </textarea>
	                </div>
	                <div class="form-group" style="display: flex-direction: row;">
	                  <div class="btn btn-default btn-file">
	                    <i class="fas fa-paperclip"></i> 파일 선택
	                    <input type="file" name="attachment">
	                  </div>
	                  <p class="help-block" style="margin-left:15px; margin-top:13px; line-height: 10px">Max. 32MB</p>
	                </div>
	              </div>
              </form>