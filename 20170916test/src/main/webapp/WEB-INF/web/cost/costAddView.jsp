<%--
  Created by IntelliJ IDEA.
  User: peng
  Date: 2017/9/16
  Time: 21:42
 添加支出信息页面
--%>
<!--解决页面中文乱码 -->
<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="pageContent">

  <form method="post" action="<c:url value='/costManagementController/saveCostInfo'/>" class="pageForm required-validate" onsubmit="return validateCallback(this)">
    <div class="pageFormContent nowrap" layoutH="97">

      <dl>
        <dt>支出人员：</dt>
        <dd>
          <select class="combox" name="costMan" id="costAdd_costMan" style="width:50px">
            <c:forEach var="user" items="${costManList}">
              <option value="${user.accountId}">${user.userName}</option>
            </c:forEach>
          </select>
        </dd>
      </dl>
      <dl>
        <dt>支出时间</dt>
        <dd>
          <input type="date" name="costDate" />
        </dd>
      </dl>
      <dl>
        <dt>费用大类</dt>
        <dd>
          <select name="costCateGory"  id="costAdd_costCateGory">
            <option value="default"><-- 请选择 --></option>
            <c:forEach var="costItem" items="${costCategoryList}">
              <option value="${costItem.dmbm}">${costItem.dmbmmc}</option>
            </c:forEach>
          </select>
        </dd>
      </dl>
      <dl>
        <dt>费用明细</dt>
        <dd>
          <select class="required"  name="costAdd_costSpecific" id="costAdd_costSpecific">
          </select>
        </dd>
      </dl>
      <dl>
        <dt>花费金额</dt>
        <dd>
          <input type="text" name="money" class="required number"/>
        </dd>
      </dl>
      <dl>
        <dt>备注：</dt>
        <dd><textarea name="remark" cols="80" rows="2"></textarea></dd>
      </dl>

      <div class="divider"></div>
    </div>
    <div class="formBar">
      <ul>
        <li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
        <li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
      </ul>
    </div>
  </form>

</div>


<script type="text/javascript">
  function customvalidXxx(element){
    if ($(element).val() == "xxx") return false;
    return true;
  }

  $(function(){
    bindSelectCostAddCostCateGoryChange();
  });



  function bindSelectCostAddCostCateGoryChange(){
    $("#costAdd_costCateGory").unbind("change");
    $("#costAdd_costCateGory").bind("change",function(){
      var param={};
      param.parentId=$("#costAdd_costCateGory").val();
      $.ajax({
        url:"<c:url value='/costManagementController/getCostSpecificList'/>",
        type:"POST",
        data:param,
        dataType:'json',
        success:function(data){
          var list = data.list;
          console.log(list);
          $("#costAdd_costSpecific").empty();
          if(list){
            for(var i=0;i<list.length;i++) {
              $("#costAdd_costSpecific").append("<option value=\'"+list[i].dmbm+"\'>"+list[i].dmbmmc+"</option>");
            }
          }
        }
      });
    });
  }

</script>

