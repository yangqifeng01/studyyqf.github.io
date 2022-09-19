/**
 * @author:   夏2同学
 * @time:     2020年8月16日13:07:43
 * @lastEdit: 2020年8月16日13:08:04
 * @content:  [原创插件] 自定义弹窗
 */

"use strict";

$.fn.dialog = function(options) {
	// 解构赋值
	let {
		id,
		title = "我的标题",
		type = 0,
		easyClose = false,
		form,
		submit = noSubmitFunc,
		afterInit = noAfterInit
	} = options;

	checkValue(id, form); //检查数据格式
	init(id, title, type, form); //初始化
	afterInit();

	//元素绑定的按钮被点击了
	$(this).bind("click", {
		id: id
	}, function(event) {
		//执行打开对话框函数
		openDialog(event.data.id);
	})

	//关闭窗口被点击
	$("#" + id + " .btnCancel").bind("click", {
		id: id
	}, function(event) {
		//执行关闭对话框函数
		closeDialog(event.data.id);
	})

	if (easyClose === true) {
		$("." + "black_overlay").bind("click", {
			id: id
		}, function(event) {
			//执行关闭对话框函数
			closeDialog(event.data.id);
		})
	}


	//提交按钮被点击
	$("#" + id + " .btnConfirm").bind("click", {
		id: id
	}, function(event) {
		let data = serilizeToJSON($("#" + id + " form"));
		submit(data);
		//执行关闭对话框函数
		closeDialog(event.data.id);
	})
}

function init(id, title, type, form) {
	let before =
		`
		<div id="${id}" class="box white_content">
			<h4 class="font_title">${title}</h4>
			<form class="form_submit">
	`;

	let core = ``;
	for (var i = 0; i < form.length; i++) {
		let temp =
			`<div>
				<font>${form[i].description}</font>
				<span class="textInsert">
					<input type="${form[i].type}" name="${form[i].name}" value="${form[i].value || ''}"/>
				</span>
				</div>
				`
		core += temp;
	}

	let after = ``;
	if (type === 0) {
		after =
			`</form>
				<div class="bottom_btn">
					<button type="button" class="btnConfirm btn">确认</button>
					<button type="button" class="btnCancel btn">取消</button>
				</div>
			
			</div>
		<div class="black_overlay fade"></div> `;
	} else {
		after =
			`
			</form>
			<div class="bottom_btn">
				<button type="button" class="btnCancel btn" style="margin-left: 38px;">关闭</button>
			</div>
			
		</div>
		<div class="black_overlay fade"></div> `;
	}

	let str = before + core + after;

	var element = document.createElement('div');
	element.innerHTML = str;
	$("body")[0].appendChild(element);
}


function openDialog(id) {
	let element = "#" + id;
	$(element)[0].style.display = "block";
	$(element).next()[0].style.display = "block";
}

function closeDialog(id) {
	let element = "#" + id;
	$(element)[0].style.display = "none";
	$(element).next()[0].style.display = "none";
}


/*函数功能 判断是否为空*/
function isEmpty(obj) {
	if (typeof obj == "undefined" || obj == null || obj == "") {
		return true;
	} else {
		return false;
	}
}

//函数功能 把form表单转化成对象
function serilizeToJSON(form) {
	let result = {};
	let arr = form.serializeArray();
	arr.forEach((item) => {
		result[item.name] = item.value;
		console.log(item.value);
	})
	return result;
}

//函数功能 检查数据格式
function checkValue(id, form) {
	//格式检查
	if (isEmpty(id)) {
		try {
			throw new Error('你必须初始化时设定id的值');
		} catch (e) {
			console.error(e.name + ': ' + e.message);
		}
	}

	if (typeof id !== "string") {
		try {
			throw new Error('id的值的数据类型必须是字符串');
		} catch (e) {
			console.error(e.name + ': ' + e.message);
		}
	}

	if (isEmpty(form)) {
		try {
			throw new Error('你必须初始化时设定form的值');
		} catch (e) {
			console.error(e.name + ': ' + e.message);
		}
	}

}

//函数功能: 把form表单里的数据清空
function clearAllData(id) {
	let obj = $("#" + id + " form input");
	for (var i = 0; i < obj.length; i++) {
		obj[i].value = "";
	}
}


//函数功能：向下移动bottom_btn的位置
function moveBtn(id, height) {
	let obj = $("#" + id + " .bottom_btn")[0];
	obj.style.top = "" + height + "px";
}


function noSubmitFunc() {
	console.log("您初始化时没有设置submit参数!!!");
}

function noAfterInit() {
	// console.log("您初始化时没有设置AfterInit参数!!!");
}
