<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>家庭收入支出管理系统</title>

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

    <!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
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

    <!-- 可以用dwz.min.js替换前面全部dwz.*.js (注意：替换时下面dwz.regional.zh.js还需要引入)
    <script src="bin/dwz.min.js" type="text/javascript"></script>
    -->
    <script src="<c:url value='dwz/js/dwz.regional.zh.js'/>" type="text/javascript"></script>

    <!--自定义 -->
    <script src="<c:url value='js/web/toolFile.js'/>" type="text/javascript"></script>

    <script type="text/javascript">
        var projectName=getProjectName();

        $(function(){
            DWZ.init("<c:url value='dwz/dwz.frag.xml'/>", {
                loginUrl:"/index.jsp", loginTitle:"登录",	// 弹出登录对话框
//		loginUrl:"login.html",	// 跳到登录页面
                statusCode:{ok:200, error:300, timeout:301}, //【可选】
                pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
                keys: {statusCode:"statusCode", message:"message"}, //【可选】
                ui:{hideMode:'offsets'}, //【可选】hideMode:navTab组件切换的隐藏方式，支持的值有’display’，’offsets’负数偏移位置的值，默认值为’display’
                debug:false,	// 调试模式 【true|false】
                callback:function(){
                    initEnv();
                    $("#themeList").theme({themeBase:"themes"}); // themeBase 相对于index页面的主题base路径
                }
            });

        });

        var costManArray=[['402880e75ed314f5015ed315d3530000','吴鹏'],['402880e75ed314f5015ed316b2fa0001','张馨月']];
    </script>
</head>

<body>
<div id="layout">
    <div id="header">
        <div class="headerNav">
            <a class="logo" href="http://j-ui.com">标志</a>
            <ul class="nav">
                <li id="switchEnvBox"><a href="javascript:">（<span></span>）</a>
                    <ul>
                    </ul>
                </li>
                <li><a href="https://me.alipay.com/dwzteam" target="_blank">捐赠</a></li>
                <li><a href="changepwd.html" target="dialog" width="600">设置</a></li>
                <li><a href="http://www.cnblogs.com/dwzjs" target="_blank">博客</a></li>
                <li><a href="http://weibo.com/dwzui" target="_blank">微博</a></li>
                <li><a href="login.html">退出</a></li>
            </ul>
            <ul class="themeList" id="themeList">
                <li theme="default"><div class="selected">蓝色</div></li>
                <li theme="green"><div>绿色</div></li>
                <!--<li theme="red"><div>红色</div></li>-->
                <li theme="purple"><div>紫色</div></li>
                <li theme="silver"><div>银色</div></li>
                <li theme="azure"><div>天蓝</div></li>
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
            <div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>

            <div class="accordion" fillSpace="sidebar">
                <div class="accordionHeader">
                    <h2><span>Folder</span></h2>
                </div>
                <div class="accordionContent">
                    <ul class="tree treeFolder">
                        <li><a href="tabsPage.html" target="navTab">用户信息管理</a>
                            <ul>
                                <li><a href="main.html" target="navTab" rel="main">我的主页</a></li>
                                <li><a href="<c:url value='/userManagementController/addUser'/>" target="navTab" rel="main" class="INDEX_ITEM" value="<c:url value='/userManagementController/addUser'/>">添加用户</a></li>
                                <li><a href="main.html" target="navTab" rel="main">修改密码</a></li>
                            </ul>
                        </li>

                        <li><a>支出管理</a>
                            <ul>
                                <li><a href="<c:url value='/costManagementController/costRegisterView'/>" target="navTab" rel="costRegisterView">支出登记</a></li>
                                <li><a href="<c:url value='/costManagementController/costStatisticsView'/>" target="navTab" rel="costStatisticsView">支出统计</a></li>
                                <li><a href="w_dialog.html" target="navTab" rel="w_dialog">支出修改</a></li>
                            </ul>
                        </li>

                        <li><a>收入管理</a>
                            <ul>
                                <li><a href="<c:url value='/incomeManagementController/incomeRegisterView'/>" target="navTab" rel="w_validation">收入登记</a></li>
                                <li><a href="w_button.html" target="navTab" rel="w_button">按钮</a></li>
                            </ul>
                        </li>
                        <li><a>预算管理</a>
                            <ul>
                                <li><a href="demo/pagination/layout1.html" target="navTab" rel="pagination1">局部刷新分页1</a></li>
                                <li><a href="demo/pagination/layout2.html" target="navTab" rel="pagination2">局部刷新分页2</a></li>
                            </ul>
                        </li>
                        <li><a>报表管理</a>
                            <ul>
                                <li><a href="chart/test/barchart.html" target="navTab" rel="chart">柱状图(垂直)</a></li>
                                <li><a href="chart/test/hbarchart.html" target="navTab" rel="chart">柱状图(水平)</a></li>
                                <li><a href="chart/test/linechart.html" target="navTab" rel="chart">折线图</a></li>
                                <li><a href="chart/test/linechart2.html" target="navTab" rel="chart">曲线图</a></li>
                            </ul>
                        </li>
                        <li><a>个人信息管理</a>
                            <ul>
                                <li><a href="<c:url value='/personalInfoManagementController/businessCardView'/>" target="navTab" rel="chart">名片管理</a></li>
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
                <div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
                    <ul class="navTab-tab">
                        <li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
                    </ul>
                </div>
                <div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
                <div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
                <div class="tabsMore">more</div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:;">我的主页</a></li>
            </ul>
            <div class="navTab-panel tabsPageContent layoutBox">
                <div class="page unitBox">
                    <div class="accountInfo">
                        <div class="alertInfo">
                            <p><a href="https://code.csdn.net/dwzteam/dwz_jui/tree/master/doc" target="_blank" style="line-height:19px"><span>DWZ框架使用手册</span></a></p>
                            <p><a href="http://pan.baidu.com/s/18Bb8Z" target="_blank" style="line-height:19px">DWZ框架开发视频教材</a></p>
                        </div>
                        <div class="right">
                            <p style="color:red">DWZ官方微博 <a href="http://weibo.com/dwzui" target="_blank">http://weibo.com/dwzui</a></p>
                        </div>
                        <p><span>DWZ富客户端框架</span></p>
                        <p>DWZ官方微博:<a href="http://weibo.com/dwzui" target="_blank">http://weibo.com/dwzui</a></p>
                    </div>


                    <div style="width:230px;position: absolute;top:60px;right:0" layoutH="80">
                        <iframe width="100%" height="430" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?width=0&height=430&fansRow=2&ptype=1&skin=1&isTitle=0&noborder=1&isWeibo=1&isFans=0&uid=1739071261&verifier=c683dfe7"></iframe>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

<div id="footer">Copyright &copy; 2010 <a href="demo_page2.html" target="dialog">DWZ团队</a> 京ICP备15053290号-2</div>

</body>
</html>