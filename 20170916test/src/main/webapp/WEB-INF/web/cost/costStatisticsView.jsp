<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<c:url value='/zdy/costStatisticView.css'/>" rel="stylesheet" type="text/css" media="screen"/>
<script src="<c:url value='/js/echarts.js'/>" type="text/javascript"></script>

<div class="pageHeader">
  <div class="searchBar">
      <ul class="searchContent">
        <li><label>登记人员:</label>
          <select id="costStatisticAccountId" name="accountId" class="selectpicker show-tick" data-style="btn-default btn-sel" data-width="auto" data-container="body">
              <option value="accountId_default"><-- 请选择 --></option>
          </select>
        </li>
        <li><label for="registerBeginTime" class="control-label x85">开始时间</label> <input type="text" name="registerBeginTime" id="registerBeginTime"  class="form-control date" size="20" datefmt="yyyy-MM-dd" readonly="readonly"></li>
        <li><label for="registerBeginTime" class="control-label x85">结束时间</label> <input type="text" name="registerEndTime" id="registerEndTime"  class="form-control date" size="20" datefmt="yyyy-MM-dd" readonly="readonly"></li>
        <li><button type="button" id="btnCostStatistics">查询</button></li>
      </ul>
    </div>
</div>
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="costStatisticByCategoryPie" style="width: 45%;height:280px;" class="chartDiv"></div>
<div id="costStatisticBySpecificPie" style="width: 45%;height:280px;" class="chartDiv"></div>
<div id="costStatisticRecentSevenDay" style="width: 92.2%;height:280px;" class="chartDiv" ></div>
<table>

</table>
  </div>


<script type="text/javascript" charset="utf-8">

  $(function(){
    bindCostStatisticAccountIdSelected();
    bindBtnCostStatisticsQueryClick();
  });

  //支出人员获取下拉
  function bindCostStatisticAccountIdSelected(){
    for(var i=0;i<costManArray.length;i++){
      $("#costStatisticAccountId").append("<option value='"+costManArray[i][0]+"'>"+costManArray[i][1]+"</option>");
    }
  }

  //绑定查询事件
  function bindBtnCostStatisticsQueryClick(){
    $("#btnCostStatistics").unbind("click");
    $("#btnCostStatistics").bind("click",function(){
      var data={};
      data.accountId=$("#costStatisticAccountId").val();
      data.registerBeginTime=$("#registerBeginTime").val();
      data.registerEndTime=$("#registerEndTime").val();
      $.ajax({
        url:"<c:url value='/costManagementController/getCostStatisticsInfo'/>",
        type:"post",
        data:data,
        dataType:"json",
        timeout:1000,
        success:function(data){
          if(data.costStatisticsInfoByCategoryCodeList){
            var list = data.costStatisticsInfoByCategoryCodeList;
            var costStatisticsInfoByCategoryCodeList=[];
            for(var i=0;i<list.length;i++){
              costStatisticsInfoByCategoryCodeList.push({value:list[i][1],name:list[i][0]})
            }

            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('costStatisticByCategoryPie'));
            costStatisticByCategoryPieOption.series[0].data=costStatisticsInfoByCategoryCodeList;
            myChart.setOption(costStatisticByCategoryPieOption);
          }

          if(data.costStatisticsInfoBySpecificCodeList){
            var list = data.costStatisticsInfoBySpecificCodeList;
            var costStatisticsInfoBypSecificCodeList=[];
            for(var i=0;i<list.length;i++){
              costStatisticsInfoBypSecificCodeList.push({value:list[i][1],name:list[i][0]})
            }

            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('costStatisticBySpecificPie'));
            costStatisticBySpecificPieOption.series[0].data=costStatisticsInfoBypSecificCodeList;
            myChart.setOption(costStatisticBySpecificPieOption);
          }

          if(data.costStatisticsInfoRecentSevenDayList){
            var list = data.costStatisticsInfoRecentSevenDayList;
            var costStatisticsInfoRecentSevenDayList=[],xdata=[];
            for(var i=0;i<list.length;i++){
              xdata.push(list[i][0]);
              costStatisticsInfoRecentSevenDayList.push(list[i][1]);
            }
            var myChart = echarts.init(document.getElementById('costStatisticRecentSevenDay'));
            costStatisticRecentSevenDayLineOption.xAxis.data=xdata;
            costStatisticRecentSevenDayLineOption.series[0].data=costStatisticsInfoRecentSevenDayList;
            console.log(costStatisticRecentSevenDayLineOption);
            myChart.setOption(costStatisticRecentSevenDayLineOption);
          }
        }
      });
    });
  }


  var costStatisticByCategoryPieOption = {
    title : {
      text: '支出大类统计图',
      x:'center'
    },
    tooltip : {
      trigger: 'item',
      formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    series : [
      {
        name: '',
        type: 'pie',
        radius : '55%',
        center: ['50%', '60%'],
        label: {normal: {
          show: true
        }},
        data:[
        ],
        itemStyle: {
          emphasis: {
            shadowBlur: 10,
            shadowOffsetX: 0,
            shadowColor: 'rgba(0, 0, 0, 0.5)'
          }
        }
      }
    ]
  };

  var costStatisticBySpecificPieOption = {
    title : {
      text: '支出细类统计图',
      x:'center'
    },
    tooltip : {
      trigger: 'item',
      formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    series : [
      {
        name: '',
        type: 'pie',
        radius : '55%',
        center: ['50%', '60%'],
        label: {normal: {
          show: true
        }},
        data:[
        ],
        itemStyle: {
          emphasis: {
            shadowBlur: 10,
            shadowOffsetX: 0,
            shadowColor: 'rgba(0, 0, 0, 0.5)'
          }
        }
      }
    ]
  };

  var costStatisticRecentSevenDayLineOption={
    title: {
      text: '最近七天支出曲线图',
      left: 'center'
    },
    tooltip: {
      trigger: 'item',
      formatter: '{a} <br/>{b} : {c}'
    },
    xAxis: {
      name: '日期',
      data: []
    },
    grid: {
      left: '3%',
      right: '4%',
      bottom: '3%',
      containLabel: true
    },
    yAxis: {
      name: 'y'
    },
    series: [
      {
        type: 'line',
        label: {normal: {
          show: true
        }},
        data: []
      }
    ]
  };

</script>


