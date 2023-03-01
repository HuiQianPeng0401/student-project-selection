<%@page import="java.sql.Timestamp"%>
<%@page import="com.seventh.util.TimeUtil"%>
<%@page import="com.seventh.entity.Message"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>查看留言-教师</title>
		<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="../css/style.css"/>
	</head>
	<body>
		<div class="header">
			<div class="logo">
				<h4>高校毕业设计选题系统</h4>
			</div>
			<div class="navsmall">
				<ul>
					<li><a href="TeacherService!teacherIndex.action" class="active">首页</a></li>
					<li><a href="TopicChoice">选题系统</a></li>
				</ul>
			</div>
			<div class="info">
				<ul>
					<li><a href="TeacherService!logout.action">注销</a></li>
					<li><a href="TeacherService!teacherDetail.action">${teacher.name}</a></li>
					
				</ul>
			</div>
		</div>
		<div class="wrapper linear">
		
			<div class="container">
				<div class="nav">
					<details>
                		<summary class="myButton">个人信息</summary>
            			<ul>
                			<li><a href="TeacherService!teacherDetail.action">修改资料</a></li>
            			</ul>
            		</details>
            		<details>
                		<summary class="myButton">我的题目</summary>
            			<ul>
                			<li><a href="AddTopicInit">出题</a></li>
                			<li><a href="TopicService!checkTeaTopic.action">查看题目</a></li>
            			</ul>
            		</details>
            		<details>
            			<summary class="myButton">留言建议</summary>
            			<ul>
            				<li><a href="SearchMessage!checkMessage.action">查看留言</a></li>
            				<li><a href="MessageAction!writeInit.action">写留言</a></li>
            			</ul>
            		</details>
            		<details>
            			<summary class="myButton"><a href="NoticeIndex">通知公告</a></summary>
            		</details>
            		<details>
            			<summary class="myButton"><a href="TeacherService!teacherIndex.action">返回首页</a></summary>
            		</details>
				</div>
				<div class="right">
					<div class="head">
						<div class="notice">
							<ul>
								<li style="float: left;"><img src="../images/notice.png"/></li>
								<li class="noticeli">
									<marquee scrollamount=3 font style="COLOR=FF0000; FILTER: shadow(color=FFFF33 ); font-size: 9pt; WIDTH: 100%">
										<s:property value="#session.scrolling"/> 
									</marquee>
								</li>						
							</ul>						
						</div>
						<div class="search">
							<div class="searchhead">
								<h2>查看留言</h2>
							</div>
							
						</div>
					</div>
					<div class="table">
						<div class="article" style="text-align:center;vertical-align:middle">
							<table class="tablestyle">
								<tr style="color: #FFFFFF; width: 100%; background: #4169E1;">
									<td width="12%">留言人</td>
									<td width="70%">内容</td>
									<td width="10%">留言时间</td>
									<td width="8%">留给</td>						
								</tr>
								
								<s:iterator value="#request.messages" id="message">
									<tr>
										<td><a href="UserInfo.action?id=<s:property value="#message.sendId" />&userType=<s:property value="#message.sendType" />"><s:property value="#message.sendName" />(<s:property value="#message.sendId" />)</a></td>
										<td><s:property value="#message.content" /></td>
										<td><%=TimeUtil.getTimeWithoutMilliSecond(((Message)request.getAttribute("message")).getCreateTime()) %></td>
										<td><s:property value="#message.receiveName" /></td>
									</tr>
								</s:iterator>
							</table>
							<ul>
								<li style="color: #F5F5F5; border: none; font-size: 14px; margin-top: 9px;">总记录数：<s:property value="#request.messagePage.totalCount" /> &nbsp;&nbsp;每页记录数：<s:property value="#request.messagePage.everyPage" /> 
									&nbsp;&nbsp;总页数：<s:property value="#request.messagePage.totalPage" />&nbsp;&nbsp;当前位置：第<s:property value="#request.messagePage.currentPage" />页
									
								<li>
							</ul>
						<div class="pagenav">
								<ul>
									<s:if test="#request.messagePage.hasPrePage==true">
									<li><a href="SearchMessage!frontPage.action?currentPage=<s:property value="#request.messagePage.currentPage" />" class="btu">上一页</a></li>
									</s:if>
									<li><a href="#" class="btu active"><s:property value="#request.messagePage.currentPage" /></a></li>
									<s:if test="#request.messagePage.currentPage+1<=#request.messagePage.totalPage">
									<li><a href="SearchMessage!nextPage.action?currentPage=<s:property value="#request.messagePage.currentPage" />" class="btu"><s:property value="#request.messagePage.currentPage+1" /></a></li>
									</s:if>
									<s:if test="#request.messagePage.currentPage+2<=#request.messagePage.totalPage">
									<li><a href="SearchMessage!nextPage.action?currentPage=<s:property value="#request.messagePage.currentPage+1" />" class="btu"><s:property value="#request.messagePage.currentPage+2" /></a></li>
									</s:if>
									<s:if test="#request.messagePage.currentPage+3<=#request.messagePage.totalPage">
									<li><a href="SearchMessage!nextPage.action?currentPage=<s:property value="#request.messagePage.currentPage+2" />" class="btu"><s:property value="#request.messagePage.currentPage+3" /></a></li>
									</s:if>
									<s:if test="#request.messagePage.hasNextPage==true">
									<li><a href="SearchMessage!nextPage.action?currentPage=<s:property value="#request.messagePage.currentPage" />" class="btu">下一页</a></li>
									<li><a href="SearchMessage!nextPage.action?currentPage=<s:property value="#request.messagePage.totalPage-1" />" class="btu">最后一页</a></li>
									</s:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<ul>
				<li><a href="#">关于我们</a></li>
				<li>|</li>
				<li>高校毕业设计选题系统</li>
				<li>Copyright</li>
				<li>&copy; 2016.</li>
			</ul>
		</div>
	</body>
</html>
