<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>算法交易服务平台-查看算法</title>

    <link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="resources/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/local.css" />

    <script type="text/javascript" src="resources/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap/js/bootstrap.js"></script>

    <link rel="stylesheet" type="text/css" href="resources/css/shieldui-all.min.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/all.min.css" />
    
    <script type="text/javascript" src="resources/js/shieldui-all.min.js"></script>
    <script type="text/javascript" src="resources/js/gridData.js"></script>
  
  </head>
  
  <body>
	<div id="wrapper">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">算法交易服务平台</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li><a href="index.jsp"><i class="fa fa-bullseye"></i> 首页</a></li>
                    <li class="active"><a href="search.jsp"><i class="fa fa-table"></i> 搜索算法</a></li>
                    <li><a href="addAlgorithm.jsp"><i class="fa fa-tasks"></i> 添加算法</a></li>
                    <li><a href="reward.jsp"><i class="fa fa-list-ul"></i> 提问悬赏</a></li>
                    <li><a href="Signup.jsp"><i class="fa fa-list-ol"></i> 登录</a></li>
                    <li><a href="register.jsp"><i class="fa fa-font"></i> 注册</a></li>
                    <li><a href="blog.html"><i class="fa fa-globe"></i> 关于我们</a></li>
                    <li><a href="forms.html"><i class="fa fa-list-ol"></i> 意见反馈</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right navbar-user">
                    <li class="dropdown messages-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> 消息 <span class="badge">2</span> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">2个新消息</li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">消息1</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">消息2</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                     <li class="dropdown user-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>作者<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="divider"></li>
                            <li><a href="#"><i class="fa fa-power-off"></i>退出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel panel-primary">
                            <div class="panel-heading">
                				<h3 class="panel-title">作者</h3>
              				</div>
                                <div class="panel-body">
                                   <p>版本</p>
                                   <p>version1.0</p>
                                   <hr>
                                   <p>访问次数</p>
                                   <p>1200 times</p>
                                   <hr>
                                   <p>权限</p>
                                   <p>在线使用/离线使用/开放源码</p>
                                   <hr>
                                   <p>付费</p>
                                   <p>1cr/sec</p>
                                   <hr>
                                   <p>输入/输出类型</p>
                                   <p>输入：</p>
                                   <p>输出：</p>
                                   <hr>
                                   <p>标签</p>
                                   	<div class="listTagView">
                                   	<ul class="list-unstyled ">
                                		<li>最短路径</li>
                                		<li>Dijkstra</li>
                                		<li>Dijkstra</li>
                            		</ul>
                                	</div>
                                   <hr>
                                </div>
                                <div class="text-center">
                                    <a href="#" class="btn btn-primary">查看源代码</a>
                                </div>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9">
                    <!-- 搜索算法 -->
                    <div class="well">
                        <h3>算法描述</h3>    
        					<p>Dijkstra算法是典型最短路算法，用于计算一个节点到其他所有节点的最短路径。主要特点是以起始点为中心向外层层扩展，直到扩展到终点为止，得出最短径的最优解。</p>
        				<h3>输入说明</h3>
                            <p>顶点坐标，邻居点坐标，起始点坐标，终点坐标</p>
                            <table cellspacing="15px" cellpadding="5px">
                            <tr>
                            <th>输入实例</th><th>输出实例</th>
                            </tr>
                            <tr>
                            <td><textarea name="inputExam" style="height:90px; width:300px; background-color:#ECECEC; border:0px"></textarea></td>
                            <td><textarea name="inputExam" style="height:90px; width:300px; background-color:#ECECEC; border:0px"></textarea></td>
                            </tr>
                            </table>
                    </div>
                    <hr>

                    <!-- 测试 -->
                    <h3>在线测试</h3>
                    <p>在控制台中输入测试数据：</p>
                    <textarea name="inputExam" style="height:90px; width:100%; background-color:#3C3C3C; border:0px"></textarea>
                    <hr>
                    <h3>API使用方法</h3>
             <!-- API usage example -->       
            <div class="bs-example">
              <ul class="nav nav-tabs" style="margin-bottom: 15px;">
                <li class="active"><a href="#home" data-toggle="tab">Javascript</a></li>
                <li><a href="#profile" data-toggle="tab">C++</a></li>
                <li> <a href="#cusage" data-toggle="tab">C</a></li>
              </ul>
              <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade active in" id="home">
                  <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
                </div>
                <div class="tab-pane fade" id="profile">
                  <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>
                </div>
                <div class="tab-pane fade" id="cusage">
                  <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.</p>
                </div>
              </div>
              <hr>
                    
                     <!--评价 -->
                     <h3>评价反馈</h3>
                     <form role="form">
                            <div class="form-group">
                                <input type="text" class="form-control" name="review" >
                            </div>
                            <button type="submit" class="btn btn-primary" >评价</button>
                     </form>
                     <div class="well">  
        					<p><a href="#" style="text-decoration:none">用户名</a></p>
                            <p>评价内容</p>
                             <div class="btn-group-vertical">
                  				<button type="button" class="btn btn-default">回复</button>
              				</div>
              				<hr>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>
