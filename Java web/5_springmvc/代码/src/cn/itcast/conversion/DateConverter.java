package cn.itcast.conversion;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;
//Converter<S, T>
//S:source,��Ҫת����Դ������
//T:target,��Ҫת����Ŀ������
public class DateConverter implements Converter<String, Date> {

	@Override
	public Date convert(String source) {		
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return simpleDateFormat.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

}
