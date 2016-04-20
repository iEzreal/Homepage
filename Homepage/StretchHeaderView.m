//
//  StretchHeaderView.m
//  HomepageDemo
//
//  Created by Ezreal on 16/4/19.
//  Copyright © 2016年 Ezreal. All rights reserved.
//

#import "StretchHeaderView.h"

@interface StretchHeaderView ()

@property(nonatomic, strong) UIImageView *bgImageView;

@end

@implementation StretchHeaderView

- (instancetype)initWithImage:(NSString *)image contentView:(UIView *)contentView height:(CGFloat)h {
    CGFloat w = [[UIScreen mainScreen] bounds].size.width;
    if (!(self = [super initWithFrame:CGRectMake(0, 0, w, h)])) {
        return nil;
    }
    
    _bgImageView = [[UIImageView alloc] initWithFrame:self.frame];
    _bgImageView.backgroundColor = [UIColor redColor];
    _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    _bgImageView.clipsToBounds = YES;
    _bgImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg" ofType:@"png"]];
    [self addSubview:_bgImageView];
    [self addSubview:contentView];
    
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
    CGFloat width = self.frame.size.width; // 图片宽度
    CGFloat yOffset = scrollView.contentOffset.y; // 偏移的y值
    
    if (yOffset < 0) {
        
        CGFloat totalHeight = 300 + ABS(yOffset);
        
        CGFloat f = totalHeight / 300;
        
        _bgImageView.frame =CGRectMake(- (width * f - width) / 2, yOffset, width * f, totalHeight); //拉伸后的图片的frame应该是同比例缩放。
    }
}

@end
