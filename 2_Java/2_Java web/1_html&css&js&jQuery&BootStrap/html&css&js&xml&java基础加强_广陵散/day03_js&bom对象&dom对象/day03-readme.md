
day03

�Ͻ����ݻع�
	1��html�ı���ǩ
		<form>:
			** action method enctype
		�����
			** type="text"
			** passwrod
			** radio
			** checkbox
			** file
			** submit
			** reset
			** type="image" src=""
			** select
			** textarea
			** type=��button��
			** hidden
	
	2��css	
		** css��html�Ľ�Ϸ�ʽ�����֣�
			��1���ڱ�ǩ����style
			��2��ʹ�ñ�ǩ<style>
			��3�� ʹ��@import url()
			��4��linkͷ��ǩʵ��

		** css�Ļ���ѡ���������֣�
			��1����ǩѡ����
			��2��classѡ���� .����
			��3��idѡ����  #����
	
	3��javascript
		** java��javascript����

		** jsԭʼ���ͣ������
			string number  boolean  null  undifined
			ʹ��var
		** js�����
			if switch while for do-while
		
		** js�����
			* == �� === ����
		
		** js������
			** ������ʽ�����֣�
				var arr1 = [1,2,3,"4"];
				var arr2 = new Array(3);
				var arr3 = new Array(4,5,6);
			** ���� length������
		
		** js�ĺ���
			** ���巽ʽ�����֣�
				function add1(){}
				function(){}
		
		** js��ȫ�ֱ����;ֲ�����
			** ȫ�ֱ�������ҳ����κ�js�Ĳ��ֶ�����ʹ��
			** �ֲ��������ڷ����ڲ�����ı�����ֻ���ڷ����ڲ�ʹ��
		
		** script��ǩӦ�÷���ʲôλ�� </body>

1��js��String����
	** ����String����
		*** var str = "abc";
	
	** ���������ԣ��ĵ���
		*** ���� length���ַ����ĳ���

		*** ����
		��1����html��صķ���
			- bold()���Ӵ�
			- fontcolor(): �����ַ�������ɫ
			- fontsize(): ��������Ĵ�С

			- link(): ���ַ�����ʾ�ɳ�����
				**** str4.link("hello.html")
			
			- sub() sup(): �±���ϱ�

		��2����java���Ƶķ���
			- concat(): �����ַ���
				** //concat����
				var str1 = "abc";
				var str2 = "dfg";
				document.write(str1.concat(str2));

			- charAt():����ָ��ָ��λ�õ��ַ���
				** var str3 = "abcdefg";
				document.write(str3.charAt(20)); //�ַ�λ�ò����ڣ����ؿ��ַ���
			
			- indexOf()�� �����ַ���λ��
				** var str4 = "poiuyt";
				document.write(str4.indexOf("w")); //�ַ������ڣ�����-1
			
			- split()���з��ַ�����������
				** var str5 = "a-b-c-d";
				var arr1 = str5.split("-");
				document.write("length: "+arr1.length);
			
			- replace() �� �滻�ַ���
				* ��������������
					-- ��һ��������ԭʼ�ַ�
					-- Ҫ�滻�ɵ��ַ�
				* var str6 = "abcd";
				document.write(str6);
				document.write("<br/>");
				document.write(str6.replace("a","Q"));
			
			- substr()��substring()
				* var str7 = "abcdefghuiop";
				//document.write(str7.substr(5,5));  //fghui  �ӵ���λ��ʼ������ȡ����ַ�
					*** �ӵڼ�λ��ʼ������ȡ��λ

				document.write("<br/>");
				document.write(str7.substring(3,5)); //de  �ӵڼ�λ��ʼ���ڼ�λ����  [3,5)
					*** �ӵڼ�λ��ʼ�����ڼ�λ���������ǲ����������һλ
			
