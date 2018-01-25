<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>��ͥ����֧������ϵͳ</title>

    <link href="<c:url value='dwz/themes/default/style.css'/>" rel="stylesheet" type="text/css" media="screen"/>
    <link href="<c:url value='dwz/themes/css/core.css'/>" rel="stylesheet" type="text/css" media="screen"/>
    <link href="<c:url value='dwz/themes/css/print.css'/>" rel="stylesheet" type="text/css" media="print"/>
    <link href="<c:url value='dwz/uploadify/css/uploadify.css'/>" rel="stylesheet" type="text/css" media="screen"/>
    <!--[if IE]>
    <link href="<c:url value='dwz/themes/css/ieHack.css'/>" rel="stylesheet" type="text/css" media="screen"/>
    <![endif]-->
    <!--[if lt IE 9]><script src="<c:url value='dwz/js/speedup.js'/>" type="text/javascript"></script><script src="<c:url value='dwz/js/jquery-1.11.3.min.js'/>" type="text/javascript"></script><![endif]-->
    <script src="<c:url value='dwz/js/jquery-2.1.4.min.js'/>" type="text/javascript"></script><!--<![endif]-->

    <script src="<c:url value='dwz/js/jquery.cookie.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/jquery.validate.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/jquery.bgiframe.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/xheditor/xheditor-1.2.2.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/xheditor/xheditor_lang/zh-cn.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/uploadify/scripts/jquery.uploadify.js'/>" type="text/javascript"></script>

    <!-- svgͼ��  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
    <%--<script type="text/javascript" src="chart/raphael.js"></script>--%>
    <%--<script type="text/javascript" src="chart/g.raphael.js"></script>--%>
    <%--<script type="text/javascript" src="chart/g.bar.js"></script>--%>
    <%--<script type="text/javascript" src="chart/g.line.js"></script>--%>
    <%--<script type="text/javascript" src="chart/g.pie.js"></script>--%>
    <%--<script type="text/javascript" src="chart/g.dot.js"></script>--%>

    <script src="<c:url value='dwz/js/dwz.core.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.util.date.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.validate.method.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.barDrag.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.drag.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.tree.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.accordion.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.ui.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.theme.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.switchEnv.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.alertMsg.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.contextmenu.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.navTab.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.tab.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.resize.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.dialog.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.dialogDrag.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.sortDrag.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.cssTable.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.stable.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.taskBar.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.ajax.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.pagination.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.database.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.datepicker.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.effects.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.panel.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.checkbox.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.history.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.combox.js'/>" type="text/javascript"></script>
    <script src="<c:url value='dwz/js/dwz.print.js'/>" type="text/javascript"></script>

    <!-- ������dwz.min.js�滻ǰ��ȫ��dwz.*.js (ע�⣺�滻ʱ����dwz.regional.zh.js����Ҫ����)
    <script src="bin/dwz.min.js" type="text/javascript"></script>
    -->
    <script src="<c:url value='dwz/js/dwz.regional.zh.js'/>" type="text/javascript"></script>

    <!--�Զ��� -->
    <script src="<c:url value='js/web/toolFile.js'/>" type="text/javascript"></script>

    <script type="text/javascript">
        var projectName=getProjectName();

        $(function(){
            DWZ.init("<c:url value='dwz/dwz.frag.xml'/>", {
                loginUrl:"/index.jsp", loginTitle:"��¼",	// ������¼�Ի���
//		loginUrl:"login.html",	// ������¼ҳ��
                statusCode:{ok:200, error:300, timeout:301}, //����ѡ��
                pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //����ѡ��
                keys: {statusCode:"statusCode", message:"message"}, //����ѡ��
                ui:{hideMode:'offsets'}, //����ѡ��hideMode:navTab����л������ط�ʽ��֧�ֵ�ֵ�С�display������offsets������ƫ��λ�õ�ֵ��Ĭ��ֵΪ��display��
                debug:false,	// ����ģʽ ��true|false��
                callback:function(){
                    initEnv();
                    $("#themeList").theme({themeBase:"themes"}); // themeBase �����indexҳ�������base·��
                }
            });

        });

        var costManArray=[['402880e75ed314f5015ed315d3530000','����'],['402880e75ed314f5015ed316b2fa0001','��ܰ��']];
    </script>
</head>

