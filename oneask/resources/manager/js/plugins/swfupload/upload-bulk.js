var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol+"//"+localObj.host+"/"+contextPath;
document.write("<link rel='stylesheet' type='text/css' href='"+basePath+"/resources/manager/js/plugins/swfupload/css/default.css' />");
document.write("<script language='javascript' src='"+basePath+"/resources/manager/js/plugins/swfupload/swfupload.js' ></script>");
document.write("<script language='javascript' src='"+basePath+"/resources/manager/js/plugins/swfupload/swfupload.queue.js' ></script>");
document.write("<script language='javascript' src='"+basePath+"/resources/manager/js/plugins/swfupload/fileprogress-bulk.js' ></script>");
document.write("<script language='javascript' src='"+basePath+"/resources/manager/js/plugins/swfupload/handlers-bulk.js' ></script>");

var swfu;



function bulkUpload(url,data){
	var settings = {
		flash_url : basePath+"/resources/manager/js/plugins/swfupload/swfupload.swf",
		upload_url : url,
		post_params : data,
		file_size_limit : "100 MB",
		file_types : "*.*",
		file_post_name : "uploadFile",
		use_query_string : true,
		file_types_description : "All Files",
		file_upload_limit : 10,
		file_queue_limit : 0,
		custom_settings : {
			progressTarget : "fsUploadProgress",
			cancelButtonId : "btnCancel"
		},
		debug : false,
		// Button settings
		button_image_url : basePath+"/resources/manager/js/plugins/swfupload/images/XPButtonNoText_61x22.png",
		button_width : "85",
		button_height : "35",
		button_placeholder_id : "spanButtonPlaceHolder",
		button_text : '<span class="theFont">浏览..<span>',
		button_text_style : ".theFont { font-size: 12;}",
		button_text_left_padding : 12,
		button_text_top_padding : 7,

		// The event handler functions are defined in handlers.js
		file_queued_handler : fileQueued,
		file_queue_error_handler : fileQueueError,
		file_dialog_complete_handler : fileDialogComplete,
		upload_start_handler : uploadStart,
		upload_progress_handler : uploadProgress,
		upload_error_handler : uploadError,
		upload_success_handler : uploadSuccess,
		upload_complete_handler : uploadComplete,
		queue_complete_handler : queueComplete
	    // Queue plugin event
	};
	swfu = new SWFUpload(settings);
	swfu.stopped = false;
};


function bulkImgUpload(url,data){
	var settings = {
		flash_url : basePath+"/resources/manager/js/plugins/swfupload/swfupload.swf",
		upload_url : url,
		post_params : data,
		file_size_limit : "100 MB",
		file_types : "*.*",
		file_post_name : "uploadFile",
		use_query_string : true,
		file_types_description : "All Files",
		file_upload_limit : 10,
		file_queue_limit : 0,
		custom_settings : {
			progressTarget : "fsUploadProgress",
			cancelButtonId : "btnCancel"
		},
		debug : false,
		// Button settings
		button_image_url : basePath+"/resources/manager/js/plugins/swfupload/images/XPButtonNoText_61x22.png",
		button_width : "85",
		button_height : "35",
		button_placeholder_id : "spanButtonPlaceHolder",
		button_text : '<span class="theFont">浏览..<span>',
		button_text_style : ".theFont { font-size: 12;}",
		button_text_left_padding : 12,
		button_text_top_padding : 7,

		// The event handler functions are defined in handlers.js
		file_queued_handler : fileQueued,
		file_queue_error_handler : fileQueueError,
		file_dialog_complete_handler : fileDialogComplete,
		upload_start_handler : uploadStart,
		upload_progress_handler : uploadProgress,
		upload_error_handler : uploadError,
		upload_success_handler : uploadSuccess,
		upload_complete_handler : uploadComplete,
		queue_complete_handler : queueComplete
	    // Queue plugin event
	};
	swfu = new SWFUpload(settings);
	swfu.stopped = false;
};


function upload() {
	if (swfu.getStats().files_queued > 0) {
		swfu.startUpload();
	} else {
		alert("请选择要上传的文件!");
	}
}

function stop() {
	if (swfu) {
		swfu.stopUpload();
	}
}