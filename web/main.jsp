<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/6/4
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <title>HLWLOGS</title>
    <!--js-->
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css"/>

    <script src="/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/jquery1.min.js"></script>
    <script type="text/javascript" src="/js/chatjs1.js"></script>
    <script type="text/javascript" src="/js/css3-mediaqueries.js"></script>
    <script type="text/javascript" src="/js/chat.js"></script>
    <script type="text/javascript" src="/js/jquery-form.js"></script>
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/buttons.css" />
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" />
    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="/css/zerogrid.css">
    <link rel="stylesheet" href="/css/index.style.css">
    <link rel="stylesheet" href="/css/responsive.css">
    <script type="text/javascript">
        function jiazai() {
            if (${user.uname!=null}){
                $("#dl").css("display","block");
                $("#zy").css("display","block");
                $("#pl").css("display","block");
                $("#bk").css("display","block");
                $("#wdl").css("display","none");
                $("#zy2").css("display","none");
                $("#tc").css("display","block");
            }
            else {
                $("#wdl").css("display","block");
                $("#zy2").css("display","block");
                $("#bk").css("display","none");
                $("#dl").css("display","none");
                $("#zy").css("display","none");
                $("#pl").css("display","none");
                $("#tc").css("display","none");
            }
        }
        function exit() {

            $.ajax({
                type : "post",
                dataType : "json",
                url: "/user/tuichu",
                cache: false,
                data:{},
                success : function(result) {
                    alert("退出成功");
                    window.location.href="/user/nologin";
                }
            });
        }
        function ssk() {
            var msg=$("#sousuo").val();
            if (msg==""){

                $("#tips").css("display","none");
                return;
            }
            else {
                $.ajax({
                    type : "post",
                    dataType : "json",
                    url: "/findArticle",
                    cache: false,
                    data:{"msg":msg},
                    success : function(result) {
                        $("#tips").html("");
                        var html="";
                        for (var i=1;i<=result.size;i++){
                            if(i==1) {article1=result.article1;html+="<div style='height: 20px;background-color: #1B9AF7;' onmouseover='bs1(this)'onmouseout='bs2(this)' onclick='tiaozhuan(article1.arid)'>"+article1.artitle+"</div>";}
                            else if(i==2) {article2=result.article2;html+="<div style='height: 20px;background-color: #1B9AF7;' onmouseover='bs1(this)'onmouseout='bs2(this)' onclick='tiaozhuan(article2.arid)'>"+article2.artitle+"</div>";}
                            else if(i==3) {article3=result.article3;html+="<div style='height: 20px;background-color: #1B9AF7;' onmouseover='bs1(this)'onmouseout='bs2(this)' onclick='tiaozhuan(article3.arid)'>"+article3.artitle+"</div>";}
                            else if(i==4) {article4=result.article4;html+="<div style='height: 20px;background-color: #1B9AF7;' onmouseover='bs1(this)'onmouseout='bs2(this)' onclick='tiaozhuan(article4.arid)'>"+article4.artitle+"</div>";}

                        }


                        for (var i=(result.size+1);i<=(result.size+result.size2);i++){
                            if(i==1) {user1=result.user1;html+="<div style='height: 20px;background-color: #1B9AF7;' onmouseover='bs1(this)'onmouseout='bs2(this)' onclick='tiaozhuan2(user1.uid)'>"+user1.uname+"</div>";}
                            else if(i==2) {user2=result.user2;html+="<div style='height: 20px;background-color: #1B9AF7;' onmouseover='bs1(this)'onmouseout='bs2(this)' onclick='tiaozhuan2(user2.uid)'>"+user2.uname+"</div>";}
                            else if(i==3) {user3=result.user3;html+="<div style='height: 20px;background-color: #1B9AF7;' onmouseover='bs1(this)'onmouseout='bs2(this)' onclick='tiaozhuan2(user3.uid)'>"+user3.uname+"</div>";}
                            else if(i==4) {user4=result.user4;html+="<div style='height: 20px;background-color: #1B9AF7;' onmouseover='bs1(this)'onmouseout='bs2(this)' onclick='tiaozhuan2(user4.uid)'>"+user4.uname+"</div>";}
                              }
                        $("#tips").append(html);
                        $("#tips").css("display","block");
                    }
                });

            }
        }
        function tiaozhuan(arid) {
            window.location.href="/qwx_index?arid="+arid+"&userid=${user.uid}";

        }
        function tiaozhuan2(uid) {

            window.location.href="/rhy_index?uid="+uid+"&page=1&method=1&userid=${user.uid}";
        }

        function bs1(div) {
            div.style.backgroundColor="white";
        }
        function bs2(div) {
            div.style.backgroundColor="#1B9AF7";
        }


    </script>

