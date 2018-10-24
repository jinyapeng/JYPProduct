//
//  HomeManageTableViewCell.m
//  JYPProduct
//
//  Created by apple on 2018/6/7.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "HomeManageTableViewCell.h"
#import "HomeManageCollectionCell.h"


@interface HomeManageTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSMutableArray *titleArray;

@end

@implementation HomeManageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.titleArray = [NSMutableArray arrayWithObjects:@"整租",@"合租",@"集中整租",@"审批",@"考勤",@"日志",@"微信管理",@"更多", nil];
    
    _collectionView.dataSource = self;
    _collectionView.delegate   = self;
    _collectionView.pagingEnabled = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"HomeManageCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"HomeManageCollectionCell"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark -
#pragma mark  colleoction datasource/delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeManageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeManageCollectionCell" forIndexPath:indexPath];
    NSString *title = self.titleArray[indexPath.row];
    NSString *imageName = [NSString stringWithFormat:@"Home_Menu%ld",indexPath.row+1];
    cell.image.image = UIImageNamed(imageName);
    cell.titleLab.text = title;
    
    return cell;
}


#pragma mark - flowlayout
/**
 *  代理方法计算每一个item的大小
 */
//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(KWIDTH/4, HOME_CELLITEM_HEIGHT);
}


//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 3;
}

//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
}

//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *title = self.titleArray[indexPath.row];
    
    if ([title isEqualToString:@"整租"]) {
        [self.viewController.navigationController pushViewControllerStringMu:NameToString(RegistHousingVController) animated:YES parameters:nil];
    }else if ([title isEqualToString:@"合租"]){
        [self.viewController.navigationController pushViewControllerStringMu:NameToString(HUDManagerViewController) animated:YES parameters:nil];
    }else if ([title isEqualToString:@"集中整租"]){
        [self.viewController.navigationController pushViewControllerStringMu:NameToString(DemoViewController2) animated:YES parameters:nil];
    }else if ([title isEqualToString:@"审批"]){
        [self.viewController.navigationController pushViewControllerStringMu:NameToString(ManualModeViewController) animated:YES parameters:nil];
    }else if ([title isEqualToString:@"考勤"]){
        [self.viewController.navigationController pushViewControllerStringMu:NameToString(FocusHousingListController) animated:YES parameters:^(NSMutableDictionary *dict) {
            
        }];
    }else if ([title isEqualToString:@"日志"]){
        [self.viewController.navigationController pushViewControllerStringMu:NameToString(AMapViewController) animated:YES parameters:^(NSMutableDictionary *dict) {
            
        }];
    }else if ([title isEqualToString:@"微信管理"]){
        [self.viewController.navigationController pushViewControllerStringMu:NameToString(ChartsViewController) animated:YES parameters:^(NSMutableDictionary *dict) {
            
        }];
    }
        
    
}


@end
