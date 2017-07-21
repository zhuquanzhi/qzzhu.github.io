// JavaScript Document

$(document).ready(function() {
	$("#read-more").click(function(){
		  if($("#content-hide").is(":visible")){
			  $("#content-hide").slideUp();
			  $("#read-more i").removeClass().addClass("icon-chevron-down");
			  $(".alert").css("display","block");
		  }else{
			  $("#content-hide").slideDown();
			  $("#read-more i").removeClass().addClass("icon-chevron-up");
			  $(".alert").css("display","none");
		  }
	  });
		$("#read-more1").click(function(){
			  if($("#content-hide1").is(":visible")){
				  $("#content-hide1").slideUp();
				  $("#read-more1 i").removeClass().addClass("icon-chevron-down");
				  $(".alert").css("display","block");
			  }else{
				  $("#content-hide1").slideDown();
				  $("#read-more1 i").removeClass().addClass("icon-chevron-up");
				  $(".alert").css("display","none");
			  }
		  });
	  
	  
	  
		$("#read-more2").click(function(){
			  if($("#content-hide2").is(":visible")){
				  $("#content-hide2").slideUp();
				  $("#read-more2 i").removeClass().addClass("icon-chevron-down");
				  $(".alert").css("display","block");
			  }else{
				  $("#content-hide2").slideDown();
				  $("#read-more2 i").removeClass().addClass("icon-chevron-up");
				  $(".alert").css("display","none");
			  }
		  });
		  
		  
		   $("#read-more3").click(function(){
			  $("#content-hide3").slideToggle();
			  $(this).find("i").toggleClass(function() {
				  if ($(this).hasClass('icon-chevron-up')){
						  return 'icon-chevron-down';
					  } else {
						  return 'icon-chevron-up';
					  }
				});
		  });

		   

		   $("#niandu").find("input").click(function(){
			 $("#niandu-box").show();
			  $("#jidu-box").hide();
			  $("#yuedu-box").hide();
			  
		  });
		  
		$("#jidu").find("input").click(function(){
			 $("#jidu-box").show();
			  $("#yuedu-box").hide();
			  $("#niandu-box").hide();
		  });
		  
		  $("#yuedu").find("input").click(function(){
			 $("#jidu-box").hide();
			  $("#yuedu-box").show();
			  $("#niandu-box").hide();
		  });
		  
		  $("#add_niandu").find("input").click(function(){
			 $("#add_niandu-box").show();
			  $("#add_jidu-box").hide();
			  $("#add_yuedu-box").hide();
			  
		  });
		  
		$("#add_jidu").find("input").click(function(){
			 $("#add_jidu-box").show();
			  $("#add_yuedu-box").hide();
			  $("#add_niandu-box").hide();
		  });
		  
		  $("#add_yuedu").find("input").click(function(){
			 $("#add_jidu-box").hide();
			  $("#add_yuedu-box").show();
			  $("#add_niandu-box").hide();
		  });
		   
		  
});	   
		   

		  $(document).ready(function(){
				dropdownOpen();//调用
			});
			/**
			 * 鼠标划过就展开子菜单，免得需要点击才能展开
			 */
			function dropdownOpen() {
			
				var $dropdownLi = $('li.dropdown');
			
				$dropdownLi.mouseover(function() {
					$(this).addClass('open');
				}).mouseout(function() {
					$(this).removeClass('open');
				});
			}
			
			$(document).ready(function() {
			$("span[name='qi-pro-edit']").click(function(){
					if($(".input-pro-det").is(":visible")){
						 $(this).parents(".panel-heading").next().addClass("pro-edit-wrap");
						 $(this).parents(".panel-heading").next().find("div[name='tijiao_btm']").show();
					}
			});
			
			$("input[name='cancle_input']").click(function(){
					if($(".input-pro-det").is(":hidden")){
						$(this).parent().hide();
						 $(this).parents(".pro-edit-wrap").removeClass("pro-edit-wrap");
						 
					}
			});

		});