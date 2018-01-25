<!--���ҳ���������� -->
<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="pageContent">

    <form method="post" action="<c:url value='/userManagementController/addUserInfo'/>" class="pageForm required-validate" onsubmit="return validateCallback(this)">
        <div class="pageFormContent nowrap" layoutH="97">

            <dl>
                <dt>������</dt>
                <dd>
                    <input type="text" name="name" id="name" maxlength="20" class="required" />
                    <span class="info">class="required"</span>
                </dd>
            </dl>
            <dl>
                <dt>�Ա�</dt>
                <dd>
                    <select class="combox" name="sex" id="sex" style="width:50px">
                        <option value="-1"><-- ��ѡ�� --></option>
                        <c:forEach var="user" items="${lst}">
                            <option value="${user.dmbm}">${user.dmbmmc}</option>
                        </c:forEach>
                    </select>
                </dd>
            </dl>
            <dl>
                <dt>���壺</dt>
                <dd>
                    <input type="text" name="nation" id="nation" maxlength="20" />
                </dd>
            </dl>
            <dl>
                <dt>���䣺</dt>
                <dd>
                    <input type="text" name="email" class="required email" alt="���������ĵ����ʼ�"/>
                    <span class="info">����</span>
                </dd>
            </dl>
            <dl>
                <dt>�绰��</dt>
                <dd>
                    <input type="text" name="phone" class="phone" alt="���������ĵ绰"/>
                    <span class="info">class="phone"</span>
                </dd>
            </dl>
            <dl>
                <dt>���룺</dt>
                <dd>
                    <input id="w_validation_pwd" type="password" name="password" class="required alphanumeric" minlength="6" maxlength="20" alt="��ĸ�����֡��»��� 6-20λ"/>
                    <span class="info">class="required alphanumeric" minlength="6" maxlength="20"</span>
                </dd>
            </dl>
            <dl>
                <dt>ȷ�����룺</dt>
                <dd>
                    <input type="password" name="repassword" class="required" equalto="#w_validation_pwd"/>
                    <span class="info">class="required" equalto="#xxxId"</span>
                </dd>
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
    });

</script>
