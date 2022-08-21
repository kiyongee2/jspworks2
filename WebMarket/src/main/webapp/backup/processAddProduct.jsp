<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Product" %>
<%@ page import="dao.ProductRepository" %>

<%
	request.setCharacterEncoding("utf-8");  //한글 인코딩 요청

	//폼 입력값 받아 오기
	String productId = request.getParameter("productId");
	String pname = request.getParameter("pname");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
	Integer price;
	if(unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);  //정수형으로 변환
	
	long stock;
	if(unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);  //long형으로 변환
	
	ProductRepository dao = ProductRepository.getInstance(); // dao 객체 생성
	
	Product newProduct = new Product(); // 상품 객체 생성

	newProduct.setProductId(productId);
	newProduct.setPname(pname);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	
	dao.addProduct(newProduct); // 상품 추가
	
	response.sendRedirect("products.jsp");  //상품 목록 페이지로 이동
%>