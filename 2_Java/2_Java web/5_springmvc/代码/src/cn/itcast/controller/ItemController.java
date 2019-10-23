package cn.itcast.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.itcast.exception.MyException;
import cn.itcast.pojo.Items;
import cn.itcast.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;

	/*
	 * ��ѯ������Ʒ
	 */
	@RequestMapping("/itemList")
	public ModelAndView queryItemList() throws MyException {

		// //�����쳣
		// //�Զ����쳣
		// if(true) {
		// throw new MyException("�Զ����쳣");
		// }
		// //����ʱ�쳣
		// int a= 1/0;

		// ��ȡ��Ʒ����
		List<Items> list = this.itemService.queryItemList();

		ModelAndView modelAndView = new ModelAndView();
		// �����ݷŵ�ģ����
		modelAndView.addObject("itemList", list);
		// �����߼���ͼ
		modelAndView.setViewName("itemList");

		return modelAndView;
	}

	/*
	 * ����id��ѯ��Ʒ
	 */
	// @RequestMapping("/itemEdit")
	// public ModelAndView queryItemById(HttpServletRequest request) {
	// //��request�л�ȡid
	// String strId= request.getParameter("id");
	// Integer id = Integer.valueOf(strId);
	// //����id��ѯ��Ʒ����
	// Items item = this.itemService.queryItemById(id);
	// ModelAndView modelAndView = new ModelAndView();
	// modelAndView.addObject("item", item);
	// modelAndView.setViewName("itemEdit");
	// return modelAndView;
	// }

	/*
	 * ����id��ѯ��Ʒ
	 */
	@RequestMapping("/itemEdit")
	public String queryItemById(int id, ModelMap model) {
		// ����id��ѯ��Ʒ����
		Items item = this.itemService.queryItemById(id);
		model.addAttribute("item", item);
		return "editItem";
	}

	/*
	 * ������Ʒ����pojo����
	 */
	@RequestMapping("/updateItem")
	public String UpdateItem(Items item, MultipartFile pictureFile) throws IllegalStateException, IOException {
		// ͼƬ�ϴ�
		// ����ͼƬ����
		String picName = UUID.randomUUID().toString();
		// ��ȡ�ļ���
		String oriName = pictureFile.getOriginalFilename();
		// ��ȡͼƬ��׺
		String extName = oriName.substring(oriName.lastIndexOf("."));

		// ͼƬ�ϴ�
		pictureFile.transferTo(new File("F:\\JavaEE_WorkSpace\\upload\\image\\" + picName + "." + extName));
		
		//����һͼƬ������Ʒ��
		item.setPic(picName + "." + extName);
		
		//������Ʒ
		this.itemService.updateItemById(item);
//		return "redirect:/itemEdit.action?id=" + item.getId();
		return "forward:/itemEdit.action";
	}
	
	//json���ݽ���
	@RequestMapping(value= "/json.action")
	public @ResponseBody Items json(@RequestBody Items item) {
		return item;
	}
	
}
