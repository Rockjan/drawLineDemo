//
//  rootViewController.h
//  drawLineDemo
//
//  Created by zy_PC on 14-6-8.
//  Copyright (c) 2014年 zy_PC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class drawLine;
@class drawRect;

@interface rootViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *myTableView;
    drawRect *myRect;
    drawLine *myLine;
}
@end
