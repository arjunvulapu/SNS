//
//  RentVC.m
//  SNS
//
//  Created by Apple on 26/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "RentVC.h"
#import "RentCatCollectionViewCell.h"
#import "RentItemCollectionViewCell.h"
#import "PostedByVC.h"
@interface RentVC ()
{
    NSMutableDictionary *CatInfo;
    NSInteger selectedCat;
}
@end

@implementation RentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _saleArrowImage.hidden=YES;
    _rentArrowImage.hidden=YES;
    _detailView.hidden=YES;
    [self makePostCallForPage:CATEGORIES withParams:@{} withRequestCode:101];

}
-(void)parseResult:(id)result withCode:(int)reqeustCode{
    if(reqeustCode==101){
        selectedCat=0;
                CatInfo = result;
        [_topCollectionView reloadData];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backBtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
     if(collectionView==_topCollectionView){
         if(!_saleArrowImage.isHidden){
             NSMutableArray *list = [CatInfo valueForKey:@"Sell"];
             return  list.count;
         }else
             {
                 NSMutableArray *list = [CatInfo valueForKey:@"Rent"];
                 return  list.count;
             }
    
     }else{
         if(!_saleArrowImage.isHidden){
             NSMutableArray *list = [CatInfo valueForKey:@"Sell"];
             NSMutableArray *innerlist = [[list objectAtIndex:selectedCat] valueForKey:@"categories"];
             return  innerlist.count;
         }else
         {
             NSMutableArray *list = [CatInfo valueForKey:@"Rent"];
             NSMutableArray *innerlist = [[list objectAtIndex:selectedCat] valueForKey:@"categories"];
             return  innerlist.count;
             
         }
         
     }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(collectionView==_topCollectionView){
    RentCatCollectionViewCell *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RentCatCollectionViewCell" forIndexPath:indexPath];
        NSMutableArray *list = _saleArrowImage.isHidden?[CatInfo valueForKey:@"Rent"]:[CatInfo valueForKey:@"Sell"];
        NSMutableDictionary *catList =[list objectAtIndex:indexPath.row];
        ccell.cat_title.text=[NSString stringWithFormat:@"%@",[catList valueForKey:@"title"]];
        if(selectedCat==indexPath.row){
            ccell.backgroundColor=[UIColor redColor];
        }else{
            ccell.backgroundColor=[UIColor colorWithRed:245/255.0f green:170/255.0f blue:58/255.0f alpha:1];

        }
        
    return ccell;
    }else{
        RentItemCollectionViewCell *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RentItemCollectionViewCell" forIndexPath:indexPath];
        ccell.bgView.layer.cornerRadius=ccell.bgView.frame.size.width/2;
        ccell.bgView.clipsToBounds=YES;
        NSMutableArray *list = _saleArrowImage.isHidden?[CatInfo valueForKey:@"Rent"]:[CatInfo valueForKey:@"Sell"];
        NSMutableArray *innerlist = [[list objectAtIndex:selectedCat] valueForKey:@"categories"];
        if(innerlist.count!=0){
        NSMutableDictionary *catList =[innerlist objectAtIndex:indexPath.row];
        ccell.cat_title.text=[NSString stringWithFormat:@"%@",[catList valueForKey:@"title"]];
        }

        
        return ccell;
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 20, 10, 20);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
     if(collectionView==_topCollectionView){
    return CGSizeMake(collectionView.frame.size.width/2.5, collectionView.frame.size.height);
     }else{
         return CGSizeMake(collectionView.frame.size.width/4, collectionView.frame.size.width/4);

     }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    if(collectionView==_topCollectionView){
        selectedCat = indexPath.row;
        [_topCollectionView reloadData];
        [_listCollectionView reloadData];
    }else{
        PostedByVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"PostedByVC"];
        [self.navigationController pushViewController:vc animated:YES];

    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(10, 2.0, 10, 2.0);
//}
- (IBAction)saleBtnAction:(id)sender {
    _rentArrowImage.hidden=YES;
    _saleArrowImage.hidden=NO;
    _detailView.hidden=NO;
    _saleBgView.backgroundColor=[UIColor redColor];
    _sellLbl.textColor=[UIColor whiteColor];
    _rentBgView.backgroundColor=[UIColor whiteColor];
    _rentLbl.textColor=[UIColor blackColor];
    selectedCat =0;

    [_topCollectionView reloadData];
    [_listCollectionView reloadData];
    
}
- (IBAction)rentBtnAction:(id)sender {
    _rentArrowImage.hidden=NO;
    _saleArrowImage.hidden=YES;
    _detailView.hidden=NO;
    _rentBgView.backgroundColor=[UIColor redColor];
    _rentLbl.textColor=[UIColor whiteColor];
    _saleBgView.backgroundColor=[UIColor whiteColor];
    _sellLbl.textColor=[UIColor blackColor];
    selectedCat =0;

    [_topCollectionView reloadData];
    [_listCollectionView reloadData];

}
@end
