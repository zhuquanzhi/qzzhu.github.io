/**
 * zNodes示例：
 * 	var zNodes =[
			{id:1, pId:0, name:"北京"},
			{id:2, pId:0, name:"天津"},
			{id:3, pId:0, name:"上海"},
			{id:6, pId:0, name:"重庆"},
			{id:4, pId:0, name:"河北省", open:true, nocheck:true},//此为顶级菜单，nocheck表示设置为非复选框形式
			{id:41, pId:4, name:"石家庄"},
			{id:42, pId:4, name:"保定"},
			{id:43, pId:4, name:"邯郸"},
			{id:44, pId:4, name:"承德"},
			{id:5, pId:0, name:"广东省", open:true, nocheck:true},
			{id:51, pId:5, name:"广州"},
			{id:52, pId:5, name:"深圳"},
			{id:53, pId:5, name:"东莞"},
			{id:54, pId:5, name:"佛山"},
			{id:6, pId:0, name:"福建省", open:true, nocheck:true},
			{id:61, pId:6, name:"福州"},
			{id:62, pId:6, name:"厦门"},
			{id:63, pId:6, name:"泉州"},
			{id:64, pId:6, name:"三明"}
		 ];
 */
document.write('<style type="text/css">ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #fff;width:220px;height:360px;overflow-y:scroll;overflow-x:auto;}</style>');

/**
 * 初始化一个下拉复选框菜单
 * @param treeDivId 树形菜单ztree上层DIV的Id
 * @param treeId 树形菜单ztree所在ul的id
 * @param zNodes json数据
 * @param showNameId 选择后显示选中值的text的Id
 * @param showValueId 
 * @return
 */
function ztreeSelect(treeDivId,treeId,zNodes,showNameId,showValueId){
	this.treeDivId = treeDivId;
	this.treeId = treeId;
	this.zNodes = zNodes;
	this.showNameId = showNameId;
	this.showValueId = showValueId;
	
	this.beforeClick = function(treesId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj(treesId);
		zTree.checkNode(treeNode, !treeNode.checked, null, true);
		var flag = treeNode.open;
		if(flag){
			flag = zTree.expandNode(treeNode,false);
			return flag;
		}
		if(!flag){
			flag = zTree.expandNode(treeNode,true);
		}
		return false;
	}
	
	this.onCheck = function(e, treesId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj(treesId),
		nodes = zTree.getCheckedNodes(true),
		n = "";
		v = "";
		for (var i=0, l=nodes.length; i<l; i++) {
			n += nodes[i].name + ",";
			v += nodes[i].id + ",";
		}
		if (n.length > 0 ) n = n.substring(0, n.length-1);
		if (v.length > 0 ) v = v.substring(0, v.length-1);
		var nameObj = $("#"+showNameId);
		var valueObj = $("#"+showValueId);
		nameObj.attr("value", n);
		valueObj.attr("value", v);
	}
	
	this.setting = {
			check: {
				enable: true,
				chkStyle: "radio",
				radioType: "all"
			},
			view: {
				showIcon: showIconForTree
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeClick: this.beforeClick,
				onCheck: this.onCheck
			}
		};
	
	function showIconForTree(treeId, treeNode) {
		return !treeNode.isParent;
	};
	
	this.showMenu = function() {
		var nameObj = $("#"+showNameId);
		var nameOffset = $("#"+showNameId).offset();
		$("#"+treeDivId).css({left:nameOffset.left + "px", top:nameOffset.top + nameObj.outerHeight() + "px"}).slideDown("fast");
	
		$("body").bind("mousedown", this.onBodyDown);
	}
	this.hideMenu = function() {
		$("#"+treeDivId).fadeOut("fast");
		$("body").unbind("mousedown", this.onBodyDown);
	}
	/**
	 * 设置选中的节点，传入包含节点id的数组
	 */
	this.setCheckNodes = function(checkNodes) {
		var zTree = $.fn.zTree.getZTreeObj(this.treeId),
		nodes = zTree.transformToArray(zTree.getNodes()),
		n = "";
		v = "";
		for (var i=0, l=nodes.length; i<l; i++) {
			for(var j =0;j<checkNodes.length;j++){
				if(checkNodes[j]==nodes[i].id){
					n += nodes[i].name + ",";
					v += nodes[i].id + ",";
					zTree.checkNode(nodes[i],true,true);
				}
			}
		}
		if (n.length > 0 ) n = n.substring(0, n.length-1);
		if (v.length > 0 ) v = v.substring(0, v.length-1);
		var nameObj = $("#"+showNameId);
		var valueObj = $("#"+showValueId);
		nameObj.attr("value", n);
		valueObj.attr("value", v);
	}
	this.onBodyDown = function(event) {
		if (!(event.target.id == showNameId || event.target.id == treeDivId || $(event.target).parents("#"+treeDivId).length>0)) {
			$("#"+treeDivId).fadeOut("fast");
			$("body").unbind("mousedown", this.onBodyDown);
		}
	}
	
	$.fn.zTree.init($("#"+treeId), this.setting, this.zNodes);
}