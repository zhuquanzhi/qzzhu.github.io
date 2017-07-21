// JavaScript Document
function dropMenu(obj){
	$(obj).each(function(){
		var theSpan = $(this);
		var theMenu = theSpan.find(".submenu");
		var tarHeight = theMenu.height();
		theMenu.css({height:0,opacity:0});
		theSpan.hover(
			function(){
				$(this).addClass("selected");
				theMenu.stop().show().animate({height:tarHeight,opacity:1},400);
			},
			function(){
				$(this).removeClass("selected");
				theMenu.stop().animate({height:0,opacity:0},400,function(){
					$(this).css({display:"none"});
				});
			}
		);
	});
}
$(document).ready(function(){
	
	dropMenu(".drop-menu-effect");

});