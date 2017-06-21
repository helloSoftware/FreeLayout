//
//  FreeScrollLayout.m
//  sweeper
//
//  Created by poplar on 17/3/23.
//  Copyright © 2017年 poplar. All rights reserved.
//

#import "UICollectionViewFreeScrollLayout.h"

@interface UICollectionViewFreeScrollLayout ()
{
    NSMutableArray *_itemAttributesArray;
}
@end

IB_DESIGNABLE

@implementation UICollectionViewFreeScrollLayout

- (instancetype)init{

    if (self = [super init]) {
    }
    return self;
}

- (void)awakeFromNib{

    [super awakeFromNib];
}

/**
 * 当collectionView的显示范围发生改变的时候，是否需要重新刷新布局
 * 一旦重新刷新布局，就会重新调用下面的方法：
 1.prepareLayout
 2.layoutAttributesForElementsInRect:方法
  */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

/**
 * 用来做布局的初始化操作（不建议在init方法中进行布局的初始化操作）
 */
- (void)prepareLayout{

    [super prepareLayout];

    _dataSource = (id<UICollectionViewFreeScrollLayoutDataSource>)self.collectionView.dataSource;
    _itemAttributesArray = [NSMutableArray array];
    
    [self scrollFreeLayout];
}

- (void)scrollFreeLayout{

    //列
    NSInteger column = [_dataSource columnNumberOfCollectionView:self.collectionView layout:self];
    //行
    NSInteger row = [self.collectionView numberOfItemsInSection:0] / column;
    
    for (NSInteger i = 0; i < row; i++) {
        for (NSInteger j = 0; j < column; j++) {

            NSInteger index = i * column + j;
            
            CGSize itemSize = [_dataSource collectionView:self.collectionView layout:self sizeForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
            
            CGFloat width = itemSize.width;
            CGFloat height = itemSize.height;
            
            //保存的是item的属性
            UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
            
            attr.frame = CGRectMake(j * (self.columnSpace + width), i * (self.interSpace + height), width, height);
            [_itemAttributesArray addObject:attr];
        }
    }
}

- (CGSize)collectionViewContentSize{
    //列
    NSInteger column = [_dataSource columnNumberOfCollectionView:self.collectionView layout:self];
    
    CGSize itemSize = [_dataSource collectionView:self.collectionView layout:self sizeForItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    NSInteger row = [self.collectionView numberOfItemsInSection:0] / column;

    CGFloat width = column * itemSize.width;
    CGFloat height = row * itemSize.height;
    return CGSizeMake(width, height);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{

    return _itemAttributesArray;
}

@end