2��js��Array����
	** �������飨���֣�
		- var arr1 = [1,2,3];
		- var arr2 = new Array(3); //������3
		- var arr3 = new Array(1,2,3); //�����е�Ԫ����1 2 3

		- var arr = [];  //����һ��������
	
	** ���ԣ�length���鿴����ĳ���

	** ����
		- concat������ ���������
			* var arr11 = [1,2,3];
			var arr12 = [4,5,6];
			document.write(arr11.concat(arr12));

		- join()������ָ�����ַ��ָ�����
			* var arr13 = new Array(3);
			arr13[0] = "a";
			arr13[1] = "b";
			arr13[2] = "c";

			document.write(arr13);
			document.write("<br/>");
			document.write(arr13.join("-"));
		
		- push():������ĩβ���Ԫ�أ�����������µĳ���
			** �����ӵ���һ�����飬���ʱ������鵱��һ�������ַ�����ӽ�ȥ

			* //push����
			var arr14 = new Array(3);
			arr14[0] = "tom";
			arr14[1] = "lucy";
			arr14[2] = "jack";
			document.write("old array: "+arr14);

			document.write("<br/>");
			document.write("old length:"+arr14.length);

			document.write("<br/>");
			document.write("new length: "+arr14.push("zhangsan"));

			document.write("<br/>");
			document.write("new array: "+arr14);

			* 		var arr15 = ["aaa","bbb","ccc"];
			var arr16 = ["www","qqq"];

			document.write("old array:"+arr15);
			document.write("<br/>");
			document.write("old length:"+arr15.length);

			document.write("<br/>");
			document.write("new length:"+arr15.push(arr16));
			document.write("<br/>");
			document.write("new array: "+arr15);
			for(var i=0;i<arr15.length;i++) {
				alert(arr15[i]);
			}
		
		- pop()����ʾ ɾ�����һ��Ԫ�أ�����ɾ�����Ǹ�Ԫ��
			* var arr17 = ["zhangsan","lisi","wangwu","zhaoliu"];
			document.write("old array: "+arr17);
			document.write("<br/>");

			document.write("return: "+arr17.pop());
			document.write("<br/>");
			document.write("new array: "+arr17);
		
		- reverse():�ߵ������е�Ԫ�ص�˳��
			* var arr17 = ["zhangsan","lisi","wangwu","zhaoliu"];
			document.write("old array: "+arr17);
			document.write("<br/>");

			document.write("return: "+arr17.pop());
			document.write("<br/>");
			document.write("new array: "+arr17);

			//reverse����
			document.write("<hr/>");
			var arr18 = ["zhangsan1","lisi1","zhaoliu1","niuqi1"];
			document.write("old array: "+arr18);
			document.write("<br/>");
			document.write("new array:"+arr18.reverse());


3��js��Date����
	** ��java�����ȡ��ǰʱ�� 
		Date date = new Date();
		//��ʽ�� 
		//toLocaleString()   //2015��4��17�� 11:17:12
	
	** js�����ȡ��ǰʱ��
		var date = new Date();
		//��ȡ��ǰʱ��
		var date = new Date();
		document.write(date);  // Fri Apr 17 10:47:46 UTC+0800 2015 

		//ת����ϰ�ߵĸ�ʽ
		document.write("<hr/>");
		document.write(date.toLocaleString());
	
	** ��ȡ��ǰ���귽��
		getFullYear()���õ���ǰ����
			**** document.write("year: "+date.getFullYear());
	
	** ��ȡ��ǰ���·���
		getMonth()����ȡ��ǰ����
			*** ���ص��� 0-11�£������Ҫ�õ�׼ȷ��ֵ����1
			**** var date1 = date.getMonth()+1;
			document.write("month: "+date1);
	
	** ��ȡ��ǰ������
		getDay()������,���ص��� (0 ~ 6)
		** ������ѣ�����������Ϊһ�ܵĵ�һ�죬�����շ��ص��� 0
		   ������һ�������� ���ص��� 1-6
		** document.write("week: "+date.getDay());

	** ��ȡ��ǰ����
		getDate()���õ���ǰ���� 1-31
		** document.write("day: "+date.getDate());
	
	** ��ȡ��ǰ��Сʱ
		getHours()����ȡСʱ
		** document.write("hour: "+date.getHours());
	
	** ��ȡ��ǰ�ķ���
		getMinutes()������
		** document.write("minute: "+date.getMinutes());

	** ��ȡ��ǰ����
		getSeconds(): ��
		** document.write("second: "+date.getSeconds());
	
	** ��ȡ������
		getTime()
		���ص���1970 1 1 ����ĺ�����

		** Ӧ�ó�����
			*** ʹ�ú������������Ч�������л��棩
				http://www.baidu.com?������
		
4��js��Math����
	* ��ѧ������
	** ����Ķ��Ǿ�̬������ʹ�ÿ���ֱ��ʹ�� Math.����()

	** ceil(x): ��������

	** floor(x)����������

	** round(x)����������

	** random()���õ��������α�������
		- �õ�0-9�������
			Math.random()*10
			Math.floor(Math.random()*10));
	
5��js��ȫ�ֺ���
	* ���ڲ������κ�һ������ֱ��д����ʹ��

	** eval() �� ִ��js���루����ַ�����һ��js���룬ʹ�÷���ֱ��ִ�У�
		**** var str = "alert('1234');";
		//alert(str);
		eval(str);

	** encodeURI() �����ַ����б��� 
		- %E6%B5%8B%E8%AF%95%E4%B8%AD%E6%96%87aaa1234
	
	   decodeURI()  �����ַ����н���

	   encodeURIComponent() �� decodeURIComponent()
	 
	** isNaN():�жϵ�ǰ�ַ����Ƿ�������
		-- var str2 = "aaaa";
		alert(isNaN(str2));
		*** ��������֣�����false
		*** ����������֣�����true
	
	** parseInt()������ת��
		** var str3 = "123";
		document.write(parseInt(str3)+1);
	
