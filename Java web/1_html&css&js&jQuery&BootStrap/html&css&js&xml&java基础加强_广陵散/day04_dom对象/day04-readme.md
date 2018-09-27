
day04

上节内容回顾
	1、Date对象里面
		** 获取当前的月 getMonth(): 返回 0-11
		** 获取当前星期，星期日 返回 0
	
	2、Math对象里面
		** 静态方法，Math.floor()
	
	3、全局函数
		eval()
	
	4、js里面的重载
		arguments：数组，存储参数
	
	5、js的bom里面对象
		navigator screen  location  history
		
	6、window对象
		setInterval和setTimeout

		* clearInterval和clearTimeout

		* alert confirm prompt  close
		**open("地址","","宽度高度")：打开新窗口

		* opener：得到创建此窗口的窗口
	
	7、dom解析html	

	8、对象有哪些？
		document对象：整个文档
		element对象：标签
		属性对象
		文本对象
		Node节点对象
	
	9、document对象
		** getElementById
		** getElementsByName: 返回数组
		** getElementsByTagName: 返回数组
		** write方法

1、案例一：在末尾添加节点
	第一步：获取到ul标签
	第二步：创建li标签
		document.createElement("标签名称")方法
	第三步：创建文本
		document.createTextNode("文本内容");
	
	第四步：把文本添加到li下面
		使用 appendChild方法
	第五步：把里添加到ul末尾
		使用 appendChild方法

2、元素对象（element对象）
	** 要操作element对象，首先必须要获取到element，
		- 使用document里面相应的方法获取
	
	** 方法
		*** 获取属性里面的值
			getAttribute("属性名称")
			- var input1 = document.getElementById("inputid");
			//alert(input1.value);
			alert(input1.getAttribute("value"));
		
		*** 设置属性的值
			input1.setAttribute("class","haha");
		
		*** 删除属性
			input1.removeAttribute("name");

			** 不能删除value
	
	*** 想要获取标签下面的子标签
		** 使用属性 childNodes，但是这个属性兼容性很差
		** 获得标签下面子标签的唯一有效办法，使用getElementsByTagName方法
			- var ul11 = document.getElementById("ulid1");
			//获取ul下面的子标签
			//var lis = ul11.childNodes;
			//alert(lis.length);
			var lis = ul11.getElementsByTagName("li");
			alert(lis.length);

3、Node对象属性一
	* nodeName 
	* nodeType
	* nodeValue

	* 使用dom解析html时候，需要html里面的标签，属性和文本都封装成对象

	* 标签节点对应的值
		nodeType： 1
		nodeName： 大写标签名称  比如SPAN
		nodeValue: null
	* 属性节点对应的值
		nodeType： 2
		nodeName： 属性名称
		nodeValue: 属性的值
	* 文本节点对应的值
		nodeType： 3
		nodeName： #text
		nodeValue: 文本内容

4、Node对象的属性二
	<ul>
		<li>qqqqq</li>
		<li>wwww</li>
	</ul>

	* 父节点
		- ul是li的父节点
		- parentNode
		- //得到li1
		var li1 = document.getElementById("li1");
		//得到ul
		var ul1 = li1.parentNode;
		alert(ul1.id);

	* 子节点
		- li是ul的子节点
		- childNodes：得到所有子节点，但是兼容性很差

		- firstChild：获取第一个子节点
			- //获取ul的第一个子节点 id=li1
			//得到ul
			var ul1 = document.getElementById("ulid");
			//第一个子节点
			var li1 = ul1.firstChild;
			alert(li1.id);
		- lastChild：获取最后一个子节点
			//得到最后一个子节点
			var li4 = ul1.lastChild;
			alert(li4.id);

	* 同辈节点
		- li直接关系是同辈节点
		- nextSibling: 返回一个给定节点的下一个兄弟节点。
		previousSibling：返回一个给定节点的上一个兄弟节点。

		- //获取li的id是li3的上一个和下一个兄弟节点
		var li3 = document.getElementById("li3");
		//alert(li3.nextSibling.id);
		alert(li3.previousSibling.id);

