//
//  FreeScrollLayout.h
//  sweeper
//
//  Created by poplar on 17/3/23.
//  Copyright © 2017年 poplar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UICollectionViewFreeScrollLayoutDataSource <NSObject>

@required
//item的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

//collectionView 显示的列数
- (NSInteger)columnNumberOfCollectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout;

@end

@interface UICollectionViewFreeScrollLayout : UICollectionViewLayout

@property (nonatomic, assign) id<UICollectionViewFreeScrollLayoutDataSource> dataSource;

/**
 列与列之间的空隙
 */
@property (nonatomic, assign) IBInspectable NSInteger columnSpace;

/**
 行间距
 */
@property (nonatomic, assign) IBInspectable NSInteger interSpace;


@end
