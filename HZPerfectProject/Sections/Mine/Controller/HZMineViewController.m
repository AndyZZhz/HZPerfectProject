//
//  HZMineViewController.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/21.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "HZMineViewController.h"

@interface HZMineViewController ()

@end

@implementation HZMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    // Do any additional setup after loading the view.
}
#pragma UITableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellName";
    UITableViewCell *houseCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (houseCell == nil) {
        houseCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    houseCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    houseCell.textLabel.text = @"123";
    
    
    return houseCell;
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

@end