</head>
<body onload="jiazai()">
<!--------------Header--------------->
<header>
    <div class="wrap-header zerogrid">
        <div id="logo"><a href="#"><img src="/img/hlwbolgs3.png"/></a></div>
        <nav>
            <div class="wrap-nav">
                <div class="menu">
                    <ul>
                        <li id="zy"><a href="/user/login/${user.uname}">主页</a></li>
                        <li id="zy2"><a href="/user/nologin">主页</a> </li>
                        <li id="bk"><a href="/bkglindex/${user.uid}">博客管理</a></li>
                        <li id="ds"><a href="/dashang.html">打赏</a></li>
                        <li id="wdl" style="display: none;"><a href="/login.jsp">登录/注册</a></li>
                        <li id="dl" ><a  data-toggle="modal" data-target="#register" href=""><img id="tx2" src="/userimage/${user.userimage}" style="border-radius: 50%; width: 40px; height: 40px; margin-top: -10px;"/><span style="margin-left:8px; margin-top:-20px;line-height:15px; font-size: 15px;color:#CCCCCC;">${user.uname}</span></a>

                        </li>
                        <li id="tc"><a style="cursor:pointer;" onclick="exit()">退出</a> </li>
                        <li><div class="form-group">
                            <input type="text" id="sousuo" onkeyup="ssk()" class="form-control" placeholder="Search">
                        </div>
                            <div id="tips" style="margin-top:-12px;display: none;
        	                    width: 196px;  border: 2px solid cornflowerblue";>
                        </div>
                        </li>
                    </ul>
                </div>

            </div>
        </nav>
    </div>
</header>
<div class="copyrights">Collect from <a href="#" >Website Template</a></div>

