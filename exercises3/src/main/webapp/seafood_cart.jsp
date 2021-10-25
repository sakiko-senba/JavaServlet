<@page import ="java.util.ArrayList"%>"
<@page import ="exercises3Seafood"  %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>海産物カート</title>

<style>
td{
text-align:center;
}
</style>
</head>

<body>
<div id="wrapper">
<header><h1>海産物カート</h1></header>
<main>




<p><%=request.getAttribute("message") %></p>
<p><a href="form">購入フォームへ戻る</a></p>
</main>
</div>
</body>
</html>