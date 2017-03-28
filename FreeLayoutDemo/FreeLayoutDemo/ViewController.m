//
//  ViewController.m
//  FreeLayoutDemo
//
//  Created by poplar on 2017/3/28.
//  Copyright © 2017年 poplar. All rights reserved.
//

#import "ViewController.h"
#import "UICollectionViewFreeScrollLayout.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewFreeScrollLayoutDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"test"];
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 1000;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"test" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"aa"]];
    return cell;
}


#pragma mark -- UICollectionViewFreeScrollLayoutDataSource
- (NSInteger)columnNumberOfCollectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout{

    return 50;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(50, 50);
}

#pragma mark -- UICollectionViewDelegate


@end
