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
	 * 查询所有商品
	 */
	@RequestMapping("/itemList")
	public ModelAndView queryItemList() throws MyException {

		// //测试异常
		// //自定义异常
		// if(true) {
		// throw new MyException("自定义异常");
		// }
		// //运行时异常
		// int a= 1/0;

		// 获取商品数据
		List<Items> list = this.itemService.queryItemList();

		ModelAndView modelAndView = new ModelAndView();
		// 把数据放到模型中
		modelAndView.addObject("itemList", list);
		// 设置逻辑视图
		modelAndView.setViewName("itemList");

		return modelAndView;
	}

	/*
	 * 根据id查询商品
	 */
	// @RequestMapping("/itemEdit")
	// public ModelAndView queryItemById(HttpServletRequest request) {
	// //从request中获取id
	// String strId= request.getParameter("id");
	// Integer id = Integer.valueOf(strId);
	// //根据id查询商品数据
	// Items item = this.itemService.queryItemById(id);
	// ModelAndView modelAndView = new ModelAndView();
	// modelAndView.addObject("item", item);
	// modelAndView.setViewName("itemEdit");
	// return modelAndView;
	// }

	/*
	 * 根据id查询商品
	 */
	@RequestMapping("/itemEdit")
	public String queryItemById(int id, ModelMap model) {
		// 根据id查询商品数据
		Items item = this.itemService.queryItemById(id);
		model.addAttribute("item", item);
		return "editItem";
	}

	/*
	 * 更新商品，绑定pojo类型
	 */
	@RequestMapping("/updateItem")
	public String UpdateItem(Items item, MultipartFile pictureFile) throws IllegalStateException, IOException {
		// 图片上传
		// 设置图片名称
		String picName = UUID.randomUUID().toString();
		// 获取文件名
		String oriName = pictureFile.getOriginalFilename();
		// 获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));

		// 图片上传
		pictureFile.transferTo(new File("F:\\JavaEE_WorkSpace\\upload\\image\\" + picName + "." + extName));
		
		//设置一图片名到商品中
		item.setPic(picName + "." + extName);
		
		//更新商品
		this.itemService.updateItemById(item);
//		return "redirect:/itemEdit.action?id=" + item.getId();
		return "forward:/itemEdit.action";
	}
	
	//json数据交互
	@RequestMapping(value= "/json.action")
	public @ResponseBody Items json(@RequestBody Items item) {
		return item;
	}
	
}
