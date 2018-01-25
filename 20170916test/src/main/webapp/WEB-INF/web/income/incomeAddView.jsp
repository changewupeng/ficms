<%--
  Created by IntelliJ IDEA.
  User: peng
  Date: 2017/9/16
  Time: 21:42
 ���֧����Ϣҳ��
--%>
<!--���ҳ���������� -->
<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="pageContent">

  <form method="post" action="<c:url value='/incomeManagementController/saveIncomeInfo'/>" class="pageForm required-validate" onsubmit="return validateCallback(this)">
    <div class="pageFormContent nowrap" layoutH="97">

      <dl>
        <dt>������Ա��</dt>
        <dd>
          <select id="incomeAccountId" name="accountId" class="selectpicker show-tick" data-style="btn-default btn-sel" data-width="auto" data-container="body">
          </select>
        </dd>
      </dl>
      <dl>
        <dt>����ʱ��</dt>
        <dd>
          <input type="date" name="incomeDate" class="required"/>
        </dd>
      </dl>
      <dl>
        <dt>�������</dt>
        <dd>
          <select name="incomeCategory"  id="incomeCategory">
            <c:forEach var="costItem" items="${incomeCategoryList}">
              <option value="${costItem.dmbm}">${costItem.dmbmmc}</option>
            </c:forEach>
          </select>
        </dd>
      </dl>
      <dl>
        <dt>������</dt>
        <dd>
          <input type="text" name="money" class="required number"/>
        </dd>
      </dl>
      <dl>
        <dt>��ע��</dt>
        <dd><textarea name="remark" cols="80" rows="2"></textarea></dd>
      </dl>

      <div class="divider"></div>
    </div>
    <div class="formBar">
      <ul>
        <li><div class="buttonActive"><div class="buttonContent"><button type="submit">�ύ</button></div></div></li>
        <li><div class="button"><div class="buttonContent"><button type="button" class="close">ȡ��</button></div></div></li>
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
    bindInComeAccountIdSelected();
  });



  //֧����Ա��ȡ����
  function bindInComeAccountIdSelected(){
    for(var i=0;i<costManArray.length;i++){
      $("#incomeAccountId").append("<option value='"+costManArray[i][0]+"'>"+costManArray[i][1]+"</option>");
    }
  }


</script>

