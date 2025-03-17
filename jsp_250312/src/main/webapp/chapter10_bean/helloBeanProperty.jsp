<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--  HelloBean 클래스로 myBean 객체 생성 -->
    <!--  scope = "page" 이 페이지에서 적용 -->
<jsp:useBean  class="hello.HelloBean" id="myBean" scope="page"></jsp:useBean>
<hr>
*> 빈 생성 후 저장된 값 출력<br>
이름:<jsp:getProperty property="name" name="myBean"/><br>
나이:<jsp:getProperty property="age" name="myBean"/><br>
<hr>
*. 값 변경 후 출력<br>
<jsp:setProperty property="name" name="myBean" value="JSB"/>
<jsp:setProperty property="age" name="myBean" value="11"/>
이름:<jsp:getProperty property="name" name="myBean"/><br>
나이:<jsp:getProperty property="age" name="myBean"/><br>