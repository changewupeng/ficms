<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ҳ���Զ���css-->
<link href="<c:url value='/css/web/personalinfomanagement/businessCardView.css'/>" type="text/css" rel="stylesheet" />
<!-- ҳ���Զ���css-->

<!-- flexigrid chajian -->
<link href="<c:url value='/flexigrid/css/flexigrid.css'/>" type="text/css" rel="stylesheet" />
<script src="<c:url value='/jqgrid/js/jquery-1.7.1.js'/>" type="text/javascript"></script>
<script src="<c:url value='/flexigrid/js/flexigrid.js'/>" type="text/javascript"></script>
<div id="businessCardInfoQueryForm">
  <span><label for="name">������</label><input id="name" type="text"></span>
  <span><label for="company">��˾��</label><input id="company" type="text"></span>
  <input type="button" id="queryBusinessCardInfo" value="��ѯ">
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
  //��ѯ��Ƭ��Ϣ
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
          {display: '���',
            name : 'cardId',
            width : colnumWidth,
            sortable : true,
            align: 'center',
            hide: false,
            toggle : false
          },
          {display: '����',
            name : 'name',
            width : colnumWidth,
            sortable : false,
            align: 'center'
          },
          {display: 'ְλ',
            name : 'position',
            width : colnumWidth,
            sortable : true,
            align: 'center'
          },
          {display: '��˾',
            name : 'company',
            width : colnumWidth,
            sortable : true,
            align: 'right',
            process:formatMoney
          },
          {display: '��ַ',
            name : 'address',
            width : colnumWidth,
            sortable : true,
            align: 'center'
          },
          {display: '�ʱ�',
            name : 'postCode',
            width : colnumWidth,
            sortable : true,
            align: 'center'
          },
          {display: '�绰',
            name : 'phoneNum',
            width : colnumWidth,
            sortable : true,
            align: 'center'
          },
          {display: '����',
            name : 'fax',
            width : colnumWidth,
            sortable : true,
            align: 'center'
          },
          {display: '�ֻ�',
            name : 'cellphoneNum',
            width : colnumWidth,
            sortable : true,
            align: 'center'
          },
          {display: '��ַ',
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
          {name: '����',
            displayname: '����',
            bclass: 'add',
            onpress: toolbarItem
          },
          {separator: true},
          { name: '�޸�',
            displayname: '�޸�',
            bclass: 'modify',
            onpress: toolbarItem
          },
          {separator: true},
          { name: 'ɾ��',
            displayname: 'ɾ��',
            bclass: 'delete',
            onpress: toolbarItem
          }
        ],
        searchitems : [
          {display: '���', name : 'id', isdefault: true},
          {display: '��������', name : 'job_name'},
          {display: '������ַ', name : 'work_address'},
          {display: '����', name : 'language'}
        ],
        errormsg: '�����쳣',
        sortname: "id",
        sortorder: "desc",
        usepager: true,
        title: '��Ϣ��������Flexigrid',
        pagestat: '��ʾ��¼��{from}��{to}������{total}��',
        useRp: true,
        rp: 10,
        rpOptions: [10, 15, 20, 30, 40, 100],
        nomsg: 'û�з��������ļ�¼����',
        minColToggle: 1,
        showTableToggleBtn: true,
        autoload: true,
        resizable: false,
        procmsg: '������, ���Ե� ...',
        hideOnSubmit: true,
        blockOpacity: 0.5,
        showcheckbox: true,
        gridClass: "bbit-grid",
        rowhandler: false,
        rowbinddata: true,
        onrowchecked: callme
      });
      function callme(){
        alert("ѡ����");
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
      //��������
      function formatMoney(value, pid) {
        return "��" + parseFloat(value).toFixed(2);
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