<!--------------Content--------------->
<section id="content">
    <div class="wrap-content zerogrid">
        <div class="row block">

            <div id="main-content" class="col-2-3">

                <div class="wrap-col">

                    <article>
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>


                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <a href="/qwx_index?arid=${RecommendArticle1.arid}&userid=${user.uid}"><img  src="/img/${RecommendImg1}" alt="..." style="width:600px;height: 300px;"></a>
                                    <div class="carousel-caption">
                                        <!--  <h3>today sa ad </h3>
                                          <p>ok o good good</p>-->
                                    </div>
                                </div>
                                <div class="item ">
                                    <a href="/qwx_index?arid=${RecommendArticle2.arid}&userid=${user.uid}"><img src="/img/${RecommendImg2}" alt="..."style="width:600px;height: 300px;"></a>
                                    <div class="carousel-caption">
                                        <h3>oh</h3>
                                        <p>good good oh good</p>
                                    </div>
                                </div>
                                <div class="item ">
                                    <a href="/qwx_index?arid=${RecommendArticle3.arid}&userid=${user.uid}"><img src="/img/${RecommendImg3}" alt="..."style="width:600px;height: 300px;"></a>
                                    <div class="carousel-caption">
                                        <h3>oh</h3>
                                        <p>good good butiful</p>
                                    </div>
                                </div>
                            </div>


                            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </article>


                    <article id="art1">
                        <div class="heading">
                            <h2><a href="/qwx_index?arid=${RecommendArticle1.arid}&userid=${user.uid}">${RecommendArticle1.artitle}</a></h2>

                        </div>
                        <div class="content">
                            <img src="/img/${RecommendImg1}" style="height: 150px;width: 150px;" />
                            <div class="div2">
                                <a href="/qwx_index?arid=${RecommendArticle1.arid}&userid=${user.uid}"><p>${RecommendArticle1.arcontent} </p></a>
                            </div>
                            <p class="meta">
                                &nbsp;<i class="glyphicon glyphicon-user"></i>&nbsp;<a href="/rhy_index?uid=${RecommendUser1.uid}&page=1&method=1&userid=${user.uid}">${RecommendUser1.uname}</a> &nbsp;
                                <time class="time"><i class="glyphicon glyphicon-time"></i>${RecommendDate1}</time>&nbsp;
                                <span class="views"><i class="glyphicon glyphicon-eye-open"></i> ${RecommendArticle1.arbrowsenum}</span> <a class="comment" href="##comment" title="评论" target="_blank" >&nbsp;
                                <i class="glyphicon glyphicon-comment"></i> ${RecommendArticle1.arcommentnum}</a>
                            </p>
                            <p class="more"><a class="button" href="/qwx_index?arid=${RecommendArticle1.arid}&userid=${user.uid}">Read more</a></p>
                        </div>
                    </article>

                    <article id="art2">
                        <div class="heading">
                            <h2><a href="/qwx_index?arid=${RecommendArticle2.arid}&userid=${user.uid}">${RecommendArticle2.artitle}</a></h2>

                        </div>
                        <div class="content">
                            <img src="/img/${RecommendImg2}" style="height: 150px;width: 150px;" />
                            <div class="div2">
                                <a href="/qwx_index?arid=${RecommendArticle2.arid}&userid=${user.uid}"><p>${RecommendArticle2.arcontent} </p></a>

                            </div>
                            <p class="meta">
                                &nbsp;<i class="glyphicon glyphicon-user"></i>&nbsp;<a href="/rhy_index?uid=${RecommendUser2.uid}&page=1&method=1&userid=${user.uid}">${RecommendUser2.uname} </a>
                             &nbsp;
                                <time class="time"><i class="glyphicon glyphicon-time"></i>${RecommendDate2}</time>&nbsp;
                                <span class="views"><i class="glyphicon glyphicon-eye-open"></i> ${RecommendArticle2.arbrowsenum}</span> <a class="comment" href="##comment" title="评论" target="_blank" >&nbsp;
                                <i class="glyphicon glyphicon-comment"></i> ${RecommendArticle2.arcommentnum}</a>
                            </p>
                            <p class="more"><a class="button" href="/qwx_index?arid=${RecommendArticle2.arid}&userid=${user.uid}">Read more</a></p>
                        </div>
                    </article>
                    <article id="art3">
                        <div class="heading">
                            <h2><a href="/qwx_index?arid=${RecommendArticle3.arid}&userid=${user.uid}">${RecommendArticle3.artitle}</a></h2>

                        </div>
                        <div class="content">
                            <img src="/img/${RecommendImg3}" style="height: 150px;width: 150px;" />
                            <div class="div2">
                                <a href="/qwx_index?arid=${RecommendArticle3.arid}&userid=${user.uid}"><p>${RecommendArticle3.arcontent} </p></a>
                            </div>
                            <p class="meta">
                                &nbsp;<i class="glyphicon glyphicon-user"></i>&nbsp;<a href="/rhy_index?uid=${RecommendUser3.uid}&page=1&method=1&userid=${user.uid}">${RecommendUser3.uname}</a> &nbsp;
                                <time class="time"><i class="glyphicon glyphicon-time"></i>${RecommendDate3}</time>&nbsp;
                                <span class="views"><i class="glyphicon glyphicon-eye-open"></i> ${RecommendArticle3.arbrowsenum}</span> <a class="comment" href="##comment" title="评论" target="_blank" >&nbsp;
                                <i class="glyphicon glyphicon-comment"></i> ${RecommendArticle3.arcommentnum}</a>
                            </p>
                            <p class="more"><a class="button" href="/qwx_index?arid=${RecommendArticle3.arid}&userid=${user.uid}">Read more</a></p>
                        </div>
                    </article>

                    <article id="art4">
                        <div class="heading">
                            <h2><a href="/qwx_index?arid=${RecommendArticle4.arid}&userid=${user.uid}">${RecommendArticle4.artitle}</a></h2>

                        </div>
                        <div class="content">
                            <img src="/img/${RecommendImg4}" style="height: 150px;width: 150px;" />
                            <div class="div2">
                                <a href="/qwx_index?arid=${RecommendArticle4.arid}&userid=${user.uid}"><p>${RecommendArticle4.arcontent} </p></a>

                            </div>
                            <p class="meta">
                                &nbsp;<i class="glyphicon glyphicon-user"></i>&nbsp;<a href="/rhy_index?uid=${RecommendUser4.uid}&page=1&method=1&userid=${user.uid}">${RecommendUser4.uname}</a> &nbsp;
                                <time class="time"><i class="glyphicon glyphicon-time"></i>${RecommendDate4}</time>&nbsp;
                                <span class="views"><i class="glyphicon glyphicon-eye-open"></i> ${RecommendArticle4.arbrowsenum}</span> <a class="comment" href="##comment" title="评论" target="_blank" >&nbsp;
                                <i class="glyphicon glyphicon-comment"></i> ${RecommendArticle4.arcommentnum}</a>
                            </p>
                            <p class="more"><a class="button" href="/qwx_index?arid=${RecommendArticle4.arid}&userid=${user.uid}">Read more</a></p>
                        </div>
                    </article>

                </div>
            </div>

            <div id="sidebar" class="col-1-3">
                <div class="wrap-col">
                    <div class="box">

                        <div class="heading"><h2>博客专家</h2></div>
                        <div class="content">
                            <div class="post">
                                <a href="#"><img src="/userimage/${top1.userimage}" width="50px;" style="height: 50px"/></a>
                                <h4><a href="/rhy_index?uid=${top1.uid}&page=1&method=1&userid=${user.uid}">${top1.uname}</a></h4>
                                <p>${top1.userprofile}</p>
                            </div>
                            <!--<p>&nbsp;</p>-->
                            <div class="post">
                                <a href="#"><img src="/userimage/${top2.userimage}" style="height: 50px"  width="50px;" /></a>
                                <h4><a href="/rhy_index?uid=${top2.uid}&page=1&method=1&userid=${user.uid}">${top2.uname}</a></h4>
                                <p>${top2.userprofile}</p>
                            </div>
                            <!--<p>&nbsp;</p>-->
                            <div class="post">
                                <a href="#"><img src="/userimage/${top3.userimage}" width="50px;" style="height: 50px"/></a>
                                <h4><a href="/rhy_index?uid=${top3.uid}&page=1&method=1&userid=${user.uid}">${top3.uname}</a></h4>
                                <p>${top3.userprofile}</p>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="heading"><h2>分类</h2></div>
                        <div class="content">
                            <ul>
                                <li><a style="cursor:pointer;" onclick="choose(1)">JAVA</a></li>
                                <li><a style="cursor:pointer;" onclick="choose(2)">C++</a></li>
                                <li><a style="cursor:pointer;" onclick="choose(3)">Javascript</a></li>
                                <li><a style="cursor:pointer;" onclick="choose(4)">PHP</a></li>
                                <li><a style="cursor:pointer;" onclick="choose(5)">算法</a></li>
                                <li><a style="cursor:pointer;" onclick="choose(6)">数据结构</a></li>
                                <li><a style="cursor:pointer;" onclick="choose(7)">操作系统</a></li>
                                <li><a style="cursor:pointer;" onclick="choose(8)">计算机网络</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="box">
                        <div class="heading"><h2>推荐</h2></div>
                        <div class="content">
                            <div class="post">
                                <img src="/img/${RecommendImg1}" style="width: 50px; height: 50px;"/>
                                <h4><a href="/qwx_index?arid=${RecommendArticle1.arid}&userid=${user.uid}">${RecommendArticle1.artitle}</a></h4>
                                <p>${RecommendDate1}</p>
                            </div>
                            <!--<p>&nbsp;</p>-->
                            <div class="post">
                                <img src="/img/${RecommendImg2}" style="width: 50px; height: 50px;"/>
                                <h4><a href="/qwx_index?arid=${RecommendArticle2.arid}&userid=${user.uid}">${RecommendArticle2.artitle}</a></h4>
                                <p>${RecommendDate2}</p>
                            </div>
                            <!--<p>&nbsp;</p>-->
                            <div class="post">
                                <img src="/img/${RecommendImg3}" style="width: 50px; height: 50px;"/>
                                <h4><a href="/qwx_index?arid=${RecommendArticle3.arid}&userid=${user.uid}">${RecommendArticle3.artitle}</a></h4>
                                <p>${RecommendDate3}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--------------Footer--------------->
