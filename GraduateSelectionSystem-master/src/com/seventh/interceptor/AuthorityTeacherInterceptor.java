package com.seventh.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.seventh.entity.Teacher;

@SuppressWarnings("serial")
public class AuthorityTeacherInterceptor extends AbstractInterceptor{
	public String intercept(ActionInvocation invocation) throws Exception {
		Map<String,Object> session=invocation.getInvocationContext().getSession();
		ActionContext context=invocation.getInvocationContext();
		Teacher teacher = (Teacher) session.get("teacher");
		if (teacher != null) {
			return invocation.invoke();
		}
		context.put("message", "����û�е�¼�����¼ϵͳ��");
		return Action.LOGIN;
	}
}
