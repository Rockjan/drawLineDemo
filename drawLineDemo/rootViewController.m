//
//  rootViewController.m
//  drawLineDemo
//
//  Created by zy_PC on 14-6-8.
//  Copyright (c) 2014年 zy_PC. All rights reserved.
//

#import "rootViewController.h"
#import "drawLine.h"
#import "drawRect.h"
#import "productItem.h"

@interface rootViewController ()

@end

@implementation rootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initMyView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    myTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    myTableView.dataSource = self;
    myTableView.delegate = self;
    
    [self.view addSubview:myTableView];
    
    [myTableView release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    CGRect frame = cell.frame;
    
    if (indexPath.section == 0) {
        
        [cell.contentView addSubview:myLine];
        
    }else if(indexPath.section == 1){
        
        [cell.contentView addSubview:myRect];
    }

    [cell setFrame:CGRectMake(frame.origin.x,frame.origin.y,frame.size.width,300)];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   // return self.view.bounds.size.height/2.2;
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
- (void)initMyView
{
    CGRect frame =self.view.bounds;
    
    NSMutableArray *tempData = [[NSMutableArray alloc] initWithCapacity:12];
    
    for (int i = 0; i < 12 ; i++) {
        
        productItem *item = [[productItem alloc] init];
        
        //item.price = (rand()%300)*1.0;
        item.price = (12-i)*123*1.0;
        item.name = [NSString stringWithFormat:@"Pro:%d",i+1];
        
        [tempData addObject:item];
        [item release];
    }
    
    
    myRect = [[drawRect alloc] initWithFrame:CGRectMake(frame.origin.x,frame.origin.y,frame.size.width,300)];
    
    myRect.datas = [tempData mutableCopy];
    
    
    
    NSArray *temp1 = @[@"1200",@"2650",@"1",@"1",@"500",@"104",@"345",@"906",@"208",@"336",@"2000",@"394"];
     NSArray *temp2 = @[@"120",@"260",@"123",@"500",@"400",@"104",@"365",@"906",@"208",@"636",@"200",@"394",
       @"130",@"650",@"231",@"210",@"550",@"214",@"735",@"606",@"408",@"336",@"600",@"694",
       @"432",@"250",@"178",@"791",@"700",@"445",@"450",@"0"]; //数据一定要有31个，不足的（比如2月份只有28天）用0 补齐
    
    myLine = [[drawLine alloc] initWithFrame:CGRectMake(frame.origin.x,frame.origin.y,frame.size.width,300)];
    
    myLine.vCount = 10;
    myLine.hCount = 10; //按月份显示 设置为10 按年份显示 设置为11
    myLine.datas = [temp2 mutableCopy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