5、操作dom树
	** appendChild方法
		- 添加子节点到末尾
		- 特点：类似于剪切黏贴的效果
	
	** insertBefore(newNode,oldNode)方法
		- 在某个节点之前插入一个新的节点，通过父节点插入
		- 两个参数
			* 要插入的节点
			* 在谁之前插入
		- 插入一个节点，节点不存在，创建
			1、创建标签
			2、创建文本
			3、把文本添加到标签下面
		- 代码
		/*
			1、获取到li13标签
			2、创建li
			3、创建文本
			4、把文本添加到li下面
			5、获取到ul
			6、把li添加到ul下面（在<li>貂蝉</li>之前添加 <li>董小宛</li>）		
		*/
		//获取li3 标签
		var li13 = document.getElementById("li13");
		//创建li
		var li15 = document.createElement("li");
		//创建文本
		var text15 = document.createTextNode("董小宛");
		//把文本添加到li下面 appendChild
		li15.appendChild(text15);
		//获取到ul
		var ul21 = document.getElementById("ulid21");
		//在<li>貂蝉</li>之前添加 <li>董小宛</li> 
		//insertBefore(newNode,oldNode)
		ul21.insertBefore(li15,li13);
		
	*** 不存在 没有insertAfter()方法

	** removeChild方法：删除节点
		- 通过父节点删除，不能自己删除自己
		- /*
			1、获取到li24标签
			2、获取父节点ul标签
			3、执行删除（通过父节点删除）
		*/
		//获取li标签
		var li24 = document.getElementById("li24");
		//获取父节点
		//两种方式  1、通过id获取 ； 2、通过属性 parentNode获取
		var ul31 = document.getElementById("ulid31");
		//删除（通过父节点）
		ul31.removeChild(li24);
	
	** replaceChild(newNode,oldNode)方法: 替换节点
		- 不能自己替换自己，通过父节点替换
		- 两个参数
		** 第一个参数：新的节点（替换成的节点）
		** 第二个参数：旧的节点（被替换的节点）
		- 代码
		/*
			1、获取到li34
			2、创建标签li
			3、创建文本
			4、把文本添加到li下面
			5、获取ul标签（父节点）
			6、执行替换操作 （replaceChild(newNode,oldNode)）
		*/
		//获取li34
		var li34 = document.getElementById("li34");
		//创建li
		var li35 = document.createElement("li");
		//创建文本
		var text35 = document.createTextNode("张无忌");
		//把文本添加到li下面
		li35.appendChild(text35);
		//获取ul
		var ul41 = document.getElementById("ulid41");
		//替换节点
		ul41.replaceChild(li35,li34);
	
	** cloneNode(boolean): 复制节点
		- //把ul列表复制到另外一个div里面
		/*
			1、获取到ul
			2、执行复制方法 cloneNode方法复制 true
			3、把复制之后的内容放到div里面去
				** 获取到div
				** appendChild方法
		*/
		//获取ul
		var ul41 = document.getElementById("ulid41");
		//复制ul，放到类似剪切板里面
		var ulcopy = ul41.cloneNode(true)
		//获取到div
		var divv = document.getElementById("divv");
		//把副本放到div里面去
		divv.appendChild(ulcopy);

	** 操作dom总结
		* 获取节点使用方法
			getElementById()：通过节点的id属性，查找对应节点。
			getElementsByName()：通过节点的name属性，查找对应节点。
			getElementsByTagName()：通过节点名称，查找对应节点
		* 插入节点的方法
			insertBefore方法：在某个节点之前插入
			appendChild方法：在末尾添加，剪切黏贴
		* 删除节点方法
			removeChild方法：通过父节点删除
		* 替换节点方法
			replaceChild方法：通过父节点替换
		
6、innerHTML属性
	* 这个属性不是dom的组成部分，但是大多数浏览器都支持的属性

	第一个作用：获取文本内容
		*** //获取span标签
		var span1 = document.getElementById("sid");
		alert(span1.innerHTML);

	第二个作用：向标签里面设置内容（可以是html代码）
		*** //向div里面设置内容 <h1>AAAAA</h1>
		//获取到div
		var div11 = document.getElementById("div11");
		//设置内容
		div11.innerHTML = "<h1>AAAAA</h1>";
	
	** 练习 ： 向div里面添加一个表格
		- //向div里面添加一个表格
		//var tab = "<table border='1'><tr><td>aaaaaa</td></tr><tr><td>bbbbbb</td></tr><tr><td>cccccc</td></tr></table>";
		
		var tab = "<table>";
		tab += "</table>";

		//相当于 var tab = "<table></table>";

		div11.innerHTML = tab;

7、案例二：动态显示时间
	* 得到当前的时间 
		var date = new Date();  //得到不是常规的格式
		var d1 = date.toLocaleString(); //格式化
	* 需要让页面每一秒获取时间
		setInterval方法 定时器
	* 显示到页面上
		每一秒向div里面写一次时间
		* 使用innerHTML属性
	* 代码
	function getD1() {
		//当前时间
		var date = new Date();
		//格式化
		var d1 = date.toLocaleString();
		//获取div
		var div1 = document.getElementById("times");
		div1.innerHTML = d1;
	}

	//使用定时器实现每一秒写一次时间
	setInterval("getD1();",1000);
                                           
