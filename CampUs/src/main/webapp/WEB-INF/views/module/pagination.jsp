<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.page-item .page-link {
  position: relative;
  display: block;
  padding: 0.5rem 0.75rem;
  margin-left: -1px;
  line-height: 1.25;
  color: #212121;
  background-color: #fff;
  border: 1px solid #dee2e6;
}
.page-item.active .page-link {
  z-index: 1;
  color: #fff;
  background-color: #2EC4B6;
  border-color: #2EC4B6;
}

.page-item.disabled .page-link {
  color: #2EC4B6;
  pointer-events: none;
  background-color: #fff;
  border-color: #2EC4B6;
}
</style>


<ul class="pagination pagination-sm m-0 float-right">
                  <li class="page-item"><a class="page-link" href="#">«</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">»</a></li>
                </ul>