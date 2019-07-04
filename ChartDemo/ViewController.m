//
//  ViewController.m
//  ChartDemo
//
//  Created by mac on 2019/7/3.
//  Copyright © 2019年 BSurprise. All rights reserved.
//

#import "ViewController.h"
#import "BarChartViewController.h"
#import "PieChartViewController.h"
#import "LineChart1ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *items;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Analytics Chart";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *def = self.items[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = def[@"title"];
    cell.detailTextLabel.text = def[@"subtitle"];
    cell.detailTextLabel.numberOfLines = 0;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *def = self.items[indexPath.row];
    
    Class vcClass = def[@"class"];
    UIViewController *vc = [[vcClass alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSArray *)items{
    if (!_items) {
        _items = @[@{
                       @"title": @"Bar Chart",
                       @"subtitle": @"A simple demonstration of the bar chart.",
                       @"class": BarChartViewController.class
                       }
                   ,@{
                       @"title": @"Pie Chart",
                       @"subtitle": @"A simple demonstration of the pie chart.",
                       @"class": PieChartViewController.class
                       },
                   @{
                       @"title": @"Line Chart",
                       @"subtitle": @"A simple demonstration of the linechart.",
                       @"class": LineChart1ViewController.class
                       }];
    }
    return _items;
}

@end
