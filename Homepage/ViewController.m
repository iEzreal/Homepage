//
//  ViewController.m
//  HomepageDemo
//
//  Created by Ezreal on 16/4/19.
//  Copyright © 2016年 Ezreal. All rights reserved.
//

#import "ViewController.h"
#import "StretchView.h"

#define kHeight 300

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UIImageView *stretchImage;

@property(nonatomic, strong) StretchView *stretchView;
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    _tableView.contentInset = UIEdgeInsetsMake(kHeight, 0, 0, 0);
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    _stretchView = [[StretchView alloc] init];
    _stretchView.frame = CGRectMake(0, -kHeight, self.view.frame.size.width, kHeight);
    [_tableView addSubview:_stretchView];
    
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
    CGFloat yOffset  = scrollView.contentOffset.y;
    NSLog(@"偏移：%f", yOffset);

    if (yOffset < -kHeight) {
        CGFloat scale = ABS(yOffset) / kHeight;
        CGFloat width = self.view.frame.size.width * scale;
        CGFloat height =  ABS(yOffset);
        CGFloat x = - (width - self.view.frame.size.width) / 2;
        CGFloat y = yOffset;
        _stretchView.frame = CGRectMake(x, y, width, height);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NULL];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
