# ChartDemo
AAChartKit 初體驗

##使用方法<br>
###由於公司需求，只嘗試了柱狀圖、餅狀圖、折線圖
===================================
1.将项目demo中的文件夹AAChartKitLib拖入到所需项目中.<br>  
2.在你的项目的 .pch 全局宏定义文件中添加 #import "AAGlobalMacro.h"<br>
3.在视图控制器文件中添加 #import "AAChartKit.h"<br>
4.创建视图AAChartView<br>
CGFloat chartViewWidth  = self.view.frame.size.width;<br>
    CGFloat chartViewHeight = self.view.frame.size.height-100;<br>
    self.aaChartView = [[AAChartView alloc]init];<br>
    self.aaChartView.frame = CGRectMake(0, 100, chartViewWidth, chartViewHeight);<br>
    self.aaChartView.delegate = self;<br>
    self.aaChartView.scrollEnabled = YES;// AAChartView 滚动效果<br>
    [self.view addSubview:self.aaChartView];<br>
5.配置视图模型AAChartModel<br>
 self.aaChartModel= AAChartModel.new<br>
    .chartTypeSet(chartType)//图表类型<br>
    .titleSet(@"Yabez2018-2019年度營業額")//图表主标题<br>
    .titleFontSizeSet(@17)<br>
    .subtitleSet(@"")//图表副标题<br>
    .yAxisLineWidthSet(@1)//Y轴轴线线宽为0即是隐藏Y轴轴线<br>
    .colorsThemeSet(@[@"#06caf4",@"#ffc069"])//设置主体颜色数组<br>
    .yAxisTitleSet(@"")//设置 Y 轴标题<br>
    .tooltipValueSuffixSet(@"萬")//设置浮动提示框单位后缀<br>
    .backgroundColorSet(@"#4b2b7f")<br>
    .yAxisGridLineWidthSet(@1)//y轴横向分割线宽度为0(即是隐藏分割线)<br>
    .zoomTypeSet(AAChartZoomTypeX)<br>
    .touchEventEnabledSet(true)//支持用户点击事件<br>
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2018")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @36.5, @23.3, @18.3, @13.9, @9.6]),
                 AASeriesElement.new
                 .nameSet(@"2019")
                 .dataSet(@[@12, @24, @25, @23, @28, @32.0]),
                 ]
               );<br>
    [self configureTheStyleForDifferentTypeChart];//为不同类型图表设置样式<br>
    [self.aaChartView aa_drawChartWithChartModel:_aaChartModel];<br>
    
_aaChartModel<br>
    .categoriesSet(@[@"1", @"2", @"3", @"4", @"5", @"6",@"7", @"8", @"9", @"10", @"11", @"12"])//设置 X 轴坐标文字内容
    .animationTypeSet(AAChartAnimationEaseInQuad)//图形的渲染动画
    .animationDurationSet(@(800));//图形渲染动画时长为1200毫秒;
