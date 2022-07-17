<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 디렉티브 태그</title>
</head>
<body>
	<%
	    //배열
	    int[] arr = new int[]{10, 20, 30};
	    for(int i = 0; i< arr.length; i++){
	    	out.println(arr[i]);
	    }
	    
	    out.println("<br>");
	
	    //Arrayss 클래스
	    int[] arr2 = new int[]{10, 20, 30};
	    out.println(Arrays.toString(arr2));
	
		//ArrayList 클래스
		ArrayList<String> fruitList = new ArrayList<>();
		fruitList.add("사과");
		fruitList.add("참외");
		fruitList.add("수박");
		
		out.println("<br>");
		out.println(fruitList.get(1));
		
		out.println("<br>");
		for(String fruit : fruitList)
			out.println(fruit);
	%>
</body>
</html>














