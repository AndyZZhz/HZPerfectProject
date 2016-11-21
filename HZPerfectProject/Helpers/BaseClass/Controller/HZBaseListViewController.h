//
//  HZBaseListViewController.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/21.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "HZBaseViewController.h"
#import "MJRefresh.h"

@interface HZBaseListViewController : HZBaseViewController
@property (nonatomic, readonly) UITableView  *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSString       *cellClassName;
@property (nonatomic) NSUInteger              pageNo;
@property (nonatomic) NSUInteger              pageSize;

- (void)loadMore;
- (void)refreshData;
- (void)stopAnimating;
- (void)loadDataFinished:(BOOL)isMore;
- (void)loadDataFinished:(NSArray *)items more:(BOOL)isMore;
- (void)didSelectedItem:(id)selectedItem atIndexPath:(NSIndexPath *)indexPath;

@end
