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
		//�����쳣��Ϣ
		String msg;
		//�ж��쳣����
		if(exception instanceof MyException) {
			//������Զ����쳣����ȡ�쳣��Ϣ
			msg= exception.getMessage();
		}else {
			//����ʱ�쳣���Ӷ�ջ�л�ȡ�쳣��Ϣ
			StringWriter out = new StringWriter();
			PrintWriter s= new PrintWriter(out);
			exception.printStackTrace(s);
			msg= out.toString();
		}
		//���ش���ҳ��
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("msg", msg);
		modelAndView.setViewName("error");
		return modelAndView;
	}

}
