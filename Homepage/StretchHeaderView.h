//
//  StretchHeaderView.h
//  HomepageDemo
//
//  Created by Ezreal on 16/4/19.
//  Copyright © 2016年 Ezreal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StretchHeaderView : UIView
- (instancetype)initWithImage:(NSString *)image contentView:(UIView *)contentView height:(CGFloat)h;
- (void)scrollViewDidScroll:(UIScrollView*)scrollView;

@end