6��js�ĺ���������
	** ʲô�����أ���������ͬ��������ͬ

	** js�������Ƿ���ڣ� ������
		** �������һ������
		** �Ѵ��ݵĲ������浽 arguments��������

	** js�����Ƿ�������أ�(������Ŀ)
		��1��js���治�������ء�
		��2�����ǿ���ͨ��������ʽģ�����ص�Ч�� ��ͨ��aruguments������ʵ�֣�

		*** function add1() {
			//���紫�ݵ�����������
			if(arguments.length == 2) {
				return arguments[0]+arguments[1];

			} else if (arguments.length == 3) {
				return arguments[0]+arguments[1]+arguments[2];

			} else if (arguments.length == 4) {

				return arguments[0]+arguments[1]+arguments[2]+arguments[3];
			} else {
				return 0;
			}
		}

7��js��bom����
	** bom��broswer object model: ���������ģ��

	** ����Щ����
	*** navigator�� ��ȡ�ͻ�������Ϣ�����������Ϣ��
		- navigator.appName
		- document.write(navigator.appName);

	*** screen: ��ȡ��Ļ����Ϣ
		- document.write(screen.width);
		document.write("<br/>");
		document.write(screen.height);

	*** location: ����url��ַ
		- href����
		**** ��ȡ�������url��ַ
			- document.write(location.href);

		**** ����url��ַ
			- ҳ���ϰ���һ����ť����ť�ϰ�һ���¼������ҵ�������ť����ǰҳ�������ת������һ��ҳ��
			- location.href = "hello.html";

		**** <input type="button" value="tiaozhuan" onclick="href1();"/>
			- ������¼�  onclick="js�ķ���;"
		
	*** history�������url����ʷ��¼
		- ��������ҳ��
			1��������һ��ҳ�� a.html дһ�������� �� b.html
			2������b.html ������ �� c.html
			3������c.html

		- �����ʵ���һ��ҳ��
			history.back();
			history.go(-1);

		- �����ʵ���һ��ҳ��
			history.forward();
			history.go(1);

	**** window��****��
		* ���ڶ���
		* ����������õ�bom��������window��������ģ�

		** ����
			- window.alert() : ҳ�浯��һ������ʾ����
				** ��дalert()
			
			- confirm()�� ȷ�Ͽ�
				- var flag = window.confirm("��ʾ������");
			
			- prompt()�� ����ĶԻ���
				- window.prompt("please input : ","0");
				- window.prompt("����ʾ������","����������Ĭ��ֵ");
			
			- open() :����һ���µĴ���
				** open("�򿪵��´��ڵĵ�ַurl","","�������������細�ڿ�Ⱥ͸߶�") 
				- ����һ����ť����������ť����һ���µĴ���
				- window.open("hello.html","","width=200,height=100");
			
			- close(): �رմ���(����������ԱȽϲ�)
				- window.close();
			
			- ����ʱ�� 
			** setInterval("js����",������)  1��=1000����
				- ��ʾÿ���룬ִ��һ��alert����
				window.setInterval("alert('123');",3000);
				
			** setTimeout("js����",������)
				- ��ʾ�ں�����֮��ִ�У�����ֻ��ִ��һ��

				- ��ʾ����֮��ִ��js���룬ֻ��ִ��һ��
				window.setTimeout("alert('abc');",4000);
			
			** clearInterval(): ���setInterval���õĶ�ʱ��
				var id1 = setInterval("alert('123');",3000);//ͨ��setInterval����һ������ֵ
				clearInterval(id1);

			** clearTimeout() : ���setTimeout���õĶ�ʱ��
				var id2 = setTimeout("alert('abc');",4000);
				clearTimeout(id2);

