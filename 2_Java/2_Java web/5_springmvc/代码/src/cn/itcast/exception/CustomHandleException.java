package cn.itcast.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class CustomHandleException implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception exception) {
		//定义异常信息
		String msg;
		//判断异常类型
		if(exception instanceof MyException) {
			//如果是自定义异常，读取异常信息
			msg= exception.getMessage();
		}else {
			//运行时异常，从堆栈中获取异常信息
			StringWriter out = new StringWriter();
			PrintWriter s= new PrintWriter(out);
			exception.printStackTrace(s);
			msg= out.toString();
		}
		//返回错误页面
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("msg", msg);
		modelAndView.setViewName("error");
		return modelAndView;
	}

}
