# ChartDemo
===============================
AAChartKit 初體驗
===================================
##使用方法
1.将项目demo中的文件夹AAChartKitLib拖入到所需项目中.
2.在你的项目的 .pch 全局宏定义文件中添加 #import "AAGlobalMacro.h"
3.在视图控制器文件中添加 #import "AAChartKit.h"
4.创建视图AAChartView
CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height-100;
    self.aaChartView = [[AAChartView alloc]init];
    self.aaChartView.frame = CGRectMake(0, 100, chartViewWidth, chartViewHeight);
    self.aaChartView.delegate = self;
    self.aaChartView.scrollEnabled = YES;// AAChartView 滚动效果
    [self.view addSubview:self.aaChartView];
5.配置视图模型AAChartModel
 self.aaChartModel= AAChartModel.new
    .chartTypeSet(chartType)//图表类型
    .titleSet(@"Yabez2018-2019年度營業額")//图表主标题
    .titleFontSizeSet(@17)
    .subtitleSet(@"")//图表副标题
    .yAxisLineWidthSet(@1)//Y轴轴线线宽为0即是隐藏Y轴轴线
    .colorsThemeSet(@[@"#06caf4",@"#ffc069"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .tooltipValueSuffixSet(@"萬")//设置浮动提示框单位后缀
    .backgroundColorSet(@"#4b2b7f")
    .yAxisGridLineWidthSet(@1)//y轴横向分割线宽度为0(即是隐藏分割线)
    .zoomTypeSet(AAChartZoomTypeX)
    .touchEventEnabledSet(true)//支持用户点击事件
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"2018")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @36.5, @23.3, @18.3, @13.9, @9.6]),
                 AASeriesElement.new
                 .nameSet(@"2019")
                 .dataSet(@[@12, @24, @25, @23, @28, @32.0]),
                 ]
               );
    [self configureTheStyleForDifferentTypeChart];//为不同类型图表设置样式
    [self.aaChartView aa_drawChartWithChartModel:_aaChartModel];
    
_aaChartModel
    .categoriesSet(@[@"1", @"2", @"3", @"4", @"5", @"6",@"7", @"8", @"9", @"10", @"11", @"12"])//设置 X 轴坐标文字内容
    .animationTypeSet(AAChartAnimationEaseInQuad)//图形的渲染动画
    .animationDurationSet(@(800));//图形渲染动画时长为1200毫秒;
