
day02

�������ݻع�
	1��html�Ĳ���˼��
		** ʹ�ñ�ǩ��Ҫ���������ݰ�������ͨ���޸ı�ǩ������ֵ��ʵ�ֱ�ǩ��������ʽ�ı仯
		*** <font size="5"></font>
	
	2��ͼ���ǩ
		<img src="ͼƬ��·��"/>
		** ͨ��html���ʱ���ͼƬ��ʹ�þ���·����Ŀǰ������
	
	3�������ӱ�ǩ
		<a href="" target="_blank"></a>

	4������ǩ
		** ���ɣ��������ж����У�ÿ�������ж��ٸ���Ԫ��
		** <table></table>
			<tr>  <td>  <th>

	5������ǩ
		** <form></form>
			- action  method  enctype
			- method: get post

		** ������
			*** ��name����
			* ��ͨ������ type="text"
			* ���룺 password
			* ��ѡ��radio	
				- nameֵ��ͬ
				- valueֵ
			* ��ѡ��checkbox
				- nameֵ��ͬ
				- valueֵ
			
			* ������ select option
			* �ı��� textarea
			* �����type="hidden"
			* �ļ��� type="file"

			* �ύ��ť type="submit"
			* ���� �� reset
			* ʹ��ͼƬ�ύ�� <input type="image" src=""/>
			* ��ͨ��ť type="button"

	6��div��span
		* div: �Զ�����
		* span����һ����ʾ


CSS

1��css�ļ��
	* css�� �����ʽ��
		** �����һ��һ���

		** ��ʽ��
			�ܶ�����Ժ�����ֵ
	* ��ҳ����ʾЧ�����Ӻ�
	* CSS����ҳ���ݺ���ʾ��ʽ���з��룬�������ʾ���ܡ�

2��css��html�Ľ�Ϸ�ʽ�����ֽ�Ϸ�ʽ��
	��1����ÿ��html��ǩ���涼��һ������ style����css��html�����һ��
		- <div style="background-color:red;color:green;">

	��2��ʹ��html��һ����ǩʵ�� <style>��ǩ��д��head����
		* <style type="text/css">
			css����;
		</style>

		*   <style type="text/css">	
			div {
				background-color:blue;
				color: red;
			}		
		 </style>

	��3����style��ǩ���� ʹ����䣨��ĳЩ������²������ã�
		@import url(css�ļ���·��);

		- ��һ��������һ��css�ļ�

		  <style type="text/css">
				@import url(div.css);
		  </style>

	��4��ʹ��ͷ��ǩ link�������ⲿcss�ļ�
		- ��һ�� ������һ��css�ļ�

		- <link rel="stylesheet" type="text/css" href="css�ļ���·��" />
	
	*** �����ֽ�Ϸ�ʽ��ȱ�㣺��ĳЩ������²������ã�һ��ʹ�õ����ַ�ʽ

	*** ���ȼ���һ�������
		���ϵ��£����⵽�ڡ����ȼ��ɵ͵��ߡ�
		*** ����ص����ȼ���

	*** ��ʽ  ѡ�������� { ������������ֵ��������������ֵ������.}

3��css�Ļ���ѡ���������֣�
	** Ҫ���ĸ���ǩ��������ݽ��в���
	
	��1����ǩѡ����
		* ʹ�ñ�ǩ����Ϊѡ���������� 
			div {
	
				background-color:gray;
				
				color:white;
			}

	��2��classѡ����
		* ÿ��html��ǩ����һ������ class 
		- <div class="haha">aaaaaaa</div>
		- .haha {
			background-color: orange;
		 }
	
	��3��idѡ����
		* ÿ��html��ǩ������һ������ id
		- <div id="hehe">bbbbb</div>
		- #hehe {
			background-color: #333300;
		}
	*** ���ȼ�
		style > idѡ���� > classѡ���� > ��ǩѡ����

