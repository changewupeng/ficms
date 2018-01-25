<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageHeader">
  <form id="pagerForm" onsubmit="return navTabSearch(this);" action="<c:url value='/costManagementController/getCostInfo'/>" method="post">
    <input type="hidden" name="test" value="test">
    <input type="hidden" name="pageNum" value="${model.pageNum}">
    <input type="hidden" name="numPerPage" value="${model.numPerPage}">
    <input type="hidden" name="orderField" value="${param.orderField}">
    <input type="hidden" name="orderDirection" value="${param.orderDirection}">
    <div class="searchBar">
      <ul class="searchContent">
        <li><label>登记人员:</label>
          <select name="accountId" class="selectpicker show-tick" data-style="btn-default btn-sel" data-width="auto" data-container="body">
            <c:forEach var="user" items="${costManList}">
              <option value="${user.accountId}">${user.userName}</option>
            </c:forEach>
          </select>
        </li>
        <li><label for="registerBeginTime" class="control-label x85">开始时间</label> <input type="text" name="registerBeginTime" id="registerBeginTime"  class="form-control date" size="20" datefmt="yyyy-MM-dd" readonly="readonly"></li>
        <li><label for="registerBeginTime" class="control-label x85">结束时间</label> <input type="text" name="registerEndTime" id="registerEndTime"  class="form-control date" size="20" datefmt="yyyy-MM-dd" readonly="readonly"></li>
        <li><button type="submit" class="btn btn-default btn-sm">查询</button></li>
      </ul>
    </div>
  </form>
</div>

<div class="pageContent">
  <div class="panelBar">
    <ul class="toolBar">
      <li><a class="add" href="<c:url value='/costManagementController/addOrEditOrDeleteCostInfo?oper=add'/>" target="navTab"><span>添加</span></a></li>
      <li class="line">line</li>
    </ul>
  </div>
  <table class="table" width="100%" layoutH="95" id="table">
    <thead>
    <tr>
      <th width="20"></th>
      <th>支出流水号</th>
      <th>支出人员</th>
      <th>支出大类</th>
      <th>支出细类</th>
      <th>总额</th>
      <th>花费时间</th>
      <th>登记时间</th>
      <th>备注</th>
    </tr>
    </thead>
    <tbody>
    <c:set var="count" value="0"></c:set>
    <c:forEach var="costInfo" items="${queryCostinfoList}">
    <tr>
      <td></td>
      <td>${costInfo[0]}</td>
      <td>${costInfo[1]}</td>
      <td>${costInfo[2]}</td>
      <td>${costInfo[3]}</td>
      <td>${costInfo[4]}</td>
      <td>${costInfo[5]}</td>
      <td>${costInfo[6]}</td>
      <td>${costInfo[8]}</td>
    </tr>
      <c:set var="count" value="${costInfo[4]+count}"></c:set>
    </c:forEach>

    <td></td>
    <td>总计</td>
    <td></td>
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

<script language="javascript">
  var tableToExcel = (function () {
    var uri = 'data:application/vnd.ms-excel;base64,',
            template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><?xml version="1.0" encoding="UTF-8" standalone="yes"?><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
            base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) },
            format = function (s, c) {
              return s.replace(/{(\w+)}/g,
                      function (m, p) { return c[p]; })
            }
    return function (table, name) {
      if (!table.nodeType)
        table = document.getElementById("table");
        var ctx = { worksheet: name || 'Worksheet', table: table.innerHTML }
        window.location.href = uri + base64(format(template, ctx))
    }
  })()
</script>