<footer>
    <div class="wrap-footer zerogrid">
        <div class="row">
            <div class="col-1-6">
                <div class="wrap-col">
                    <div class="box">
                        <div class="heading"><h2>Page</h2></div>
                        <div class="content">
                            <p><ul>
                           <li> <a href="#">主页</a></li>
                            <li> <a href="#">博客</a></li>
                            <li>  <a href="#">管理</a></li>
                            <li>  <a href="#">评论</a></li>
                            <li>   <a href="dashang.html">打赏</a></li>

                        </ul></p>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-2-6">
                <div class="wrap-col">
                    <div class="box">
                        <div class="heading"><h2>最新博客</h2></div>
                        <div class="content">
                            <div class="div3">
                                <a href="#"> 一个牛人给JAVA初学者的建议 </a>
                                <p><a href="#"> rutrum vulputate est sed faucibus. Nulla sed nisl mauris, id tristique tortor. </a></p>
                                <p><a href="#"> Sed iaculis dapibus urna nec dictum. Proin non enim odio.</a></p>
                                <p><a href="#"> Proin vitae turpis libero, eget feugiat enim.</a></p>
                                <p><a href="#"> Sed fringilla facilisis convallis.</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3-6">
                <div class="wrap-col">
                    <div class="box">
                        <div class="heading"><h2>智能小图</h2></div>
                        <div class="content">
                            <div class="RightCont">
                                <!--<textarea id="dope" type="text" style="width: 99%;height: 75px; border: solid;outline: none;"></textarea>-->
                                <textarea id="dope" type="text" class="form-control"  rows="3"style="width: 99%;height: 75px; border: solid;outline: none;"></textarea>
                            </div>
                            <p>&nbsp;</p>
                            <input id="msg" type="text"  style="color: #000000;" />


                            <button type="button" class="btn btn-primary" onclick="aa()">发送</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <div class="copyright">
        <p>Blog © 2019-  by fourterm</p>
    </div>
