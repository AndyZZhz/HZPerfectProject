//
//  HZBaseListViewController.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/21.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "HZBaseListViewController.h"
#import "HZBaseTableViewCell.h"

@interface HZBaseListViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic) BOOL                 isLoadingData;
@end

@implementation HZBaseListViewController

#pragma mark - getter and setter

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT - 20 - 44)
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        __weak typeof (self) blockSelf = self;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            //Call this Block When enter the refresh status automatically
            if (!blockSelf.isLoadingData) {
                [blockSelf refreshData];
            }
        }];
        
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            //Call this Block When enter the refresh status automatically
            if (!blockSelf.isLoadingData) {
                [blockSelf loadMore];
            }
        }];
        
        [_tableView.mj_footer setHidden:YES];
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.cellClassName = @"DDTableViewCell";
        self.isLoadingData = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - public method

- (void)refreshData{
    [self setIsLoadingData:YES];
    [self setPageNo:1];
}

- (void)loadMore{
    self.isLoadingData = YES;
}

- (void)stopAnimating{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
    [self setIsLoadingData:NO];
}

- (void)scrollToTop
{
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, self.tableView.width, 1) animated:NO];
}

- (void)loadDataFinished:(BOOL)isMore
{
    [self stopAnimating];
    if (!self.dataSource.count) {
    }
    if (isMore) {
        [self.tableView.mj_footer setHidden:NO];
        [self.tableView.mj_footer resetNoMoreData];
    }else {
        if (self.dataSource.count == 0) {
            [self.tableView.mj_footer setHidden:YES];
        }
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
    [self.tableView reloadData];
}

- (void)loadDataFinished:(NSArray *)items more:(BOOL)isMore
{
    if ([items count]) {
        self.pageNo++;
        [self.dataSource addObjectsFromArray:items];
    }
    [self loadDataFinished:isMore];
}

- (void)didSelectedItem:(id)selectedItem atIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *kIdentitify = [NSClassFromString(self.cellClassName) description];
    HZBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentitify];
    if (!cell) {
        cell = [[NSClassFromString(self.cellClassName) alloc] initWithStyle:UITableViewCellStyleDefault
                                                            reuseIdentifier:kIdentitify];
    }
    
    if (indexPath.row < self.dataSource.count) {
        [cell cellWithData:[self.dataSource objectAtIndex:indexPath.row] forIndexPath:indexPath];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[((HZBaseTableViewCell *)NSClassFromString(self.cellClassName)) class] cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.dataSource.count > indexPath.row) {
        [self didSelectedItem:[self.dataSource objectAtIndex:indexPath.row] atIndexPath:indexPath];
    }
}

@end
