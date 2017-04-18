//
//  ZYLeadingPageCell.m
//  ZYLeadingPage
//
//  Created by 胡正康 on 2017/4/17.
//  Copyright © 2017年 ZY_kang. All rights reserved.
//

#import "ZYLeadingPageCell.h"

@implementation ZYLeadingPageCell
-(instancetype)init{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.finishBtn];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = self.contentView.frame;
    //根据字数自动调整宽高
    [self.finishBtn sizeToFit];
    
    CGFloat margin = 10.f;
    
    CGFloat btnHeight = self.finishBtn.bounds.size.height+2*margin;
    CGFloat btnWidth  = self.finishBtn.bounds.size.width+2*margin;
    CGFloat btnX = (self.bounds.size.width - btnWidth)/2;
    //距离屏幕下方的距离为100
    CGFloat btnY = self.bounds.size.height-100.f-btnHeight;
    self.finishBtn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
    
}

-(UIButton *)finishBtn{
    if (!_finishBtn) {
        UIButton *btn = [UIButton new];
        [btn setBackgroundColor:[UIColor blueColor]];
        [btn.layer setMasksToBounds:YES];
        [btn.layer setCornerRadius:10.f];
        _finishBtn = btn;
    }
    return _finishBtn;
}
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        [_imageView setContentMode:UIViewContentModeScaleToFill];
    }
    return _imageView;
}
@end
