//
//  RSNewFeatureController.m
//  私人定制-微博
//
//  Created by imac on 15/10/15.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSNewFeatureController.h"
#import "RSNewFeatureCell.h"

@interface RSNewFeatureController ()

@property (nonatomic,weak) UIPageControl *pageControl;

@end

@implementation RSNewFeatureController

static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize =[UIScreen mainScreen].bounds.size ;
    
    layout.minimumLineSpacing = 0;
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    //设置collectionView属性
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;

    // Register cell classes
    [self.collectionView registerClass:[RSNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self _configurePageControl];
    
   }

- (void)_configurePageControl{
    
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.numberOfPages = 4;
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    pageControl.center = CGPointMake(self.view.width * 0.5, self.view.height-10);
    _pageControl = pageControl;
    
    [self.view addSubview:pageControl];
    
}


#pragma mark - UIScrollView代理

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int page = scrollView.contentOffset.x/self.view.width +0.5;
    
    _pageControl.currentPage = page;
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
   
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RSNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%ld",indexPath.row+1]];
    
    
    cell.image = image;
    [cell cellWithIndexpath:indexPath count:4];
    

    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
