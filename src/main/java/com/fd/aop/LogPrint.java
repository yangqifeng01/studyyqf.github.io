package com.fd.aop;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LogPrint {
	@Pointcut("execution(* com.fd.service.*.*(..))")
	public void pointCut(){
		
	}
	
	@Before("pointCut()")                                          
	public void beforeLogin(JoinPoint joinpoint){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		System.out.println(simpleDateFormat.format(timestamp)+"  方法："+joinpoint.getSignature().getName()+"执行");
	}
}	
