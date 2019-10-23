
day06

上节内容回顾
	1、表单的提交方式
		* button提交：
			** 获取到form
			** 执行submit方法
		
		* 超链接提交
			** 地址?username=1234
		
		* onclick
		  onchange
		  onfocus: 获取焦点
		  onblur：失去焦点
	
	2、xml的语法
		* 文档声明，放在第一行第一列
		* 乱码问题：保存时候编码和设置编码一致
		
		* 注释 <!-- -->
			** 不能嵌套
		
	3、xml的约束
		dtd 和 scheam

	4、dtd约束元素
		(#PCDATA): 字符串
		EMPTY: 空
		ANY:任意
	5、复杂元素
		(a,b,c) : 按顺序出现
		(a|b|c) : 只能出现其中的一个

		* 出现的次数
			+: 一次或者多次
			?: 零次或者一次
			*: 零次 一次 或者多次
	6、属性的定义
		** CDATA: 字符串
		** 枚举：只能出现一个范围中的任意一个 (a|b|c)
		** ID: 字母和下划线开头
	
	7、dtd的引入
		三种方式
		** 引入dtd文件
		** 内部引入dtd
		** 公共的dtd 
	
	8、xml的解析技术 dom和sax
		** sun公司 jaxp
		** dom4j（重点要学）
		** jdom
	
	9、使用jaxp操作xml
		** 查询操作
			getElementsByTagName
			getTextContext
		
		** 查询到某一个元素值
			下标获取，item
		
		** 添加操作
			创建标签 createElement
			创建文本 createTextNode
			把文本添加到标签下面 appendChild

			** 回写xml
		
		** 修改操作
			setTextContent方法
			** 回写xml
		
		** 删除操作
			removeChild方法
			-- 通过父节点删除
			** 回写xml
		
		** 查询所有的元素的名称
			查询元素下面的子节点 使用方法  getChildNodes
		

1、schema约束
	dtd语法： <!ELEMENT 元素名称 约束>
	** schema符合xml的语法，xml语句
	** 一个xml中可以有多个schema，多个schema使用名称空间区分（类似于java包名）
	** dtd里面有PCDATA类型，但是在schema里面可以支持更多的数据类型
		*** 比如 年龄 只能是整数，在schema可以直接定义一个整数类型
	*** schema语法更加复杂，schema目前不能替代dtd

2、schema的快速入门
	* 创建一个schema文件 后缀名是 .xsd
		** 根节点 <schema>
	** 在schema文件里面
		** 属性  xmlns="http://www.w3.org/2001/XMLSchema"
			- 表示当前xml文件是一个约束文件
		** targetNamespace="http://www.itcast.cn/20151111"
			- 使用schema约束文件，直接通过这个地址引入约束文件
		** elementFormDefault="qualified"
	步骤
		（1）看xml中有多少个元素
			<element>
		（2）看简单元素和复杂元素
			* 如果复杂元素
				<complexType>
					<sequence>
						子元素
					</sequence>
				</complexType>
		（3）简单元素，写在复杂元素的
			<element name="person">
			<complexType>
			<sequence>
					<element name="name" type="string"></element>
					<element name="age" type="int"></element>
			</sequence>
			</complexType>
			</element>

		（4）在被约束文件里面引入约束文件
			<person xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xmlns="http://www.itcast.cn/20151111"
			xsi:schemaLocation="http://www.itcast.cn/20151111 1.xsd">

			** xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				-- 表示xml是一个被约束文件
			** xmlns="http://www.itcast.cn/20151111"
				-- 是约束文档里面 targetNamespace
			** xsi:schemaLocation="http://www.itcast.cn/20151111 1.xsd">
				-- targetNamespace 空格  约束文档的地址路径
		

	* <sequence>：表示元素的出现的顺序
	<all>: 元素只能出现一次
	<choice>：元素只能出现其中的一个
	maxOccurs="unbounded"： 表示元素的出现的次数,unbounded表示无限次数
	<any></any>:表示任意元素

	* 可以约束属性
		* 写在复杂元素里面
		***写在　</complexType>之前
		－－
		<attribute name="id1" type="int" use="required"></attribute>
			- name: 属性名称
			- type：属性类型 int stirng
			- use：属性是否必须出现 required

	* 复杂的schema约束
		<company xmlns = "http://www.example.org/company"
			xmlns:dept="http://www.example.org/department"
			xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance"
			xsi:schemaLocation="http://www.example.org/company company.xsd http://www.example.org/department department.xsd" 
		>
	
	* 引入多个schema文件，可以给每个起一个别名

	<employee age="30">
		<!-- 部门名称 --> 
		<dept:name>100</dept:name>
		* 想要引入部门的约束文件里面的name，使用部门的别名 detp:元素名称
		<!-- 员工名称 -->
		<name>王晓晓</name>   
	</employee>

3、sax解析的原理（********）
	* 解析xml有两种技术 dom 和sax

	* 根据xml的层级结构在内存中分配一个树形结构
	** 把xml中标签，属性，文本封装成对象

	* sax方式：事件驱动，边读边解析
	* 在javax.xml.parsers包里面
		** SAXParser
			此类的实例可以从 SAXParserFactory.newSAXParser() 方法获得
			- parse(File f, DefaultHandler dh) 
				* 两个参数
				** 第一个参数：xml的路径
				** 事件处理器

		** SAXParserFactory
			实例 newInstance() 方法得到
	* 画图分析一下sax执行过程
		* 当解析到开始标签时候，自动执行startElement方法
		* 当解析到文本时候，自动执行characters方法
		* 当解析到结束标签时候，自动执行endElement方法

4、使用jaxp的sax方式解析xml（**会写***）	
	* sax方式不能实现增删改操作，只能做查询操作
	** 打印出整个文档
	*** 执行parse方法，第一个参数xml路径，第二个参数是 事件处理器
		*** 创建一个类，继承事件处理器的类，
		***重写里面的三个方法
	
	 * 获取到所有的name元素的值
		** 定义一个成员变量 flag= false
		** 判断开始方法是否是name元素，如果是name元素，把flag值设置成true
		** 如果flag值是true，在characters方法里面打印内容
		** 当执行到结束方法时候，把flag值设置成false

	 * 获取第一个name元的值素
		** 定义一个成员变量 idx=1
		** 在结束方法时候，idx+1 idx++
		** 想要打印出第一个name元素的值，
			- 在characters方法里面判断，
			-- 判断flag=true 并且 idx==1，在打印内容

5、使用dom4j解析xml
	* dom4j，是一个组织，针对xml解析，提供解析器 dom4j

	* dom4j不是javase的一部分，想要使用第一步需要怎么做？
		*** 导入dom4j提供jar包
		-- 创建一个文件夹 lib
		-- 复制jar包到lib下面，
		-- 右键点击jar包，build path -- add to build path
		-- 看到jar包，变成奶瓶样子，表示导入成功
	
	* 得到document
		 SAXReader reader = new SAXReader();
	         Document document = reader.read(url);
	* document的父接口是Node
		* 如果在document里面找不到想要的方法，到Node里面去找

	* document里面的方法 getRootElement() ：获取根节点 返回的是Element

	* Element也是一个接口，父接口是Node
		- Element和Node里面方法
		** getParent()：获取父节点
		** addElement：添加标签

		* element(qname)
			** 表示获取标签下面的第一个子标签
			** qname：标签的名称
		* elements(qname)
			** 获取标签下面是这个名称的所有子标签（一层）
			** qname：标签名称
		* elements()
			** 获取标签下面的所有一层子标签

6、使用dom4j查询xml	
	* 解析是从上到下解析
	* 查询所有name元素里面的值
		/*
			1、创建解析器
			2、得到document
			3、得到根节点  getRootElement() 返回Element

			4、得到所有的p1标签
				* elements("p1") 返回list集合
				* 遍历list得到每一个p1
			5、得到name
				* 在p1下面执行 element("name")方法 返回Element
			6、得到name里面的值
				* getText方法得到值
		*/
	
	* 查询第一个name元素的值
		/*
		 * 1、创建解析器
		 * 2、得到document
		 * 3、得到根节点
		 * 
		 * 4、得到第一个p1元素  
			** element("p1")方法 返回Element
		 * 5、得到p1下面的name元素
			** element("name")方法 返回Element
		 * 6、得到name元素里面的值
			** getText方法
		 * */
	* 获取第二个name元素的值
		/*
		 * 1、创建解析器
		 * 2、得到document
		 * 3、得到根节点
		 * 
		 *  4、得到所有的p1 
			** 返回 list集合
		 *  5、遍历得到第二个p1
			** 使用list下标得到 get方法，集合的下标从 0 开始，想要得到第二个值，下标写 1 
		 *  6、得到第二个p1下面的name
			** element("name")方法 返回Element
		 *  7、得到name的值
			** getText方法
		 * */
		
7、使用dom4j实现添加操作
	* 在第一个p1标签末尾添加一个元素 <sex>nv</sex>
	* 步骤
		/*
		 * 1、创建解析器
		 * 2、得到document
		 * 3、得到根节点
		 * 
		 * 4、获取到第一个p1
			* 使用element方法
		 * 5、在p1下面添加元素
			* 在p1上面直接使用 addElement("标签名称")方法 返回一个Element

		 * 6、在添加完成之后的元素下面添加文本
		 *	在sex上直接使用 setText("文本内容")方法
		 * 7、回写xml
			* 格式化 OutputFormat,使用 createPrettyPrint方法，表示一个漂亮的格式
			* 使用类XMLWriter 直接new 这个类 ，传递两个参数
				*** 第一个参数是xml文件路径 new FileOutputStream("路径")
				*** 第二个参数是格式化类的值
		 * */

8、使用dom4j实现在特定位置添加元素 
	* 在第一个p1下面的age标签之前添加 <school>ecit.edu.cn</schlool>
	* 步骤
	    /*
		 * 1、创建解析器
		 * 2、得到document
		 * 3、得到根节点
		 * 4、获取到第一个p1
		 * 
		 * 5、获取p1下面的所有的元素
		 * 		** elements()方法 返回 list集合

		 *      ** 使用list里面的方法，在特定位置添加元素
		 *		** 首先创建元素 在元素下面创建文本
					- 使用DocumentHelper类方法createElement创建标签
					- 把文本添加到标签下面 使用 setText("文本内容")方法

		 *      	*** list集合里面的 add(int index, E element)
		 *      		- 第一个参数是 位置 下标，从0开始
		 *      		- 第二个参数是 要添加的元素
		 * 6、回写xml
		 * */

	** 可以对得到document的操作和 回写xml的操作，封装成方法
	** 也可以把传递的文件路径，封装成一个常量
	*** 好处：可以提高开发速度，可以提交代码可维护性
		- 比如想要修改文件路径（名称），这个时候只需要修改常量的值就可以了，其他代码不需要做任何改变

9、使用dom4j实现修改节点的操作
	* 修改第一个p1下面的age元素的值 <age>30</age>
	* 步骤
	/*
		 * 1、得到document
		 * 2、得到根节点，然后再得到第一个p1元素
		 * 3、得到第一个p1下面的age
			element("")方法
		 * 4、修改值是 30
		 *	* 使用setText("文本内容")方法
		 * 5、回写xml
		 * 
		 * */

10、使用dom4j实现删除节点的操作
	* 删除第一个p1下面的<school>ecit</school>元素
	* 步骤
	/*
		 * 1、得到document
		 * 2、得到根节点
		 * 3、得到第一个p1标签
		 * 4、得到第一个p1下面的school元素

		 * 5、删除（使用p1删除school）
		 *	* 得到school的父节点
				- 第一种直接得到p1
				- 使用方法 getParent方法得到
			* 删除操作
				- 在p1上面执行remove方法删除节点
		 * 6、回写xml
		 * */

11、使用dom4j获取属性的操作
	* 获取第一个p1里面的属性id1的值
	* 步骤
	/*
		 * 1、得到document
		 * 2、得到根节点
		 * 3、得到第一个p1元素
		 * 4、得到p1里面的属性值
			- p1.attributeValue("id1");
			- 在p1上面执行这个方法，里面的参数是属性名称
		 * */

12、使用dom4j支持xpath的操作
	* 可以直接获取到某个元素 

	* 第一种形式
		/AAA/DDD/BBB： 表示一层一层的，AAA下面 DDD下面的BBB
	* 第二种形式
		//BBB： 表示和这个名称相同，表示只要名称是BBB，都得到
	* 第三种形式
		/*: 所有元素
	* 第四种形式
		**　BBB[1]：　表示第一个BBB元素
		××　BBB[last()]：表示最后一个BBB元素
	* 第五种形式
		** //BBB[@id]： 表示只要BBB元素上面有id属性，都得到
	* 第六种形式
		** //BBB[@id='b1'] 表示元素名称是BBB,在BBB上面有id属性，并且id的属性值是b1

13、使用dom4j支持xpath具体操作
	** 默认的情况下，dom4j不支持xpath
	** 如果想要在dom4j里面是有xpath
		* 第一步需要，引入支持xpath的jar包，使用 jaxen-1.1-beta-6.jar
		** 需要把jar包导入到项目中

	** 在dom4j里面提供了两个方法，用来支持xpath
		*** selectNodes("xpath表达式")
			- 获取多个节点
		*** selectSingleNode("xpath表达式")
			- 获取一个节点

	** 使用xpath实现：查询xml中所有name元素的值
		** 所有name元素的xpath表示： //name
		** 使用selectNodes("//name");
		** 代码和步骤
		/*
		 * 1、得到document
		 * 2、直接使用selectNodes("//name")方法得到所有的name元素
		 * 
		 * */
			//得到document
			Document document = Dom4jUtils.getDocument(Dom4jUtils.PATH);
			//使用selectNodes("//name")方法得到所有的name元素
			List<Node> list = document.selectNodes("//name");
			//遍历list集合
			for (Node node : list) {
				//node是每一个name元素
				//得到name元素里面的值
				String s = node.getText();
				System.out.println(s);
			}
	
	** 使用xpath实现：获取第一个p1下面的name的值
		* //p1[@id1='aaaa']/name
		* 使用到 selectSingleNode("//p1[@id1='aaaa']/name")
		* 步骤和代码
		/*
		 * 1、得到document
		 * 2、直接使用selectSingleNode方法实现
		 * 	- xpath ： //p1[@id1='aaaa']/name
		 * */
		//得到document
		Document document = Dom4jUtils.getDocument(Dom4jUtils.PATH);
		//直接使用selectSingleNode方法实现
		Node name1 = document.selectSingleNode("//p1[@id1='aaaa']/name"); //name的元素
		//得到name里面的值
		String s1 = name1.getText();
		System.out.println(s1);

14、实现简单的学生管理系统
	** 使用xml当做数据，存储学生信息

	** 创建一个xml文件，写一些学生信息

	** 增加操作
		/*
		 * 1、创建解析器
		 * 2、得到document
		 * 3、获取到根节点
		 * 4、在根节点上面创建stu标签
		 * 5、在stu标签上面依次添加id name age
			** addElement方法添加
		 * 6、在id name age上面依次添加值
		 *	** setText方法
		 * 7、回写xml
		 * */

	** 删除操作（根据id删除）
		/*
		 * 1、创建解析器
		 * 2、得到document
		 * 
		 * 3、获取到所有的id	
		 * 	使用xpath //id 返回 list集合
		 * 4、遍历list集合
		 * 5、判断集合里面的id和传递的id是否相同
		 * 6、如果相同，把id所在的stu删除
		 * 
		 * */
		
	** 查询操作（根据id查询）
		/*
		 * 1、创建解析器
		 * 2、得到document
		 * 
		 * 3、获取到所有的id
		 * 4、返回的是list集合，遍历list集合
		 * 5、得到每一个id的节点
		 * 6、id节点的值
		 * 7、判断id的值和传递的id值是否相同
		 * 8、如果相同，先获取到id的父节点stu
		 * 9、通过stu获取到name age值

		 ** 把这些值封装到一个对象里面 返回对象
		 * 
		 * */

