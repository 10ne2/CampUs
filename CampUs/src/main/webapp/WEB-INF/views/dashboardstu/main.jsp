<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/module/header.jsp"%>

<body>
	<div class="card-body" style="margin-bottom: -20px">
		<span style="font-size: 18pt; font-weight: bold;">강의실</span>
	</div>
	<div class="card-body" style="margin-bottom: -20px;">
		<div>
			<span
				style="display: block; font-size: 16pt; font-weight: bold; color: #2EC4B6; margin-bottom: 10px;">미제출
				과제</span>
		</div>
		<div id="homeworkGrid" style="border: 1px solid #b5b5b5; border-top: 3px solid #2EC4B6;">
			<div class="jsgrid"
				style="position: relative; height: 100%; width: 100%;">
				<div class="jsgrid-header" style="border-bottom: 1px solid #b5b5b5;">
					<table class="jsgrid-table">
						<tr class="jsgrid-header-row">
							<th
								class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
								style="width: 10%; background-color: #ebebeb;">디데이</th>
							<th
								class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
								style="width: 20%; background-color: #ebebeb;">마감시간</th>
							<th
								class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
								style="width: 20%; background-color: #ebebeb;">과목명</th>
							<th
								class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
								style="width: 10%; background-color: #ebebeb;">교수명</th>
							<th
								class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
								style="width: 40%; background-color: #ebebeb;">과제명</th>
						</tr>
					</table>
				</div>
				<div class="jsgrid-body" style="height: 100%;">
					<table class="jsgrid-table">
						<tbody>
							<tr class="jsgrid-row">
								<td class="jsgrid-cell jsgrid-align-center dday"
									style="width: 10%;">D-day</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">57</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">8655
									Arcu. Road</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">France</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 40%;"></td>
							</tr>
							<tr class="jsgrid-alt-row">
								<td class="jsgrid-cell jsgrid-align-center dday"
									style="width: 10%;">Randall Reeves</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">44</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">1819</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">United
									Kingdom</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 40%;"></td>
							</tr>
							<tr class="jsgrid-row">
								<td class="jsgrid-cell jsgrid-align-center dday"
									style="width: 10%;">Ramona Benton</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">43</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">Ap
									#614-689</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">Brazil</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 40%;"></td>
							</tr>
							<tr class="jsgrid-alt-row">
								<td class="jsgrid-cell jsgrid-align-center dday"
									style="width: 10%;">Price Watkins</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">35</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">832-7810
									Nunc Rd.</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">France</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 40%;"></td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
			<!-- 		<div class="jsgrid-load-shader"
			style="display: none; position: absolute; inset: 0px; z-index: 1000;"></div>
		<div class="jsgrid-load-panel"
			style="display: none; position: absolute; top: 50%; left: 50%; z-index: 1000;">Please,
			wait...</div> -->
		</div>
	</div>
	<div class="card-body"
		style="display: flex; flex-direction: row; justify-content: space-around; gap: 3px; margin-bottom: -20px;">
		<div style="width: 35%; height: 100%; margin-right: 20px">
			<div>
				<span
					style="display: block; font-size: 16pt; font-weight: bold; color: #2EC4B6; margin-bottom: 10px;">예정된
					강의</span>
			</div>
			<div id="예정된 강의" class="jsgrid"
				style="position: relative; height: 100%; width: 100%; border: 1px solid #b5b5b5; border-top: 3px solid #2EC4B6;">
				<div class="jsgrid-body" style="height: 100%;">
					<table class="jsgrid-table">
						<tbody>
							<tr class="jsgrid-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">Rebecca</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 50%;">57</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 30%;">8655
									Arcu. Road</td>
							</tr>
							<tr class="jsgrid-alt-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">Randall
									Reeves</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 50%;">44</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 30%;">1819
									Non Street</td>
							</tr>
							<tr class="jsgrid-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">Ramona</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 50%;">43</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 30%;">Ap
									#614-689</td>
							</tr>
							<tr class="jsgrid-alt-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">Price
									Watkins</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 50%;">35</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 30%;">832-7810
									Nunc Rd.</td>
							</tr>
							<tr class="jsgrid-alt-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">Price
									Watkins</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 50%;">35</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 30%;">832-7810
									Nunc Rd.</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div style="width: 65%; height: 100%;">
			<div>
				<span
					style="display: block; font-size: 16pt; font-weight: bold; color: #2EC4B6; margin-bottom: 10px;">공지사항</span>
			</div>
			<div id="공지사항" class="jsgrid"
				style="position: relative; height: 100%; width: 100%; border: 1px solid #b5b5b5; border-top: 3px solid #2EC4B6;">
				<div class="jsgrid-body" style="height: 100%;">
					<div class="jsgrid-header"
						style="border-bottom: 1px solid #b5b5b5;">
						<table class="jsgrid-table" style="">
							<tr class="jsgrid-header-row">
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 10%; background-color: #ebebeb;"></th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 20%; background-color: #ebebeb;">과목명</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 40%; background-color: #ebebeb;">제목</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 10%; background-color: #ebebeb;">교수명</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 20%; background-color: #ebebeb;">등록일</th>
							</tr>
						</table>
					</div>
					<table class="jsgrid-table">
						<tbody>
							<tr class="jsgrid-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">Rebecca</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">57</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 40%;">8655
									Arcu. Road</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">8655</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">8655
									Arcu. Road</td>
							</tr>
							<tr class="jsgrid-alt-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">Randall
									Reeves</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">44</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 40%;">1819
									Non Street</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">44</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">44</td>
							</tr>
							<tr class="jsgrid-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">Rebecca</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">57</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 40%;">8655
									Arcu. Road</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">8655</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">8655
									Arcu. Road</td>
							</tr>
							<tr class="jsgrid-alt-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">Randall
									Reeves</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">44</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 40%;">1819
									Non Street</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">44</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">44</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
	<div class="card-body"
		style="display: flex; flex-direction: row; justify-content: space-around; gap: 3px;">
		<div style="width: 35%; height: 100%; margin-right: 20px">
			<div>
				<span
					style="display: block; font-size: 16pt; font-weight: bold; color: #2EC4B6; margin-bottom: 10px;">금주의
					출결</span>
			</div>
			<div class="progress progress-sm"
				style="height: 30px; margin-bottom: 10px; border-radius: 15px">
				<div class="progress-bar"
					style="width: 80%; height: 100%; border-radius: 15px; background-color: #2EC4B6">
					<span
						style="display: block; width: 100%; height: 5%; text-align: right; font-size: 17px; margin-right: 10px;">80%</span>
				</div>
			</div>
			<div id="금주의 출결" class="jsgrid"
				style="position: relative; height: 100%; width: 100%; border: 1px solid #b5b5b5; border-top: 3px solid #2EC4B6;">
				<div class="jsgrid-body" style="height: 100%;">
					<table class="jsgrid-table">
						<tbody>
							<tr class="jsgrid-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">Rebecca</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 50%;">57</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 30%;">8655
									Arcu. Road</td>
							</tr>
							<tr class="jsgrid-alt-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">Randall
									Reeves</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 50%;">44</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 30%;">1819
									Non Street</td>
							</tr>
							<tr class="jsgrid-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">Ramona</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 50%;">43</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 30%;">Ap
									#614-689</td>
							</tr>
							<tr class="jsgrid-alt-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">Price
									Watkins</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 50%;">35</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 30%;">832-7810
									Nunc Rd.</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div style="width: 65%; height: 100%;">
			<div>
				<span
					style="display: block; font-size: 16pt; font-weight: bold; color: #2EC4B6; margin-bottom: 10px;">자료실</span>
			</div>
			<div id="자료실" class="jsgrid"
				style="position: relative; height: 100%; width: 100%; border: 1px solid #b5b5b5; border-top: 3px solid #2EC4B6;">
				<div class="jsgrid-body" style="height: 100%;">
					<div class="jsgrid-header"
						style="border-bottom: 1px solid #b5b5b5;">
						<table class="jsgrid-table" style="">
							<tr class="jsgrid-header-row">
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 10%; background-color: #ebebeb;"></th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 20%; background-color: #ebebeb;">과목명</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 40%; background-color: #ebebeb;">제목</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 10%; background-color: #ebebeb;">교수명</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 20%; background-color: #ebebeb;">등록일</th>
							</tr>
						</table>
					</div>
					<table class="jsgrid-table">
						<tbody>
							<tr class="jsgrid-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">Rebecca</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">57</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 40%;">8655
									Arcu. Road</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">8655</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">8655
									Arcu. Road</td>
							</tr>
							<tr class="jsgrid-alt-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">Randall
									Reeves</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">44</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 40%;">1819
									Non Street</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">44</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">44</td>
							</tr>
							<tr class="jsgrid-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">Rebecca</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">57</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 40%;">8655
									Arcu. Road</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">8655</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">8655
									Arcu. Road</td>
							</tr>
							<tr class="jsgrid-alt-row">
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">Randall
									Reeves</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">44</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 40%;">1819
									Non Street</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">44</td>
								<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">44</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jsGrid -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jsgrid/demos/db.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jsgrid/jsgrid.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/demo.js"></script>
<!-- Page specific script -->
<script>
  $(function () {
    $("#homeworkGrid").jsGrid({
        height: "auto", // 20% 대신 자동 높이 조절을 권장
        width: "100%",

        sorting: true,
        paging: true,
        pageSize: 3, // 한 페이지당 10개 항목으로 제한
        pageButtonCount: 10, // 페이지 버튼 개수 (선택사항)

        data: db.clients,

        fields: [
            { name: "Name", type: "text", width: 150 },
            { name: "Age", type: "number", width: 50 },
            { name: "Address", type: "text", width: 200 },
            { name: "Country", type: "select", items: db.countries, valueField: "Id", textField: "Name" },
            { name: "Married", type: "checkbox", title: "Is Married" }
        ]
    });
  });
</script>
	<%@ include file="/WEB-INF/views/module/footer.jsp"%>
</body>
</html>
