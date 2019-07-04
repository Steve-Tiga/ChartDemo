//
//  PieChartViewController.m
//  ChartDemo
//
//  Created by mac on 2019/7/4.
//  Copyright © 2019年 BSurprise. All rights reserved.
//

#import "PieChartViewController.h"
#import "AAChartKit.h"

@interface PieChartViewController ()

@property (nonatomic, strong) AAChartModel *chartModel;
@property (nonatomic, strong) AAChartView  *chartView;

@end

@implementation PieChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Pie Chart";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configureTheChartViewWithChartType:AAChartTypePie];
}

- (void)configureTheChartViewWithChartType:(AAChartType)chartType  {
    self.chartView = [[AAChartView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60)];
    self.view.backgroundColor = [UIColor whiteColor];
    self.chartView.scrollEnabled = NO;
    // self.chartView.contentHeight = self.view.frame.size.height-220;
    [self.view addSubview:self.chartView];
    
    self.chartModel = AAChartModel.new
    .chartTypeSet(chartType)
    .animationDurationSet(@1500)
    .titleSet(@"Yabez各項業務營業額佔比")
    .titleFontSizeSet(@17)
    .dataLabelEnabledSet(true)//是否直接显示扇形图数据
    .seriesSet(@[
                                AASeriesElement.new
                                .nameSet(@"營業額")
                                .innerSizeSet(@"40%")//内部圆环半径大小占比
                                .borderWidthSet(@0)//描边的宽度
                                .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
                                .dataSet(
                                         @[
                                           @[@"外包業務",@120],
                                           @[@"企業服務",@100],
                                           @[@"成立公司",@90],
                                           @[@"增值服務",@88.5],
                                           @[@"其他",@46.0],
                                           ]
                                         ),
                                ]);
    self.chartModel.polar = true;
    [self.chartView aa_drawChartWithChartModel:self.chartModel];
}




@end