8��js��dom����****��
	* dom��document object model: �ĵ�����ģ��
	** �ĵ���
		���ı��ĵ������ı�����ĵ��� html ��xml
	** ����
		�ṩ�����Ժͷ���
	** ģ�ͣ�ʹ�����Ժͷ����������ı�������ĵ�

	*** ����ʹ��js�����dom�����ṩ�Ķ���ʹ����Щ��������Ժͷ������Ա�����ĵ����в���

	*** ��Ҫ�Ա�����ĵ����в�����������Ҫ �Ա�����ĵ�������������ݷ�װ�ɶ���
		-- ��Ҫ��html����ı�ǩ�����ԡ��ı����ݶ���װ�ɶ���
	
	*** Ҫ��Ա�����ĵ����в���������������ĵ�
		- ��ͼ���������ʹ��dom����html

	*** ��������
		����html�Ĳ㼶�ṹ�����ڴ��з���һ�����νṹ����Ҫ��html�е�ÿ���ַ�װ�ɶ���
		- document���������ĵ�
		- element���󣺱�ǩ����
		- ���Զ���
		- �ı�����

		-- Node�ڵ���������������Щ����ĸ�����
			*** ����ڶ��������Ҳ�����Ҫ�ķ��������ʱ��Node��������ȥ��
	
	DOMģ�������֣�
		DOM level 1����html�ĵ���װ�ɶ���
		DOM level 2����level 1�Ļ���������µĹ��ܣ����磺�����¼���css��ʽ��֧�֡�
		DOM level 3��֧��xml1.0��һЩ�����ԡ�

	* DHTML���Ǻܶ༼���ļ��
		** html: ��װ����
		** css��ʹ�����Ժ�����ֵ������ʽ
		** dom������html�ĵ���������ĵ���
		** javascript��ר��ָ����js���﷨��䣨ECMAScript��
	
9��document����
	* ��ʾ�������ĵ�

	** ���÷���
		**** write()������
			��1����ҳ�����������ֵ��
			��2����ҳ�����html����
			- var str = "abc";
			document.write(str);
			document.write("<hr/>");
		
		**** getElementById();
			- ͨ��id�õ�Ԫ�أ���ǩ��
			- //ʹ��getElementById�õ�input��ǩ
			var input1 = document.getElementById("nameid");  //���ݵĲ����Ǳ�ǩ�����id��ֵ
			//�õ�input�����valueֵ
			alert(input1.name);   //��ǩ����.��������
			//��input��������һ��ֵvalue
			input1.value = "bbbbb";
		
		**** getElementsByName();
			- ͨ����ǩ��name������ֵ�õ���ǩ
			- ���ص���һ�����ϣ����飩
			- //ʹ��getElementsByName�õ�input��ǩ
			var inputs = document.getElementsByName("name1");  //���ݵĲ����� ��ǩ�����name��ֵ
			//alert(inputs.length);
			//��������
			for(var i=0;i<inputs.length;i++) {   //ͨ���������飬�õ�ÿ����ǩ����ľ����ֵ
				var input1 = inputs[i];  //ÿ��ѭ���õ�input���󣬸�ֵ��input1����
				alert(input1.value);    //�õ�ÿ��input��ǩ�����valueֵ
			}
		
		**** getElementsByTagName("��ǩ����");
			- ͨ����ǩ���Ƶõ�Ԫ��
			- //��ʾgetElementsByTagName
			var inputs1 = document.getElementsByTagName("input");  //���ݵĲ������Ǳ�ǩ����
			//alert(inputs1.length);
			//�������飬�õ�ÿ��input��ǩ
			for(var m=0;m<inputs1.length;m++) {
				//�õ�ÿ��input��ǩ
				var input1 = inputs1[m];
				//�õ�valueֵ
				alert(input1.value);
			}

		**** ע��ط�
			**** ֻ��һ����ǩ�������ǩֻ��ʹ��name��ȡ�������ʹ�ã�ʹ��getElementsByName���ص���һ�����飬
			��������ֻ��һ��Ԫ�أ����ʱ����Ҫ���������ǿ���ֱ��ͨ��������±��ȡ��ֵ
			//ͨ��name�õ�input��ǩ
			var inputs2 = document.getElementsByName("name11")[0];
			alert(inputs2.value);

			var inputss = document.getElementsByTagName("input")[0];
			alert(inputss.value);

10��������window��������
	- ʵ�ֹ���
		1������һ��ҳ��
			** �������������һ����ť
			** ��ť������һ���¼�������һ���´��� open

		2����������ҳ��
			** ���
			** ÿһ����һ����ť�ͱ�ź�����
			** ��ť����һ���¼����ѵ�ǰ�ı�ź���������ֵ����һ��ҳ����Ӧ��λ��

			****//ʵ��s1����
			function s1(num1,name1) {
				//��Ҫ��num1��name1��ֵ��windowҳ��
				//��ҳ��Ĳ���  opener���õ�����������ڵĴ��� �õ�windowҳ��
				var pwin = window.opener; //�õ�windowҳ��
				pwin.document.getElementById("numid").value = num1;
				pwin.document.getElementById("nameid").value = name1;
				//�رմ���
				window.close();
			}

			����opener:���ԣ���ȡ������ǰ���ڵĴ���

	- ���������ʱ�����һ������
		*** �����������ڷ��ʵ��Ǳ����ļ���js��ȫ�ԣ��ȸ��������ȫ����ܸߣ���������ʱ����ļ�
		*** ��ʵ�ʿ����У�û�����������⣬ʵ���в����ܷ��ʱ��ص��ļ���
		*** http://www.baidu.com

