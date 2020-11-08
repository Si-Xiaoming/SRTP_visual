# 开发学习

## echarts

### X轴文字过长

1.换行

```javascript
 axisLabel: {
                        show: true,
                        interval: 0,
                        formatter: function (params) {
                            var newParamsName = "";
                            var paramsNameNumber = params.length;
                            var provideNumber = 3;  //一行显示几个字
                            var rowNumber = Math.ceil(paramsNameNumber / provideNumber);
                            if (paramsNameNumber > provideNumber) {
                                for (var p = 0; p < rowNumber; p++) {
                                    var tempStr = "";
                                    var start = p * provideNumber;
                                    var end = start + provideNumber;
                                    if (p == rowNumber - 1) {
                                        tempStr = params.substring(start, paramsNameNumber);
                                    } else {
                                        tempStr = params.substring(start, end) + "\n";
                                    }
                                    newParamsName += tempStr;
                                }

                            } else {
                                newParamsName = params;
                            }
                            return newParamsName
                        },
                    }
```

2.按照字符串切割

```javascript
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
        ],//x轴颜色 ||字体颜色||interval可以让文字显示全
```

### echarts图形配置

1. tooltip

   用于编辑提示符。

   ```javascript
   tooltip : {
          trigger: 'item'  //显示点  或者是'axis':显示轴
     },
   ```

   

2. grid

   ```javascript
   grid: {left:'6%',right: '5%',bottom:'10%'},  //在容器中的位置
   ```

   

3. 