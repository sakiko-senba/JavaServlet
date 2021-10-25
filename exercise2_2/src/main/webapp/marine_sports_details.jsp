<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!// 宣言タグでフィールドを宣言
	private String[] item = { "バナナボート", "パラセーリング", "サーフィン", "ダイビング" };
	private int[] price = { 30, 45, 20, 100 };
	private String[] image = { "banana.jpg", "para.jpg", "surfing.jpg", "dive.jpg" };
%>

<%
	String people = request.getParameter("people");
	String[] itemNo = request.getParameterValues("itemNo");

	String message;
	int numPeople = 0;
	int total = 0;
	int[] subtotal = null;
	try {
		numPeople = Integer.parseInt(people);
		if (people.isEmpty()) {
			message = "参加人数が不正です。";
		} else if (itemNo != null) {
			subtotal = new int[itemNo.length];
			for (int i = 0; i < subtotal.length; i++) {
				int no = Integer.parseInt(itemNo[i]);
				subtotal[i] = numPeople * price[no];
				total += subtotal[i];
			}
			if (numPeople >= 5) {
				int discount = (int) (total * 0.9);
				message = numPeople + "名様ですね！！<br>";
				message += "合計金額は $" + total + "から10%OFFで<strong>$" + discount + "</strpmg>です。";
			} else {
				message = numPeople + "名様の合計は<strong>$" + total + "</strong>です。 ";
			}
		} else {
			message = "ツアーを選択してください";

		}
	} catch (NumberFormatException e) {
		message = "参加人数を入力してください。";
	}
%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>マリンスポーツ参加お申し込み明細</title>
</head>
<body>
	<div id="wrapper">
		<header>
			<h1>マリンスポーツ参加お申し込み明細</h1>
		</header>
		<main>
			<%
			if (total > 0) {
			%>
			<table border="1">
				<tr>
					<th>マリンスポーツ</th>
					<th>単価</th>
					<th>小計</th>
					<th>イメージ</th>
				</tr>

				<%
				for (int i = 0; i < itemNo.length; i++) {
					int no = Integer.parseInt(itemNo[i]);
				%>
				<tr>
					<td><%=item[no]%></td>
					<td><%=price[no]%></td>
					<td><%=subtotal[i]%></td>
					<td><img src="img/<%=image[no] %>  " width="128" height="96"
						alt="<%=item[no]%>"></td>

				</tr>

				<%
				} // for
				%>

			</table>
			<%
			} // if
			%>
			<p><%=message%></p>
			<p>
				<a href="marine_sports_from.jsp">お申し込みフォームへ戻る</a>
			</p>
		</main>
	</div>
</body>
</html>