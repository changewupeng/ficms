$.extend({
	date_format: function(option){
		var defaults = {
			date:new Date() ,
			format: "yyyy-MM-dd HH:mm:ss"
		};

		option=$.extend({},defaults,option);

		var date=option.date,format=option.format;

		var fullYear = date.getFullYear();
		var month = '0'+(date.getMonth()+1);
		var day = '0'+date.getDate();
		var hour = '0'+date.getHours();
		var min = '0'+date.getMinutes();
		var seconds='0'+date.getSeconds();

		month = month.substr(month.length-2);
		day = day.substr(day.length-2);
		hour = hour.substr(hour.length-2);
		min = min.substr(min.length-2);
		seconds = seconds.substr(seconds.length-2);

		var result;
		switch(format){
			case 'yyyy-MM-dd HH:mm:ss':
				result=fullYear+"-"+month+"-"+day+" "+hour+":"+min+":"+seconds;
				break;
			case 'yyyyMMddHHmmss':
				result=fullYear+month+day+hour+min+seconds;
				break;
			case 'yyyy-MM-dd':
				result=fullYear+"-"+month+"-"+day;
				break;
			case 'yyyyMMdd':
				result=fullYear+""+month+""+day;
				break;
			case 'yyyy年MM月dd日':
				result=fullYear+"年"+month+"月"+day+"日";
				break;
			case 'yyyy/MM/dd':
				result=fullYear+"/"+month+"/"+day;
				break;
			default:
				alert("非法日期格式");

		}
		return result;
	},

	phoneNumCheck:function(phoneNum){
		var reg = /^1[3|4|5|7|8][0-9]{9}$/; //验证规则
		return reg.test(phoneNum);
	},

	emailCheck:function(email){
		var reg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/; //验证规则
		return reg.test(email);
	}
})