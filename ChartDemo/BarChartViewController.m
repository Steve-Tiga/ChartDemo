//
//  BarChartViewController.m
//  ChartDemo
//
//  Created by mac on 2019/7/4.
//  Copyright © 2019年 BSurprise. All rights reserved.
//

#import "BarChartViewController.h"
#import "AAChartKit.h"

@interface BarChartViewController ()<AAChartViewEventDelegate>

@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;

@end

@implementation BarChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Bar Chart";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpTheAAChartViewWithChartType:AAChartTypeColumn];
}

- (void)setUpTheAAChartViewWithChartType:(AAChartType)chartType {
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height-100;
    self.aaChartView = [[AAChartView alloc]init];
    self.aaChartView.frame = CGRectMake(0, 100, chartViewWidth, chartViewHeight);
//        self.aaChartView.contentWidth = chartViewWidth*3/2;
    self.aaChartView.delegate = self;
    self.aaChartView.scrollEnabled = YES;// AAChartView 滚动效果
    [self.view addSubview:self.aaChartView];
    self.aaChartView.backgroundColor = [UIColor clearColor];
    
    
    //设置 AAChartView 的背景色是否为透明
    self.aaChartView.isClearBackgroundColor = YES;
    
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
}

- (void)configureTheStyleForDifferentTypeChart {
    _aaChartModel
    .categoriesSet(@[@"1", @"2", @"3", @"4", @"5", @"6",@"7", @"8", @"9", @"10", @"11", @"12"])//设置 X 轴坐标文字内容
    .animationTypeSet(AAChartAnimationEaseInQuad)//图形的渲染动画
    .animationDurationSet(@(800));//图形渲染动画时长为1200毫秒;
}


@end
