<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>固废堆场时序性分析界面</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="js/pluginsPackage/bootstrap-3.3.0/bootstrap.css" rel="stylesheet" type="text/css"></link>
    <link rel="stylesheet" href="js/pluginsPackage/swiper/swiper-bundle.min.css" type="text/css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="css/style.css" rel="stylesheet" type="text/css"></link>
    <link href="css/office_efficiency_index.css" rel="stylesheet" type="text/css"></link>
    <style>
        .proinfo {color: white;font-size: 18px;}
        .imgvideo{text-align: center;left:300px;top:150px;}
        .log{text-align: center;margin: 28px 20px -228px 21px;}
        .log-add{color:red;font-size: 18px;text-align: center;float: left;}
        .log-reduce{color: #12c351;font-size: 18px;text-align: center;float: left;}
        .log-time{color:white;float: left;font-size: 17px;}
        .title{cursor: pointer}
    </style>
</head>
<body>
<div class="office-efficiency-index">
    <div class="office-header">
        <div class="row col-ms-12 col-md-12 pd  title-info">固废堆场时序性分析可视化</div>
    </div>
    <div class="row office-header-content">
        <%-- 项目介绍，无需更改--%>
        <div class="col-sm-4 col-md-4 pd">
            <div class="col-info">
                <div class="title">前端视频</div>
                <div class="content base-info proinfo" id="base-info" >
<%--                    本课题的目的是基于视频摄影测量技术监测利用型固废堆场的体量及其变化。--%>
<%--                    首先利用监控视频实时监测利用型固废堆场中的目标变化，并将变化前后的视频信息传输到服务器端；--%>
<%--                    然后基于摄影测量与计算机视觉技术进行数据处理与分析，以期获取堆场的位置、大小、变化等信息。--%>
                        <iframe
                                src="https://open.ys7.com/ezopen/h5/iframe?url=ezopen://open.ys7.com/E46184232/1.hd.live&autoplay=1&accessToken=at.bicdlelw1h3chkpm9ir1njq8bnuy2a0x-4g31su3p5f-1jr9j7y-dpfm7adiu"
                                width="450"
                                height="300"
                                id="ysOpenDevice"
                                allowfullscreen
                        >
                        </iframe>
                </div>
            </div>
        </div>
        <%-- 项目图片，目前不变--%>
        <div class="col-sm-4 col-md-4 pd">
            <div class="col-info">
                <div class="title">模型展示</div>
<%--                <div class="swiper-container">--%>
<%--                    <div class="swiper-wrapper">--%>
<%--                        <div class="swiper-slide"><img src="./images/图片1.jpg" alt="前端影像" width="500"  height="300"></div>--%>
<%--                        <div class="swiper-slide"><img src="./images/图片1.jpg" alt="前端影像" width="500"  height="300"></div>--%>
<%--                        <div class="swiper-slide"><img src="./images/图片1.jpg" alt="前端影像" width="500"  height="300"></div>--%>
<%--                    </div>--%>
<%--                    <!-- Add Pagination -->--%>
<%--                    <div class="swiper-pagination"></div>--%>
<%--                    <!-- Add Arrows -->--%>
<%--                    <div class="swiper-button-next"></div>--%>
<%--                    <div class="swiper-button-prev"></div>--%>
<%--                </div>--%>
                <div id="divs" style="width: 500px;height: 300px;"></div>
            </div>

        </div>

        <div class="col-sm-4 col-md-4 pd">
            <div  class="col-info">
                <div  class="col-info">
                    <div class="title">固废堆场体量实时变化图</div>
                    <div class="content" id="dting"></div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-6 pd time-step-col">
            <div  class="col-info">
                <div class="title" id="check1">固废堆场体量变化图</div>
                <div class="content" id="dtchange"></div>
            </div>
        </div>
        <div class="col-sm-6 col-md-6 pd time-step-col">
            <div  class="col-info">
                <div class="title" id = "check2">固废堆场总量改变图</div>
                <div class="content" id="sumchange"></div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
