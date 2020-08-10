<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
    xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8" />
<title>Create New Product</title>
</head>
<body>
    <div align="center">
        <h1>Create New Product</h1>
        <br />
        <form action="/save"  th:object="${product}"
            method="post">
            <table border="0" cellpadding="10">
                <tr>
                   
                    <td><input type="text" th:field="*{testanme}" />cbc</td>
                
              
                    <td><input type="text" th:field="*{price}" />100</td>
                </tr>
                  <tr>
                   
                    <td><input type="text" th:field="*{testanme}" />thyriod</td>
                
              
                    <td><input type="text" th:field="*{price}" />200</td>
                </tr>   
                <tr>
                    <td colspan="2"><button type="submit">Save</button> </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>