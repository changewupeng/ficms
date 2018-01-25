<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
{
"statusCode":"${statusCode}",
"message":"${param.callbackType ne 'forwardConfirm' ? message : ''}",
"confirmMsg":"${param.callbackType eq 'forwardConfirm' ? message : ''}",
"navTabId":"${param.navTabId}",
"rel":"${param.rel}",
"callbackType":"${param.callbackType}",
"forwardUrl":"${empty forwardUrl ? param.forwardUrl : forwardUrl}"
}