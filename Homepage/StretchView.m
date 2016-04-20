//
//  StretchView.m
//  Homepage
//
//  Created by Ezreal on 16/4/20.
//  Copyright © 2016年 Ezreal. All rights reserved.
//

#import "StretchView.h"

@interface StretchView ()

@property(nonatomic, strong)UIImageView *stretchBgImage;

@end

@implementation StretchView

- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame])) {
        return nil;
    }
    
    _stretchBgImage = [[UIImageView alloc] init];
    _stretchBgImage.contentMode = UIViewContentModeScaleAspectFill;
    _stretchBgImage.image = [UIImage imageNamed:@"bg"];
    [self addSubview:_stretchBgImage];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _stretchBgImage.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

@end
