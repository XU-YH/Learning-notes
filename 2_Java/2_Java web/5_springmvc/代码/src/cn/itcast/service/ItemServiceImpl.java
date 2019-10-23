package cn.itcast.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.dao.ItemsMapper;
import cn.itcast.pojo.Items;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemsMapper itemsMapper;
	
	@Override
	public List<Items> queryItemList() {
		List<Items> list= this.itemsMapper.selectByExample(null);
		return list;
	}

	@Override
	public Items queryItemById(int id) {
		Items item = this.itemsMapper.selectByPrimaryKey(id);
		return item;
	}

	@Override
	public void updateItemById(Items item) {
		this.itemsMapper.updateByPrimaryKeySelective(item);
		
	}

}
