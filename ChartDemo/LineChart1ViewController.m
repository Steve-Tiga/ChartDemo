//
//  LineChart1ViewController.m
//  ChartDemo
//
//  Created by mac on 2019/7/4.
//  Copyright © 2019年 BSurprise. All rights reserved.
//

#import "LineChart1ViewController.h"
#import "AAChartKit.h"

@interface LineChart1ViewController ()<AAChartViewEventDelegate>

@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;

@end

@implementation LineChart1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Line Chart";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpTheAAChartViewWithChartType:AAChartTypeLine];
}

- (void)setUpTheAAChartViewWithChartType:(AAChartType)chartType {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height;
    self.aaChartView = [[AAChartView alloc]init];
    self.aaChartView.frame = CGRectMake(0, 100, chartViewWidth, chartViewHeight-100);
    self.aaChartView.delegate = self;
    self.aaChartView.scrollEnabled = NO;//禁用 AAChartView 滚动效果
    //    设置aaChartVie 的内容高度(content height)
    //    self.aaChartView.contentHeight = chartViewHeight*2;
    //    设置aaChartVie 的内容宽度(content  width)
    //    self.aaChartView.contentWidth = chartViewWidth*2;
    [self.view addSubview:self.aaChartView];
    self.aaChartView.backgroundColor = [UIColor clearColor];
    
    
    //设置 AAChartView 的背景色是否为透明
    self.aaChartView.isClearBackgroundColor = YES;
    
    self.aaChartModel= AAChartModel.new
    .chartTypeSet(chartType)//图表类型
    .titleSet(@"Yabez各項業務營業額走勢")//图表主标题
    .titleFontSizeSet(@17)
    .subtitleSet(@"")//图表副标题
    .yAxisLineWidthSet(@1)//Y轴轴线线宽为0即是隐藏Y轴轴线
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .tooltipValueSuffixSet(@"萬")//设置浮动提示框单位后缀
    .backgroundColorSet(@"#4b2b7f")
    .yAxisGridLineWidthSet(@1)//y轴横向分割线宽度为0(即是隐藏分割线)
    .touchEventEnabledSet(true)//支持用户点击事件
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"外包業務")
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
                 AASeriesElement.new
                 .nameSet(@"企業服務")
                 .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
                 AASeriesElement.new
                 .nameSet(@"成立公司")
                 .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]),
                 AASeriesElement.new
                 .nameSet(@"增值服務")
                 .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8]),
                 ]
               );
    [self configureTheStyleForDifferentTypeChart];//为不同类型图表设置样式
    
    /*配置 Y 轴标注线,解开注释,即可查看添加标注线之后的图表效果(NOTE:必须设置 Y 轴可见)*/
    //    [self configureTheYAxisPlotLineForAAChartView];
    
    [self.aaChartView aa_drawChartWithChartModel:_aaChartModel];
}

- (void)configureTheStyleForDifferentTypeChart {
    _aaChartModel
//    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//设置折线连接点样式为:边缘白色
    .xAxisCrosshairWidthSet(@01.2)//Zero width to disable crosshair by default
    .xAxisCrosshairColorSet(@"#778899")//浅石板灰准星线
    .xAxisCrosshairDashStyleTypeSet(AALineDashStyleTypeLongDashDotDot)
    .categoriesSet(@[@"1", @"2", @"3", @"4", @"5", @"6",@"7", @"8", @"9", @"10", @"11", @"12"]);//设置 X 轴坐标文字内容
}

@end
