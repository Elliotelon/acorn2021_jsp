package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/* 
 * 	[ 요청을 가로채서 중간에 원하는 작업을 할수 있는 필터 만들기 ]
 * 
 *  1. javax.servlet.Filter 인터페이스를 구현한다.
 *  2. web.xml 을 만들고 거기에 필터를 정의하고 맵핑한다.
 *  3. doFilter() 메소드 안에서 원하는 작업을 한다.
 */
public class EncodingFilter implements Filter{
	//초기화 파라미터를 읽어와서 저장할 필드
	private String encoding;
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	//필터가 동작할때 자동으로 호출되는 메소드 
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, 
			FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Encoding Filter doFilter() 동작중...");
		//1. 만일 요청 인코딩이 설정되지 않았다면
		if(request.getCharacterEncoding() == null) {
			//인코딩 설정하기
			request.setCharacterEncoding(encoding);
		}
		//2. 요청의 흐름 계속 이어가기
		chain.doFilter(request, response);
	}
	//필터가 최초 사용될때 한번 호출되는 메소드 
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// "encoding"  이라는 키값으로 저장된 초기화 파라미터(utf-8) 읽어와서 필드에 저장
		encoding=filterConfig.getInitParameter("encoding");
	}

}