4��css����չѡ����
	��1������ѡ����
		* <div><p>wwwwwwww</p></div>
		* ����div��ǩ����p��ǩ����ʽ��Ƕ�ױ�ǩ�������ʽ
		* div p {	
			background-color: green;
		}
	
	��2�����ѡ����
		* <div>1111</div>
		  <p>22222</p>
		* ��div��p��ǩ���ó���ͬ����ʽ���Ѳ�ͬ�ı�ǩ���ó���ͬ����ʽ
		* div,p {
			background-color: orange;
		}
	
	��3��αԪ��ѡ����(�˽⣬������ļ����ԱȽϲ�)
		* css�����ṩ��һЩ����õ���ʽ�������ù���ʹ��
		* ���糬���� 
			** �����ӵ�״̬
			ԭʼ״̬   ������ȥ״̬  ���           ���֮��
			 :link         :hover        :active        :visited

			 ** ����ķ���
				lv  ha

5��css�ĺ���ģ��
	** �ڽ��в���ǰ��Ҫ�����ݷ�װ��һ��һ��������ڣ�div��
	��1���߿�
		border: 2px solid blue;
		border��ͳһ����
		�� border-top
		�� border-bottom
		�� border-left
		�� border-right

	��2���ڱ߾�
		padding:20px;
		ʹ��paddingͳһ����
		Ҳ���Էֱ�����
		���������ĸ��ڱ߾�

	��3����߾�
		margin: 20px;
		����ʹ��marginͳһ����
		Ҳ���Էֱ�����
		���������ĸ���߾�

6��css�Ĳ��ֵ�Ư��(�˽�)
	float�� 
		** ����ֵ 
		left  :�� �ı����������ұ� 
		right  :�� �ı������������

7��css�Ĳ��ֵĶ�λ���˽⣩
	position��
		** ����ֵ
			- absolute ��
				 *** ��������ĵ������ϳ�
				 *** ������top��bottom�����Խ��ж�λ
				 *** ����������ҳ��
			- relative ��
				*** ����Ѷ�����ĵ������ϳ�
				*** ����ʹ��top��bottom�����Խ��ж�λ
				*** ����ڸ���Ԫ�ؽ��ж�λ

8������ ͼ�Ļ��Ű���
	** ͼƬ��������һ����ʾ

9������ ͼ��ǩ��
	** ��ͼƬ������ʾ����

10�����������ܽ�
	1��css��html�����ֽ�Ϸ�ʽ��****��

	2��css�Ļ���ѡ������****��
		* ��ǩѡ���� ʹ�ñ�ǩ��
		* classѡ���� .����
		* idѡ����  #����

		** ���ȼ�
			style > id > class > ��ǩ
	
	3��css����չѡ����(�˽�)
		* ����ѡ����
			- ����Ƕ�ױ�ǩ����ʽ  div p {}
		* ���ѡ����
			- ��ͬ�ı�ǩ������ͬ����ʽ div,p{}
		* αԪ��ѡ����
			* �����ӵ�״̬
				- ԭʼ :link
				- ��ͣ :hover
				- ��� :active
				- ���֮�� :visited

	4������ģ��(�˽�)
		* �߿� border:2px solid red;
		��������  border-top  border-bottom  border-left  border-right

		* �ڱ߾� padding:20px
		��������

		* ��߾� margin:20px
		��������
		
		* �����ݽ��в�������Ҫ�����ݷŵ�һ���������棨div��
	
	5�����ֵ�Ư��(�˽�)
		float
			- left: �����div���ұ�
			- right�������div�����
	
	6�����ֵĶ�λ(�˽�)
		position
			- absolute
				** ���ĵ������ϳ�
			- relative
				** ������ĵ������ϳ�

һ����Ŀ¼���棬�������
	��********�����ص㣬���뿴���������д���������
		- ��****�ص��е��ص�***��
	���˽⣩�����뿴��
	����⣩���ܹ���ԭ�����

