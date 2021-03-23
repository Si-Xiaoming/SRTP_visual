<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>查询窗口</title>
    <link href="https://fonts.googleapis.com/css?familymPermanent+Marker" >
    <link href="css/style.css" rel="stylesheet" type="text/css"></link>
    <link href="css/office_efficiency_index.css" rel="stylesheet" type="text/css"></link>
    <link href="js/pluginsPackage/bootstrap-3.3.0/bootstrap.css" rel="stylesheet" type="text/css"></link>
</head>
<style type="text/css">
    body{
        margin: 0;
        padding: 0;
        background: #181c41;
    }
    .sign-div h1{
        margin-top: 100px;
        color: #fff;
        font-size: 40px;
    }
    .sign-div input{
        display: block;
        width: 100%;
        padding: 0 16px;
        height: 44px;
        text-align: center;
        box-sizing: border-box;
        outline: none;
        border: none;
        font-family: "montserrat",sans-serif;
    }
    .sign-text{
        margin:4px;
        background: rgba(255,255,255,5);
        border-radius: 6px;
    }
    .sign-div a{
        text-decoration: none;
        color: #fff;
        font-family: "montserrat", sans-serif;
        font-size: 14px;
        padding: 10px;
        transition: 0.8s;
        display: block;
    }
    .sign-div a:hover{
        background: rgba(0,0,0,.3);
    }
    .sign-btn{
        /*margin-top: 50px;*/
        /*margin-bottom: 20px;*/
        background: #487eb0;
        color: #fff;
        border-radius: 44px;
        cursor: pointer;
        transition: 0.8s;
        height: 40px;
        width:100px;
        font-size: 18px;
    }
    .sign-btn:hover{
        transform:scale(0.96);
    }
</style>
<body>
<div class="office-header fixes">
    <div class="row col-ms-12 col-md-12 pd  title-info">固废堆场时序性分析可视化查询</div>
</div>
<div align="center" id="checkAll" >
    <div id="pageName" align="center"><h1 style="color: white">查询界面</h1></div>
    <form action="/check_change" method="post" id="mainForm">
        <table style="border-collapse:separate; border-spacing:21px 10px;font-size: 18px" align="center">
            <tr align="center" style="color: white">
                <td>按年查询</td>
                <td>按月查询</td>
                <td>按周查询</td>
            </tr>
            <tr align="center">
                <td><input type="radio" name="mycheck" value="0"></td>
                <td><input type="radio" name="mycheck" value="1"></td>
                <td><input type="radio" name="mycheck" value="2"></td>
            </tr>
        </table>
        <div id="Vector" style="background-color: #181c41;height: 200px;width: 500px;color: yellow;font-size: 20px" >

        </div>
        <div id="Buttons">
            <table style="border-collapse:separate; border-spacing:150px 10px;" align="center">
                <tr align="center">
                    <td><input class="sign-btn" type="submit" value="查   询"  ></td>
                    <td><input class="sign-btn" type="reset" value="重   置" ></td>
                </tr>
            </table>
        </div>

    </form>
</div>
</body>
<script src="js/pluginsPackage/jquery/jquery.1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/pluginsPackage/bootstrap-3.3.0/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<script src="js/pluginsPackage/bootstrap-3.3.0/respond.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(function () {
        $("input[name!='keyl']").click(function () {
            var vars = $(this).val();
            if(vars == 0){
                document.getElementById("Vector").innerHTML="<table style=\"border-collapse:separate;color: white;border-spacing:21px 21px;font-size: 18px\" align=\"center\">\n" +
                    "                    <tr>\n" +
                    "                        <td>选择开始年份：</td>\n" +
                    "                        <td>\n" +
                    "                            <select name=\"check_year\" style='color: black;padding-right: 117.8px'>\n" +
                    "                                <option>请选择</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option>\n" +
                    "                                <option>2020</option><option>2021</option>\n" +
                    "                            </select>\n" +
                    "                        </td>\n" +
                    "                    </tr>\n" +
                    "                    <tr>\n" +
                    "                        <td>选择结束年份：</td>\n" +
                    "                        <td>\n" +
                    "                            <select name=\"check_eyear\" style='color: black;padding-right: 117.8px'>\n" +
                    "                                <option>请选择</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option>\n" +
                    "                                <option>2020</option><option>2021</option>\n" +
                    "                            </select>\n" +
                    "                        </td>\n" +
                    "                    </tr>\n" +
                    "                </table>";

            }
            if(vars == 1){
                document.getElementById("Vector").innerHTML="<table style=\"border-collapse:separate;color:white;border-spacing:21px 21px;font-size: 18px\" align=\"center\">\n" +
                    "                    <tr></tr>\n" +
                    "                    <tr>\n" +
                    "                        <td>选择年份：</td>\n" +
                    "                        <td>\n" +
                    "                            <select name=\"check_year\" style='color: black;padding-right: 117.8px'>\n" +
                    "                                <option>请选择</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option>\n" +
                    "                                <option>2020</option><option>2021</option>\n" +
                    "                            </select>\n" +
                    "                        </td>\n" +
                    "                    </tr>\n" +
                    "                </table>";

            }
            if(vars == 2){
                document.getElementById("Vector").innerHTML=" <table style=\"border-collapse:separate;color:white; border-spacing:21px 21px;font-size: 18px\" align=\"center\">\n" +
                    "                    <tr>\n" +
                    "                        <td>请选择年份</td>\n" +
                    "                        <td>\n" +
                    "                            <select name=\"check_year\" style='color: black;padding-right: 144.8px'>\n" +
                    "                                <option>请选择</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option>\n" +
                    "                                <option>2020</option><option>2021</option>\n" +
                    "                            </select>\n" +
                    "                        </td>\n" +
                    "                    </tr>\n" +
                    "                    <tr>\n" +
                    "                        <td>请输入月份</td>\n" +
                    "                        <td><input type=\"text\" name=\"check_month\" style='color: black;width: 144.8px'></td>\n" +
                    "                    </tr>\n" +
                    "                    <tr>\n" +
                    "                        <td>请输入日期</td>\n" +
                    "                        <td><input type=\"text\" name=\"check_date\" style='color: black;width: 144.8px'></td>\n" +
                    "                    </tr>\n" +
                    "                </table>";

            }
            $.parser.parse();
        })
    })
</script>

</html>
