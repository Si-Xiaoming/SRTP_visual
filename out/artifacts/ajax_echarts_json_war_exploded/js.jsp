<%--
  Created by IntelliJ IDEA.
  User: sishu
  Date: 2021/1/30
  Time: 0:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>

</body>
<script>
    var date = new Array();
    var sumchange = new Array();
    var dtchange = new Array();

    var axis = new Array();
    var sumvolume = new Array();
    var change = new Array();

    var mycheck="";
    var check_year="";
    var check_date="";
    var check_month="";
    var check_eyear="";

    var righttitle = "总量改变图";
    var lefttile="总量变化图";

    function getData() {
        mycheck='${mycheck}';
        if(mycheck.toString()=="0"){
            check_year='${check_year}';
            check_eyear='${check_eyear}';
            righttitle = check_year.toString()+"-"+check_eyear.toString()+"年体量改变图";
            lefttile = check_year.toString()+"-"+check_eyear.toString()+"年总量变化图";
        }
        if(mycheck.toString()=="1"){
            check_year='${check_year}';
            righttitle = check_year.toString()+"年各月份体量改变图";
            lefttile = check_year.toString()+"年各月份总量变化图";
        }
        if(mycheck.toString()=="2"){
            check_year='${check_year}';
            check_month='${check_month}';
            check_date='${check_date}';
            righttitle = check_year.toString()+"年"+ check_month.toString()+"月"+check_date.toString()+"日"+"所在周体量改变图";
            lefttile = check_year.toString()+"年"+ check_month.toString()+"月"+check_date.toString()+"日"+"所在周总量变化图";
        }

        <c:forEach items="${list}" var="volume">
        date.push('${volume.date}');
        dtchange.push("${volume.change}");
        sumchange.push("${volume.sumvolume}");
        </c:forEach>
    }
    getData();
    function getNewData(){
        <c:forEach items="${newlist}" var="volume">
        axis.push('${volume.axis}');
        change.push("${volume.change}");
        sumvolume.push("${volume.sumchange}");
        </c:forEach>
    }
    getNewData();

    function load_dtchange(){
        var option = {
            tooltip: {trigger: 'axis',},   //也可以是item
            grid: {
                top: '15%',  // 组件离容器上侧的距离,百分比字符串或整型数字
                left: '1%',    // 组件离容器左侧的距离,百分比字符串或整型数字
                right: '4%',
                bottom: '4%',
                containLabel: true //grid 区域是否包含坐标轴的刻度标签，
            }, //在容器中的位置
            legend: {
                icon: 'rect',    //图例是方形
                itemWidth: 14,itemHeight: 5,itemGap:10,  //图例宽度、高度、间隔
                data: ["改变量变化","改变量变化"],
                right: '10px',top: '0px',
                textStyle: {fontSize: 12,color: '#fff'}
            },
            title:{
                text: righttitle,
                //text:"2018年变化",
                x:'center',
                link:'',
                backgroundColor: 'rgba(1,1,1,0)',
                textStyle: { //主标题文本样式{"fontSize": 18,"fontWeight": "bolder","color": "#333"}
                    //fontFamily: 'Arial, Verdana, sans...',
                    fontSize: 20,
                    color:"#03C2EC",
                    fontStyle: 'normal',
                    fontWeight: 'normal',
                },
            },
            xAxis: [
                {
                    type: 'category',
                    axisLine: {lineStyle: {color: '#ff2505'}},
                    axisLabel: {
                        interval:0,
                        textStyle: {color:'#fff',},
                    }, //x轴颜色 ||字体颜色||interval可以让文字显示全
                    data:axis,
                }
            ],
            yAxis: [{
                type: 'value',
                axisTick: {
                    show: false   //坐标线是否出去
                },
                axisLine: {lineStyle: {color: '#57617B'}},
                axisLabel: {margin: 10,textStyle: {fontSize: 12},textStyle: {color:'#fff'},formatter:'{value}'},
                splitLine: {
                    show: true,
                    lineStyle:{
                        type:'dashed',
                        color: ['#25CEF3']
                    }
                }  , //格网线
                name:'单位：吨',
                //nameLocation:'middle',
                nameTextStyle:{
                    color:"white",
                    fontSize:12,
                    padding:15
                }
            }],
            series: [
                {
                    name:'改变量变化',
                    type: 'line',smooth: true,
                    lineStyle: {normal: {width: 2}},
                    itemStyle : {
                        normal: {
                            barBorderRadius:[10, 10, 0, 0],
                            color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
                                offset: 0,
                                color: "#009AFD"
                            }, {
                                offset: 0.8,
                                color: "#33DAFF"
                            }], false),
                            shadowColor: 'rgba(0, 0, 0, 0.1)',
                        }
                    },
                    data:change,
                },
                {
                    name:'改变量变化',
                    type:'bar',
                    barWidth:20,
                    barGap:2,
                    data:change,
                    itemStyle : {
                        normal: {
                            barBorderRadius:function (params) {
                                return params>=0?[10,10,0,0]:[0,0,10,10];
                            },
                            color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
                                offset: 0,
                                color: "#E57230"
                            }, {
                                offset: 0.8,
                                color: "#D8AE22"
                            }], false),
                            shadowColor: 'rgba(0, 0, 0, 0.1)',
                        }
                    },
                }]
        };
        var myChart = echarts.init(document.getElementById('sumchange'));
        myChart.setOption(option);
    }
    function load_sumchange(){
        var option = {
            tooltip: {trigger: 'axis',},   //也可以是item
            grid: {
                top: '15%',  // 组件离容器上侧的距离,百分比字符串或整型数字
                left: '1%',    // 组件离容器左侧的距离,百分比字符串或整型数字
                right: '4%',
                bottom: '4%',
                containLabel: true //grid 区域是否包含坐标轴的刻度标签，
            },  //在容器中的位置
            legend: {
                icon: 'rect',    //图例是方形
                itemWidth: 14,itemHeight: 5,itemGap:10,  //图例宽度、高度、间隔
                data: ["总量变化","总量变化"],
                right: '10px',top: '0px',
                textStyle: {fontSize: 12,color: '#fff'}
            },
            title:{
                text:lefttile,
                x:'center',
                link:'',
                backgroundColor: 'rgba(1,1,1,0)',
                textStyle: { //主标题文本样式{"fontSize": 18,"fontWeight": "bolder","color": "#333"}
                    //fontFamily: 'Arial, Verdana, sans...',
                    fontSize: 20,
                    color:"#03C2EC",
                    fontStyle: 'normal',
                    fontWeight: 'normal',
                },
            },
            xAxis: [
                {
                    type: 'category',
                    axisLine: {lineStyle: {color: '#57617B'}},
                    axisLabel: {
                        interval:0,
                        textStyle: {color:'#fff',},
                    },
                    //data:date
                    data:axis
                }
            ],
            yAxis: [{
                type: 'value',
                axisTick: {
                    show: false
                },
                axisLine: {lineStyle: {color: '#57617B'}},
                axisLabel: {margin: 10,textStyle: {fontSize: 12},textStyle: {color:'#fff'},formatter:'{value}'},
                splitLine: {
                    show: true,
                    lineStyle:{
                        type:'dashed',
                        color: ['#25CEF3']
                    }
                },
                name:'单位：吨',
                //nameLocation:'middle',
                nameTextStyle:{
                    color:"white",
                    fontSize:12,
                    padding:15
                }
            }],
            series: [
                {
                    name:'总量变化',
                    type: 'line',smooth: true,
                    lineStyle: {normal: {width: 2}},
                    //data:sumchange,
                    data:sumvolume,
                    itemStyle : {
                        normal: {
                            barBorderRadius:[10, 10, 0, 0],
                            color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
                                offset: 0,
                                color: "#009AFD"
                            }, {
                                offset: 0.8,
                                color: "#33DAFF"
                            }], false),
                            shadowColor: 'rgba(0, 0, 0, 0.1)',
                        }
                    },
                },
                {
                    name:'总量变化',
                    type:'bar',
                    barWidth:20,
                    barGap:2,
                    itemStyle : {
                        normal: {
                            barBorderRadius:[10, 10, 0, 0],
                            color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
                                offset: 0,
                                color: "#E57230"
                            }, {
                                offset: 0.8,
                                color: "#D8AE22"
                            }], false),
                            shadowColor: 'rgba(0, 0, 0, 0.1)',
                        }
                    },
                    //data:sumchange,
                    data: sumvolume,
                }]
        };
        var myChart = echarts.init(document.getElementById('dtchange'));
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }
    function load_dting(){
        var option = {
            tooltip: {trigger: 'axis',},   //也可以是item
            grid: {
                top: '19%',  // 组件离容器上侧的距离,百分比字符串或整型数字
                left: '1%',    // 组件离容器左侧的距离,百分比字符串或整型数字
                right: '1%',
                bottom: '4%',
                containLabel: true //grid 区域是否包含坐标轴的刻度标签，
            },      //解决name显示不全
            legend: {
                icon: 'rect',    //图例是方形
                itemWidth: 14,itemHeight: 5,itemGap:10,  //图例宽度、高度、间隔
                data: ["改变量","总量变化"],
                right: '10px',top: '0px',
                textStyle: {fontSize: 12,color: '#fff'}
            },
            xAxis: [
                {
                    type: 'category',
                    axisLine: {lineStyle: {color: '#57617B'}},
                    axisLabel: {
                        interval:2,
                        textStyle: {color:'#fff',},
                        formatter:function(params){
                            var newParamsName = "";
                            var paramsNameNumber = params.length;
                            var list=params.split(' ');
                            newParamsName=list[0]+'\n'+list[1];
                            return newParamsName;
                        }
                    },
                    data:date
                }
            ],
            yAxis: [{
                type: 'value',
                axisTick: {
                    show: false
                },
                axisLine: {lineStyle: {color: '#57617B'}},
                axisLabel: {margin: 10,textStyle: {fontSize: 12},textStyle: {color:'#fff'},formatter:'{value}'},
                splitLine: {
                    show: true,
                    lineStyle:{
                        type:'dashed',
                        color: ['#25CEF3']
                    }
                },
                name:'单位：吨',
                //nameLocation:'middle',
                nameTextStyle:{
                    color:"white",
                    fontSize:12,
                    padding:15
                }
            },
                {
                    type: 'value',
                    axisTick: {
                        show: false
                    },
                    axisLine: {lineStyle: {color: '#57617B'}},
                    axisLabel: {margin: 10,textStyle: {fontSize: 12},textStyle: {color:'#fff'},formatter:'{value}'},
                    splitLine: {
                        show: true,
                        lineStyle:{
                            type:'dashed',
                            color: ['#25CEF3']
                        }
                    },
                    name:'单位：吨',
                    //nameLocation:'middle',
                    nameTextStyle:{
                        color:"white",
                        fontSize:12,
                        padding:15
                    }
                }
            ],
            series: [
                {
                    name:'改变量',
                    yAxisIndex:0,
                    type: 'line',smooth: true,
                    lineStyle: {normal: {width: 2}},
                    data:dtchange,
                    itemStyle : {
                        normal: {
                            barBorderRadius:[10, 10, 0, 0],
                            color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
                                offset: 0,
                                color: "#009AFD"
                            }, {
                                offset: 0.8,
                                color: "#33DAFF"
                            }], false),
                            shadowColor: 'rgba(0, 0, 0, 0.1)',
                        }
                    },
                    areaStyle: {
                        normal: {
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgba(230, 48, 123, 0.8)'
                            }, {
                                offset: 0.8,
                                color: 'rgba(230, 48, 123, 0)'
                            }], false),
                            shadowColor: 'rgba(0, 0, 0, 0.1)',
                            shadowBlur: 10
                        }
                    },
                },
                {
                    name:'总量变化',
                    type:'bar',
                    barWidth:20,
                    yAxisIndex:1,
                    barGap:2,
                    itemStyle : {
                        normal: {
                            barBorderRadius:[10, 10, 0, 0],
                            color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
                                offset: 0,
                                color: "#E57230"
                            }, {
                                offset: 0.8,
                                color: "#D8AE22"
                            }], false),
                            shadowColor: 'rgba(0, 0, 0, 0.1)',
                        }
                    },
                    data:sumchange,
                }]
        };
        var myChart = echarts.init(document.getElementById('dting'));
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }
    $(function () {
        load_dtchange();
        load_sumchange();
        load_dting();
        $("#check1").on('click', function() {
                location.href = "/check.jsp";
            }
        )
        $("#check2").on('click', function() {
            location.href = "/check.jsp";
        })
    })
