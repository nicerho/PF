<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<% 
	response.addHeader("Access-Control-Allow-Origin","*");
	response.addHeader("Access-Control-Allow-Credentials","true");
%>    
${map.get("error")}