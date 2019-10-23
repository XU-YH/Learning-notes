package cn.itcast.service;

import java.util.List;

import cn.itcast.pojo.Items;

public interface ItemService {
	List<Items> queryItemList();
	
	Items queryItemById(int id);
	
	void updateItemById(Items item);
}
