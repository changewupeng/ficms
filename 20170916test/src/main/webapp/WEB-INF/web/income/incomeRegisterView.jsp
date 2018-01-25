<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageHeader">
  <form id="pagerForm" onsubmit="return navTabSearch(this);" action="<c:url value='/incomeManagementController/getIncomeInfo'/>" method="post">
    <input type="hidden" name="test" value="test">
    <input type="hidden" name="pageNum" value="${model.pageNum}">
    <input type="hidden" name="numPerPage" value="${model.numPerPage}">
    <input type="hidden" name="orderField" value="${param.orderField}">
    <input type="hidden" name="orderDirection" value="${param.orderDirection}">
    <div class="searchBar">
      <ul class="searchContent">
        <li><label>登记人员:</label>
          <select id="incomeRegisterAccountId" name="accountId" class="selectpicker show-tick" data-style="btn-default btn-sel" data-width="auto" data-container="body">
            <option value="accountId_default"><-- 请选择 --></option>
          </select>
        </li>
        <li><label for="incomeBeginTime" class="control-label x85">开始时间</label> <input type="text" name="incomeBeginTime" id="incomeBeginTime"  class="form-control date" size="20" datefmt="yyyy-MM-dd" readonly="readonly"></li>
        <li><label for="incomeEndTime" class="control-label x85">结束时间</label> <input type="text" name="incomeEndTime" id="incomeEndTime"  class="form-control date" size="20" datefmt="yyyy-MM-dd" readonly="readonly"></li>
        <li><button type="submit" class="btn btn-default btn-sm">查询</button></li>
      </ul>
    </div>
  </form>
</div>

<div class="pageContent">
  <div class="panelBar">
    <ul class="toolBar">
      <li><a class="add" href="<c:url value='/incomeManagementController/addOrEditOrDeleteIncomeInfo?oper=add'/>" target="navTab"><span>添加</span></a></li>
      <li class="line">line</li>
      <li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>
    </ul>
  </div>
  <table class="table" width="100%" layoutH="95">
    <thead>
    <tr>
      <th width="20"></th>
      <th>收入流水号</th>
      <th>收入人员</th>
      <th>收入类别</th>
      <th>总额</th>
      <th>收入时间</th>
      <th>登记时间</th>
      <th>备注</th>
    </tr>
    </thead>
    <tbody>
    <c:set var="count" value="0"></c:set>
    <c:forEach var="costInfo" items="${queryIncomeInfoList}">
      <tr>
        <td></td>
        <td>${costInfo[0]}</td>
        <td>${costInfo[1]}</td>
        <td>${costInfo[2]}</td>
        <td>${costInfo[3]}</td>
        <td>${costInfo[4]}</td>
        <td>${costInfo[5]}</td>
        <td>${costInfo[6]}</td>
      </tr>
      <c:set var="count" value="${costInfo[3]+count}"></c:set>
    </c:forEach>

    <td></td>
    <td>总计</td>
    <td></td>
    <td></td>
    <td>${count}</td>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    </tbody>
  </table>
  <div class="panelBar">
    <div class="pages">
      <span>显示</span>
      <select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
        <option value="20">20</option>
        <option value="50">50</option>
        <option value="100">100</option>
        <option value="200">200</option>
      </select>
      <span>条，共${totalCount}条</span>
    </div>

    <div class="pagination" targetType="navTab" totalCount="200" numPerPage="20" pageNumShown="10" currentPage="1"></div>

  </div>
</div>


<script type="text/javascript" charset="utf-8">
  $(function(){
    bindIncomeRegisterAccountIdSelected();
  });

  //支出人员获取下拉
  function bindIncomeRegisterAccountIdSelected(){
    for(var i=0;i<costManArray.length;i++){
      $("#incomeRegisterAccountId").append("<option value='"+costManArray[i][0]+"'>"+costManArray[i][1]+"</option>");
    }
  }
  </script>