$(document).ready(function(){
$('.dateWithDay').datetimepicker({
				format:'yyyy-mm-dd',
				startView:2,
				minView:2,
				autoclose:true
			});
$('.dateWithYear').datetimepicker({
	format:'yyyy',
	startView:4,
	maxView:1,
	minView:4,
	autoclose:true
});
$('.dateWithYearMonth').datetimepicker({
	 format:'yyyy-mm',
     startView:3,
     minView:3,
     autoclose:true
});
});