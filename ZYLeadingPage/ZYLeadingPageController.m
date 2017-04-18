//
//  ZYLeadingPageController.m
//  ZYLeadingPage
//
//  Created by 胡正康 on 2017/4/17.
//  Copyright © 2017年 ZY_kang. All rights reserved.
//

#import "ZYLeadingPageController.h"

@interface ZYLeadingPageController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic)ZYLeadingPageSetupCellHandler setupCellHandler;
@property (nonatomic)ZYLeadingPageFinishHandler      finishHandler;

@end

static NSString *const hZYLeadingPageCellID = @"hZYLeadingPageCellID";
@implementation ZYLeadingPageController
#pragma mark - 初始化
-(instancetype)initWithPageCount:(NSInteger)count setUpCellHander:(ZYLeadingPageSetupCellHandler)setupCellHandler finishHandler:(ZYLeadingPageFinishHandler)finishHander{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _count = count;
        _setupCellHandler = setupCellHandler;
        _finishHandler = finishHander;
        
        //添加CollectionView -- 使用懒加载初始化
        [self.view addSubview:self.collectionView];
        //添加pageControl -- 使用懒加载初始化
        [self.view addSubview:self.pageControl];
        //注册cell
        [self.collectionView registerClass:[ZYLeadingPageCell class] forCellWithReuseIdentifier:hZYLeadingPageCellID];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZYLeadingPageCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:hZYLeadingPageCellID forIndexPath:indexPath];
    if (indexPath.row != self.count-1) {
        cell.finishBtn.hidden =YES;
    }
    else{
        //最后一页 显示按钮 添加响应方法
        cell.finishBtn.hidden = NO;
        [cell.finishBtn addTarget:self action:@selector(clickFinishBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    //设置数据
    if (self.setupCellHandler) {
        self.setupCellHandler(cell,indexPath);
    }
    return cell;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //向下取整
    NSInteger currentPage = scrollView.contentOffset.x/scrollView.bounds.size.width+0.5;
    if (self.pageControl.currentPage != currentPage) {
        self.pageControl.currentPage = currentPage;
    }
}
#pragma mark --- 完成按钮
-(void)clickFinishBtn:(UIButton *)btn{
    if (self.finishHandler) {
        self.finishHandler(btn);
    }
}
#pragma mark --- getter
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = self.view.bounds.size;
        layout.minimumLineSpacing = 0.f;
        layout.minimumInteritemSpacing = 0.f;
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        collectionView.pagingEnabled = YES;
        collectionView.bounces = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        _collectionView = collectionView;
        
    }
    return _collectionView;
}
-(UIPageControl *)pageControl{
    if (!_pageControl) {
        UIPageControl * pageControl = [[UIPageControl alloc]init];
        pageControl.numberOfPages =self.count;
        pageControl.currentPage = 0;
        //根据count个数来定义size
        CGSize pageControlSize = [pageControl sizeForNumberOfPages:self.count];
        CGFloat pageControl_X = (self.view.bounds.size.width - pageControlSize.width)/2;
        CGFloat pageControl_Y = self.view.bounds.size.height - pageControlSize.height-30.f;
        pageControl.frame = CGRectMake(pageControl_X, pageControl_Y, pageControlSize.width, pageControlSize.height);
        _pageControl = pageControl;
    }
    return _pageControl;
}
@end