</script>



<script>
    container = document.getElementById('divs')
    // document.body.appendChild(container);
    var scene = new THREE.Scene();
    //var camera = new THREE.PerspectiveCamera( 75, window.innerWidth/window.innerHeight, 0.1, 1000 );
    var camera = new THREE.PerspectiveCamera( 75, document.getElementById('divs').clientWidth/document.getElementById('divs').clientHeight, 0.1, 1000 );
    // camera.position.z = 100;
    // camera.position.y = 50;
    // camera.rotation.x = -0.78;
    camera.position.z = 100;
    camera.position.y = 100;
    camera.rotation.x = 0.78;

    var renderer = new THREE.WebGLRenderer({alpha:true});
    renderer.setClearColor(0x000000,0);
    //renderer.setSize( window.innerWidth, window.innerHeight );
    renderer.setSize( document.getElementById('divs').clientWidth, document.getElementById('divs').clientHeight );
    container.appendChild( renderer.domElement );

    function randomColor() {
        var arrHex = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"],
            strHex = "0x",
            index;
        for (var i = 0; i < 6; i++) {
            index = Math.round(Math.random() * 15);
            strHex += arrHex[index];
        }
        return strHex;
    }

    // var stats;
    // function initStats() {
    //     stats = new Stats();
    //     container.appendChild(stats.dom);
    // }

    function onWindowResize() {

        //camera.aspect = window.innerWidth / window.innerHeight;
        camera.aspect = document.getElementById('divs').clientWidth/document.getElementById('divs').clientHeight;
        camera.updateProjectionMatrix();
        //renderer.setSize( window.innerWidth, window.innerHeight );
        renderer.setSize( document.getElementById('divs').clientWidth, document.getElementById('divs').clientHeight);
        renderer.render( scene, camera );
    }

    var controls;
    function initControls() {
        controls = new THREE.OrbitControls(camera, renderer.domElement);
        controls.enableDamping = true;
        controls.enableZoom = true;
        controls.autoRotate = false;
        controls.minDistance = 5;
        controls.maxDistance = 10000;
        controls.enablePan = true;
    }


    //initStats();

    initControls();

    var object = new THREE.AxesHelper(500);
    scene.add(object);

    var geometry = new THREE.Geometry();
    var material = new THREE.PointsMaterial(
        {size: 0.5, vertexColors: true, color: 0xffffff}
    );

    function addpoints() {
        for (var x = -5; x <= 5; x++) {
            for (var y = -5; y <= 5; y++) {
                var particle = new THREE.Vector3(x * 10, y * 10, 0.1);
                geometry.vertices.push(particle);
                geometry.colors.push(new THREE.Color(+randomColor()));
            }
        }
    }
    //addpoints();

    var x,y,z,r,g,b;
    var jsonFile = "./data/dense_cloud.json";

    $.ajax({
        type: "get",
        url: jsonFile,
        dataType: "json",
        async: false,
        success: function(data){
            var index = 0;
            console.log("data point size ：", data.length);
            for(var i = 0; i < data.length; i++){
                x = -data[i][0]*10;
                y = -data[i][1]*10;
                z = data[i][2]*10;
                r = data[i][3]/255;
                g = data[i][4]/255;
                b = data[i][5]/255;
                var particle = new THREE.Vector3(x, y, z);
                geometry.vertices.push(particle);
                geometry.colors.push(new THREE.Color(r,g,b));

            }
            console.log("load done!");
        }
    });

    var cloud2;
    cloud2 = new THREE.Points(geometry, material);
    scene.add(cloud2);
    var animate = function () {
        controls.update();
        //stats.update();

        requestAnimationFrame( animate );
        renderer.render( scene, camera );
    };

    animate();
    window.onresize = onWindowResize;
</script>
</html>