</footer>
<%--模态框--%>

<div id="register" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">修改个人信息</h1>
            </div>
            <div class="modal-body">

                    <div class="form-group">
                        <label>用户名</label>
                        <input class="form-control" id="uname2"  readonly="true" type="text" placeholder="${user.uname}" value="${user.uname}">
                    </div>
                    <div class="form-group">
                        <label>新的密码</label>
                        <input class="form-control" id="newpassword" type="password" placeholder="至少6位字母或数字">
                    </div>
                    <div class="form-group">
                        <label>再次输入新的密码</label>
                        <input class="form-control" id="newpassword2" type="password" placeholder="至少6位字母或数字">
                    </div>
                    <div class="form-group">
                    <label>请输入个人简介</label>
                    <input class="form-control" id="userprofile2" type="text" placeholder="请输入个人简介" value="${user.userprofile}">
                    </div>
                   <%-- <label>请上传头像</label>
                    <input class="form-group">
                <form  id="jvForm" action="/user/updateuserinfo" method="post" enctype="multipart/form-data">
                        <input type="file" name="userimage2" id="file2"  >--%>
                <!-- 原生上传控件 -->
                <input type="file" name="" id="chooseImage" class="hidden" accept=".jpg,.jpeg,.png">
                <!-- 自定义上传按钮 -->
                <a  id="putImg" onclick="changeImg()" class="button button-3d button-action button-pill" ><i class="fa fa-telegram" aria-hidden="true"></i>&nbsp;上传头像</a>
                <a  onclick="deleteimg()" class="button button-3d button-action button-pill" ><i class="glyphicon glyphicon-trash" ></i></span>&nbsp;删除</a>
                <img id="showImg"  width="150" height="200">

                    <div class="text-right">
                        <button class="btn btn-primary" type="submit" onclick="updateuserinfo()" >提交</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var dataURL;
    //自定义上传按钮的点击事件
    function changeImg(){

        $('#chooseImage').trigger('click');//触发原生上传控件
    }

    $('#chooseImage').on('change',function(e){
        // 检查是否是图片
        var filePath = $(this).val(),
            fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();//获取文件后缀名
        //检查后缀名
        if( !fileFormat.match(/.png|.jpg|.jpeg/) ) {
            showError('文件格式必须为：png/jpg/jpeg');//showError是另外写的一个显示错误信息的function
            return;
        }

        //获取并记录图片的base64编码
        var reader = new FileReader();
        reader.readAsDataURL(e.target.files[0]); // 读出 base64
        reader.onloadend = function () {
            // 图片的 base64 格式, 可以直接当成 img 的 src 属性值
             dataURL = reader.result;//base64
            // 显示图片
            $('#showImg').attr('src',dataURL);
        };
    });
    function deleteimg(){
        dataURL=null;
        $('#showImg').attr('src',dataURL);
    }
    function updateuserinfo() {
        var uname=$("#uname2").val();
        var upassword=$("#newpassword2").val();
        var upassword2=$("#newpassword").val();
        var userprofile=$("#userprofile2").val();
        if (upassword!=upassword2){
            alert("俩次密码不一样请重新输入");
            return false;
        }
        if (dataURL==null){
            $.ajax({
                url:"/user/upload2",
                contentType:"application/json;charset=utf-8",
                data:{"touxiang":uname,"upassword":upassword2,"userprofile":userprofile},
                datatype:"json",
                type:"post",
                success:function (data) {
                    if (data.aa==1){
                        alert("上传成功");
                        $('#tx2').attr('src',dataURL);
                    }
                    if (data.aa==0){
                        alert("上传失败!");
                    }

                }

            })
        }
        else{

            $.ajax({
                url:"/user/upload",
                contentType:"application/json;charset=utf-8",
                data:{"uname":uname,"upassword":upassword2,"userprofile":userprofile,"touxiang":dataURL},
                datatype:"json",
                type:"post",
                success:function (data) {
                    if (data.aa==1){
                        alert("上传成功");
                        $('#tx2').attr('src',dataURL);
                    }
                    if (data.aa==0){
                        alert("上传失败!");
                    }

                }

            })
        }
    }
    function  choose(num) {

        $("#art1").html("");
        $("#art2").html("");
        $("#art3").html("");
        $("#art4").html("");
        $.ajax({
            url:"/choose",
            contentType:"application/json;charset=utf-8",
            data:{"num":num},
            datatype:"json",
            type:"post",
            success:function (data) {

                var index2=num;
                var fenlei;
                if (index2==1){
                    fenlei="java.jpg";
                }
                else if (index2==2){
                    fenlei="C.jpg";
                }
                else if (index2==3){
                    fenlei="js.jpg";
                }
                else if (index2==4){
                    fenlei="php.jpg";
                }
                else if (index2==5){
                    fenlei="suanfa.jpg";
                }
                else if (index2==6){
                    fenlei="sjjg.jpg";
                }
                else if (index2==7){
                    fenlei="czxt.jpg";
                }
                else if (index2==8){
                    fenlei="jsjwl.jpg";
                }
                var html="";
                for (var i=1;i<=data.size;i++){
                    var article;
                    if(i==1) article=data.article1;
                    else if(i==2) article=data.article2;
                    else if(i==3) article=data.article3;
                    else if(i==4) article=data.article4;
                    html+="<article id=\"art"+i+"\">"+
                        "<div class=\"heading\">"+
                            "<h2><a href=\"/qwx_index?arid="+article.arid+"&userid=${user.uid}\">"+article.artitle+"</a></h2>"+
                        "</div>"+
                        "<div class=\"content\">"+
                            "<img src=\"/img/"+fenlei+"\" style=\"width:150px;height:150px;\"/>"+
                            "<div class=\"div2\">"+
                                "<a href=\"/qwx_index?arid="+article.arid+"&userid=${user.uid}\"><p>"+article.arcontent+" </p></a>"+
                            "</div>"+
                            "<p class=\"meta\">"+
                               "&nbsp;<i class=\"glyphicon glyphicon-user\"></i>&nbsp;<a href=\"/rhy_index?uid=${RecommendUser1.uid}&page=1&method=1&userid=${user.uid}\">${RecommendUser1.uname}</a> &nbsp;" +
                                "<time class=\"time\"><i class=\"glyphicon glyphicon-time\"></i>${RecommendDate1}</time>&nbsp;"+
                                "<span class=\"views\"><i class=\"glyphicon glyphicon-eye-open\"></i> "+article.arbrowsenum+"</span> <a class=\"comment\" href=\"##comment\" title=\"评论\" target=\"_blank\" >&nbsp;"+
                                "<i class=\"glyphicon glyphicon-comment\"></i>"+article.arcommentnum+"</a>"+
                            "</p>"+
                            "<p class=\"more\"><a class=\"button\" href=\"/qwx_index?arid="+article.arid+"&userid=${user.uid}\">Read more</a></p>"+
                        "</div>"
                    "</article>";
                    $("#art"+i).append(html);
                    html="";
                }
            }

        })
    }
</script>
</body>
</html>