<body>
<div id="layout">
    <div id="header">
        <div class="headerNav">
            <a class="logo" href="http://j-ui.com">��־</a>
            <ul class="nav">
                <li id="switchEnvBox"><a href="javascript:">��<span></span>��</a>
                    <ul>
                    </ul>
                </li>
                <li><a href="https://me.alipay.com/dwzteam" target="_blank">����</a></li>
                <li><a href="changepwd.html" target="dialog" width="600">����</a></li>
                <li><a href="http://www.cnblogs.com/dwzjs" target="_blank">����</a></li>
                <li><a href="http://weibo.com/dwzui" target="_blank">΢��</a></li>
                <li><a href="login.html">�˳�</a></li>
            </ul>
            <ul class="themeList" id="themeList">
                <li theme="default"><div class="selected">��ɫ</div></li>
                <li theme="green"><div>��ɫ</div></li>
                <!--<li theme="red"><div>��ɫ</div></li>-->
                <li theme="purple"><div>��ɫ</div></li>
                <li theme="silver"><div>��ɫ</div></li>
                <li theme="azure"><div>����</div></li>
            </ul>
        </div>

        <!-- navMenu -->

    </div>

    <div id="leftside">
        <div id="sidebar_s">
            <div class="collapse">
                <div class="toggleCollapse"><div></div></div>
            </div>
        </div>
        <div id="sidebar">
            <div class="toggleCollapse"><h2>���˵�</h2><div>����</div></div>

            <div class="accordion" fillSpace="sidebar">
                <div class="accordionHeader">
                    <h2><span>Folder</span></h2>
                </div>
                <div class="accordionContent">
                    <ul class="tree treeFolder">
                        <li><a href="tabsPage.html" target="navTab">�û���Ϣ����</a>
                            <ul>
                                <li><a href="main.html" target="navTab" rel="main">�ҵ���ҳ</a></li>
                                <li><a href="<c:url value='/userManagementController/addUser'/>" target="navTab" rel="main" class="INDEX_ITEM" value="<c:url value='/userManagementController/addUser'/>">����û�</a></li>
                                <li><a href="main.html" target="navTab" rel="main">�޸�����</a></li>
                            </ul>
                        </li>

                        <li><a>֧������</a>
                            <ul>
                                <li><a href="<c:url value='/costManagementController/costRegisterView'/>" target="navTab" rel="costRegisterView">֧���Ǽ�</a></li>
                                <li><a href="<c:url value='/costManagementController/costStatisticsView'/>" target="navTab" rel="costStatisticsView">֧��ͳ��</a></li>
                                <li><a href="w_dialog.html" target="navTab" rel="w_dialog">֧���޸�</a></li>
                            </ul>
                        </li>

                        <li><a>�������</a>
                            <ul>
                                <li><a href="<c:url value='/incomeManagementController/incomeRegisterView'/>" target="navTab" rel="w_validation">����Ǽ�</a></li>
                                <li><a href="w_button.html" target="navTab" rel="w_button">��ť</a></li>
                            </ul>
                        </li>
                        <li><a>Ԥ�����</a>
                            <ul>
                                <li><a href="demo/pagination/layout1.html" target="navTab" rel="pagination1">�ֲ�ˢ�·�ҳ1</a></li>
                                <li><a href="demo/pagination/layout2.html" target="navTab" rel="pagination2">�ֲ�ˢ�·�ҳ2</a></li>
                            </ul>
                        </li>
                        <li><a>�������</a>
                            <ul>
                                <li><a href="chart/test/barchart.html" target="navTab" rel="chart">��״ͼ(��ֱ)</a></li>
                                <li><a href="chart/test/hbarchart.html" target="navTab" rel="chart">��״ͼ(ˮƽ)</a></li>
                                <li><a href="chart/test/linechart.html" target="navTab" rel="chart">����ͼ</a></li>
                                <li><a href="chart/test/linechart2.html" target="navTab" rel="chart">����ͼ</a></li>
                            </ul>
                        </li>
                        <li><a>������Ϣ����</a>
                            <ul>
                                <li><a href="<c:url value='/personalInfoManagementController/businessCardView'/>" target="navTab" rel="chart">��Ƭ����</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
    <div id="container">
        <div id="navTab" class="tabsPage">
            <div class="tabsPageHeader">
                <div class="tabsPageHeaderContent"><!-- ��ʾ���ҿ���ʱ��� class="tabsPageHeaderMargin" -->
                    <ul class="navTab-tab">
                        <li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">�ҵ���ҳ</span></span></a></li>
                    </ul>
                </div>
                <div class="tabsLeft">left</div><!-- ����ֻ��Ҫ���һ����ʽ class="tabsLeft tabsLeftDisabled" -->
                <div class="tabsRight">right</div><!-- ����ֻ��Ҫ���һ����ʽ class="tabsRight tabsRightDisabled" -->
                <div class="tabsMore">more</div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:;">�ҵ���ҳ</a></li>
            </ul>
            <div class="navTab-panel tabsPageContent layoutBox">
                <div class="page unitBox">
                    <div class="accountInfo">
                        <div class="alertInfo">
                            <p><a href="https://code.csdn.net/dwzteam/dwz_jui/tree/master/doc" target="_blank" style="line-height:19px"><span>DWZ���ʹ���ֲ�</span></a></p>
                            <p><a href="http://pan.baidu.com/s/18Bb8Z" target="_blank" style="line-height:19px">DWZ��ܿ�����Ƶ�̲�</a></p>
                        </div>
                        <div class="right">
                            <p style="color:red">DWZ�ٷ�΢�� <a href="http://weibo.com/dwzui" target="_blank">http://weibo.com/dwzui</a></p>
                        </div>
                        <p><span>DWZ���ͻ��˿��</span></p>
                        <p>DWZ�ٷ�΢��:<a href="http://weibo.com/dwzui" target="_blank">http://weibo.com/dwzui</a></p>
                    </div>


                    <div style="width:230px;position: absolute;top:60px;right:0" layoutH="80">
                        <iframe width="100%" height="430" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?width=0&height=430&fansRow=2&ptype=1&skin=1&isTitle=0&noborder=1&isWeibo=1&isFans=0&uid=1739071261&verifier=c683dfe7"></iframe>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

<div id="footer">Copyright &copy; 2010 <a href="demo_page2.html" target="dialog">DWZ�Ŷ�</a> ��ICP��15053290��-2</div>

</body>
</html>