8、案例三：全选练习
	** 使用复选框上面一个属性判断是否选中
		- checked属性
		- checked=true：选中
		- checked=false：不选中

	* 创建一个页面
		** 复选框和按钮
			- 四个复选框表示爱好
			- 还有一个复选框操作 全选和选不选，也有一个事件

		** 三个按钮，分别有事件
			- 全选				
			- 全不选
			- 反选
	* 全选操作
		步骤：
		/*
			1、获取要操作的复选框 
				- 使用getElementsByName()
			2、返回是数组，
				- 属性 checked判断复选框是否选中
					*** checked = true; //表示选中
					*** checked = false;//表示不选中
				- 遍历数组，得到的是每一个checkbox
					* 把每一个checkbox属性checked=true					
		*/

	* 全不选操作
		步骤
		/*
			1、获取到要操作的复选框
			2、返回的是数组，遍历数组
			3、得到每一个复选框
			4、设置复选框的属性 checked=false
		*/

	* 反选操作
		步骤
		/*
			1、获取到要操作的复选框
			2、返回数组，遍历数组
			3、得到每一个复选框

			4、判断当前的复选框是选中还是不选中
				- if(love1.checked == true) {}
			5、如果选中，属性checked设置成false，否则，设置成true
		*/

	* 使用复选框实现全选和全不选
		步骤
		/*
			1、得到上面那个复选框
				- 通过id获取到
			2、判断这个复选框是否是选中
				- if条件，checked==true
			3、如果是选中，下面是全选
			4、如果不是选中，下面是全不选
		*/

9、案例四：下拉列表左右选择
	* 下拉选择框
		<select>
			<option>111</option>
			<option>111</option>
		</select>

	* 创建一个页面
		** 两个下拉选择框
			- 设置属性 multiple属性
		** 四个按钮，有事件
	
	* 选中添加到右边
		步骤
		/*
			1、获取select1里面的option
				- getElementsByTagName()返回是数组
				- 遍历数组，得到每一个option
			2、判断option是否被选中
				- 属性 selected，判断是否被选中
					** selected= true: 选中
					** selected= false：没有选择
			3、如果是选中，把选择的添加到右边去
			4、得到select2
			4、添加选择的部分
				- appendChild方法
		*/
	
	* 全部添加到右边
		步骤
		/*
			1、获取第一个select下面的option对象
			2、返回数组，遍历数组
			3、得到每一个option对象
			4、得到select2
			5、添加到select2下面
				- appendChild方法
		*/
	
	* 选中添加到左边
		步骤
		/*
			1、获取select2里面的option对象
			2、返回是数组，遍历数组
			3、得到每一个option对象
			4、判断option是否被选中
				- if条件 属性 selected == true：选择
			5、获取select1
			6、添加到select1里面
				- 使用appendChild方法
		*/

	* 全部添加到左边
		步骤
		/*
			1、获取select2里面的option对象
			2、返回是数组，遍历数组
			3、得到每一个option对象

			4、获取到select1
			5、添加到select1里面
				- 使用appendChild方法
		*/

10、案例五：省市联动
	* 创建一个页面，有两个下拉选择框
	* 在第一个下拉框里面有一个事件 ：改变事件 onchange事件
		- 方法add1(this.value);表示当前改变的option里面的value值
	* 创建一个二维数组，存储数据
		* 每个数组中第一个元素是国家名称，后面的元素是国家里面的城市
　　　　*	
	/*
		1、遍历二维数组
		2、得到也是一个数组（国家对应关系）

		3、拿到数组中的第一个值和传递过来的值做比较
		4、如果相同，获取到第一个值后面的元素
		5、得到city的select
		6、添加过去（使用）appendChild方法
			- 创建option（三步）
	*/

	/*
		由于每次都要向city里面添加option
		第二次添加，会追加。

		* 每次添加之前，判断一下city里面是否有option，如果有，删除
	*/

11、案例六：动态生成表格
	*创建一个页面：两个输入框和一个按钮

	*代码和步骤
	/*
		1、得到输入的行和列的值
		2、生成表格
			** 循环行
			** 在行里面循环单元格
		3、显示到页面上
			- 把表格的代码设置到div里面
			- 使用innerHTML属性
	*/
	//获取输入的行和列
	var h = document.getElementById("h").value;
	var l = document.getElementById("l").value;

	//把表格代码放到一个变量里面
	var tab = "<table border='1' bordercolor='blue'>";
	//循环行
	for(var i=1;i<=h;i++) {
		tab += "<tr>";
		//循环单元格
		for(var j=1;j<=l;j++) {
			tab += "<td>aaaaaaa</td>"
		}
		tab += "</tr>";
	}

	tab += "</table>";

	//alert(tab);
	//得到div标签
	var divv = document.getElementById("divv");
	//把table的代码设置到div里面去
	divv.innerHTML = tab;
}




