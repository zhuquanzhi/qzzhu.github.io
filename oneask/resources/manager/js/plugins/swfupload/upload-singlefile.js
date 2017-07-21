var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol + "//" + localObj.host;
document.write("<link rel='stylesheet' type='text/css' href='" + basePath + "/js/swfupload/css/default.css' />");
document.write("<script language='javascript' src='" + basePath	+ "/js/swfupload/swfupload.js' ></script>");
document.write("<script language='javascript' src='" + basePath	+ "/js/swfupload/swfupload.queue.js' ></script>");
document.write("<script language='javascript' src='" + basePath	+ "/js/swfupload/fileprogress-singlefile.js' ></script>");
document.write("<script language='javascript' src='" + basePath	+ "/js/swfupload/handlers-singlefile.js' ></script>");

var swfu;

function singleUpload(url, data,types){
	var settings= {
		flash_url : basePath+"/js/swfupload/swfupload.swf",
		flash9_url : basePath+"/js/swfupload/swfupload_fp9.swf",
		upload_url : url,
		post_params : data,
		file_size_limit : "10 MB",
		file_types : types, // you could use something like:"*.*"; "*.doc;*.wpd;*.pdf",
		file_post_name : "uploadFile",
		file_types_description : "All Files",
		file_upload_limit : "0",
		file_queue_limit : "1",
	
		// Button settings
		button_image_url : basePath+"/js/swfupload/images/XPButtonNoText_61x22.png",
		button_placeholder_id : "spanButtonPlaceholder",
		button_width: 61,
		button_height: 22,
		button_text : '<span class="theFont">浏览</span>',
		button_text_style : ".theFont { font-size: 16; }",
		button_text_left_padding : 12,
		button_text_top_padding : 0,

		// Event handler settings
		swfupload_loaded_handler : swfUploadLoaded,
		
		file_dialog_start_handler: fileDialogStart,
		file_queued_handler : fileQueued,
		file_queue_error_handler : fileQueueError,
		file_dialog_complete_handler : fileDialogComplete,
		
		swfupload_preload_handler : preLoad,
		swfupload_load_failed_handler : loadFailed,
		upload_progress_handler : uploadProgress,
		upload_error_handler : uploadError,
		upload_success_handler : uploadSuccess,
		upload_complete_handler : uploadComplete,

		custom_settings : {
			progress_target : "fsUploadProgress",
			upload_successful : false
		},
		debug: false
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