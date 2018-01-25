<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 页面自定义css-->
<link href="<c:url value='/css/web/personalinfomanagement/businessCardView.css'/>" type="text/css" rel="stylesheet" />
<!-- 页面自定义css-->

<!-- flexigrid chajian -->
<link href="<c:url value='/flexigrid/css/flexigrid.css'/>" type="text/css" rel="stylesheet" />
<script src="<c:url value='/jqgrid/js/jquery-1.7.1.js'/>" type="text/javascript"></script>
<script src="<c:url value='/flexigrid/js/flexigrid.js'/>" type="text/javascript"></script>
<div id="businessCardInfoQueryForm">
  <span><label for="name">姓名：</label><input id="name" type="text"></span>
  <span><label for="company">公司：</label><input id="company" type="text"></span>
  <input type="button" id="queryBusinessCardInfo" value="查询">
</div>

<div id="ptable" style="margin: 10px;width:100%;height: 60%">
  <table id="flexTable" style="display: none"></table>
</div>


<script type="text/javascript">
  $(function(){
    queryBusinessCardInfoClick();

    businessCardViewInit();
  });

  function businessCardViewInit(){
    $("#queryBusinessCardInfo").click();
  }
  //查询名片信息
  function queryBusinessCardInfoClick(){
    $('#queryBusinessCardInfo').unbind('click');
    $('#queryBusinessCardInfo').bind('click', function (){
      var name=$("#name").val(),company=$('#company').val();

      var width=$("#ptable").width(),height=$("#ptable").height(),colnumWidth=width/13;

      var grid=$("#flexTable").flexigrid( {
        width: width,
        height: height,
        url:"<c:url value='/personalInfoManagementController/businessCardView/getBusinessCardInfo'/>",
        dataType: 'json',
        colModel : [
          {display: '编号',
            name : 'cardId',
            width : colnumWidth,
            sortable : true,
            align: 'center',
            hide: false,
            toggle : false
          },
          {display: '姓名',
            name : 'name',
            width : colnumWidth,
            sortable : false,
            align: 'center'
          },
          {display: '职位',
            name : 'position',
            width : colnumWidth,
            sortable : true,
            align: 'center'
          },
          {display: '公司',
            name : 'company',
            width : colnumWidth,
            sortable : true,
            align: 'right',
            process:formatMoney
          },
          {display: '地址',
            name : 'address',
            width : colnumWidth,
            sortable : true,
            align: 'center'
          },
          {display: '邮编',
            name : 'postCode',
            width : colnumWidth,
            sortable : true,
            align: 'center'
          },
          {display: '电话',
            name : 'phoneNum',
            width : colnumWidth,
            sortable : true,
            align: 'center'
          },
          {display: '传真',
            name : 'fax',
            width : colnumWidth,
            sortable : true,
            align: 'center'
          },
          {display: '手机',
            name : 'cellphoneNum',
            width : colnumWidth,
            sortable : true,
            align: 'center'
          },
          {display: '网址',
            name : 'web',
            width : colnumWidth,
            sortable : true,
            align: 'center'
          },
          {display: 'Email',
            name : 'email',
            width : colnumWidth,
            sortable : true,
            align: 'center'
          },
        ],
        buttons : [
          {name: '新增',
            displayname: '新增',
            bclass: 'add',
            onpress: toolbarItem
          },
          {separator: true},
          { name: '修改',
            displayname: '修改',
            bclass: 'modify',
            onpress: toolbarItem
          },
          {separator: true},
          { name: '删除',
            displayname: '删除',
            bclass: 'delete',
            onpress: toolbarItem
          }
        ],
        searchitems : [
          {display: '编号', name : 'id', isdefault: true},
          {display: '工作名称', name : 'job_name'},
          {display: '工作地址', name : 'work_address'},
          {display: '语言', name : 'language'}
        ],
        errormsg: '发生异常',
        sortname: "id",
        sortorder: "desc",
        usepager: true,
        title: '信息发布管理Flexigrid',
        pagestat: '显示记录从{from}到{to}，总数{total}条',
        useRp: true,
        rp: 10,
        rpOptions: [10, 15, 20, 30, 40, 100],
        nomsg: '没有符合条件的记录存在',
        minColToggle: 1,
        showTableToggleBtn: true,
        autoload: true,
        resizable: false,
        procmsg: '加载中, 请稍等 ...',
        hideOnSubmit: true,
        blockOpacity: 0.5,
        showcheckbox: true,
        gridClass: "bbit-grid",
        rowhandler: false,
        rowbinddata: true,
        onrowchecked: callme
      });
      function callme(){
        alert("选中了");
      }
      function toolbarItem(com, grid) {
        if (com=='delete'){
          deleteMe();
        }else if (com=='add'){
          openDialogAdd();
        }else if (com=='modify'){
          openDialogModify();
        }
      }
      //操作函数
      function formatMoney(value, pid) {
        return "￥" + parseFloat(value).toFixed(2);
      }

      function openDialogAdd(){

      }
      function openDialogModify(){

      }

      function deleteMe(){

      }
    });
  }





</script>