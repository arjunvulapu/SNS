//
//  RecommendedSearchVC.m
//  SNS
//
//  Created by Apple on 11/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "RecommendedSearchVC.h"
#import "RecommendedSearchCollectionViewCell.h"
#import "RecommendedSearch2VC.h"

@interface RecommendedSearchVC ()
{
    NSMutableArray *areasList;
    NSMutableDictionary *selectedDict;
}
@end

@implementation RecommendedSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    areasList=[[NSMutableArray alloc] init];
    [self makePostCallForPage:AREAS withParams:@{} withRequestCode:104];

}
-(void)parseResult:(id)result withCode:(int)reqeustCode{
    if(reqeustCode==104){
        areasList=result;
        [_searchCollectionView reloadData];
    }
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   
        return areasList.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

        RecommendedSearchCollectionViewCell *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RecommendedSearchCollectionViewCell" forIndexPath:indexPath];
    NSMutableDictionary *aDic=[areasList objectAtIndex:indexPath.row];
    ccell.areaname.text=[NSString stringWithFormat:@"%@",[aDic valueForKey:@"title"]];
    [ccell.bgImage setImageWithURL:[aDic valueForKey:@"image"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    ccell.bgImage.layer.cornerRadius=10;
    ccell.bgImage.clipsToBounds=YES;
    ccell.areaname.textColor =[UIColor blackColor];
    if([selectedDict valueForKey:@"id"]){
    if([aDic valueForKey:@"id"]==[selectedDict valueForKey:@"id"]){
        ccell.selectedImage.image=[UIImage imageNamed:@"radioon"];

    }else{
        ccell.selectedImage.image=[UIImage imageNamed:@"radiooff"];
    }
    }else{
        ccell.selectedImage.image=[UIImage imageNamed:@"radiooff"];
    }
    ccell.selectedCity = ^{
        self->selectedDict=[self->areasList objectAtIndex:indexPath.row];
        [self->_searchCollectionView reloadData];
    };
        return ccell;
    
}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(10, 20, 10, 20);
//}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
        return CGSizeMake(collectionView.frame.size.width/3-7, collectionView.frame.size.width/3);
        
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
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
- (IBAction)nextBtnAction:(id)sender {
    RecommendedSearch2VC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"RecommendedSearch2VC"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
