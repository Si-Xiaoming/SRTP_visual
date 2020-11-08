

function load_dtchange(tested){

    // 基于准备好的dom，初始化echarts实例

    // 指定图表的配置项和数据
    var option = {
        tooltip: {trigger: 'axis',},   //也可以是item
        grid: {left:'6%',right: '5%',bottom:'10%'},  //在容器中的位置
            legend: {
            icon: 'rect',    //图例是方形
            itemWidth: 14,itemHeight: 5,itemGap:10,  //图例宽度、高度、间隔
            data: ["改变量变化","改变量变化"],
            right: '10px',top: '0px',
            textStyle: {fontSize: 12,color: '#fff'}
        },
        xAxis: [
            {
                type: 'category',
                axisLine: {lineStyle: {color: '#ff2505'}},
                axisLabel: {
                    interval:0,
                    textStyle: {color:'#fff',},

                    formatter:function(params){
                        var newParamsName = "";
                        var paramsNameNumber = params.length;
                        var list=params.split(' ');
                        newParamsName=list[0]+'\n'+list[1];
                        return newParamsName;
                    }

                    }, //x轴颜色 ||字体颜色||interval可以让文字显示全
                data:tested.date,



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
            }   //格网线

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
                data:tested.dtchange,
            },
            {
                name:'改变量变化',
                type:'bar',
                barWidth:20,
                barGap:2,
                data:tested.dtchange,
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
    var myChart = echarts.init(document.getElementById('dtchange'));
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

}
function load_sumchange(tested){
    var option = {
        tooltip: {trigger: 'axis',},   //也可以是item
        grid: {left:'6%',right: '5%',bottom:'10%'},  //在容器中的位置
        legend: {
            icon: 'rect',    //图例是方形
            itemWidth: 14,itemHeight: 5,itemGap:10,  //图例宽度、高度、间隔
            data: ["总量变化","总量变化"],
            right: '10px',top: '0px',
            textStyle: {fontSize: 12,color: '#fff'}
        },
        xAxis: [
            {
                type: 'category',
                axisLine: {lineStyle: {color: '#57617B'}},
                axisLabel: {
                    interval:0,
                    textStyle: {color:'#fff',},
                    formatter:function(params){
                        var newParamsName = "";
                        var paramsNameNumber = params.length;
                        var list=params.split(' ');
                        newParamsName=list[0]+'\n'+list[1];
                        return newParamsName;
                    }
                    },
                data:tested.date
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
            }

        }],
        series: [
            {
                name:'总量变化',
                type: 'line',smooth: true,
                lineStyle: {normal: {width: 2}},
                data:tested.sumchange,
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
                data:tested.sumchange,
            }]
    };
    var myChart = echarts.init(document.getElementById('sumchange'));
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
}

$(function () {
    load_dtchange(tested);
    load_sumchange(tested);
})