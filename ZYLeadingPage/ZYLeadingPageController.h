//
//  ZYLeadingPageController.h
//  ZYLeadingPage
//
//  Created by 胡正康 on 2017/4/17.
//  Copyright © 2017年 ZY_kang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLeadingPageCell.h"
typedef void (^ZYLeadingPageSetupCellHandler)(ZYLeadingPageCell *cell,NSIndexPath * indexPath);
typedef void (^ZYLeadingPageFinishHandler)(UIButton *finishBtn);

@interface ZYLeadingPageController : UIViewController
@property (nonatomic)UICollectionView *collectionView;
@property (nonatomic)UIPageControl    *pageControl;
@property (nonatomic)NSInteger           count;

-(instancetype)initWithPageCount:(NSInteger)count setUpCellHander:(ZYLeadingPageSetupCellHandler)setupCellHandler finishHandler:(ZYLeadingPageFinishHandler)finishHander;
@end
