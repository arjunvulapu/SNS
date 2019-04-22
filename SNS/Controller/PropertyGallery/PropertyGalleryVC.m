//
//  PropertyGalleryVC.m
//  SNS
//
//  Created by Apple on 27/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "PropertyGalleryVC.h"
#import "PGCollectionViewCell.h"
@interface PropertyGalleryVC ()

@end

@implementation PropertyGalleryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _galleryCollectionView.delegate=self;
    _galleryCollectionView.dataSource=self;

}
-(void)viewDidAppear:(BOOL)animated{
    [_bottomView setBackgroundColor:[UIColor clearColor]];
    CAGradientLayer *grad = [CAGradientLayer layer];
    grad.frame = _bottomView.bounds;
    
    grad.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor] CGColor], (id)[[UIColor blackColor] CGColor], nil];
    
    [_bottomView.layer insertSublayer:grad atIndex:0];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   
        return 12;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

        PGCollectionViewCell *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PGCollectionViewCell" forIndexPath:indexPath];
        //ccell.bgView.layer.cornerRadius=ccell.bgView.frame.size.height/2;
        //ccell.bgView.clipsToBounds=YES;
    if(indexPath.row%4==0)
    ccell.boxImageView.image =[UIImage imageNamed:@"box1"];
    else if(indexPath.row%4==1)
        ccell.boxImageView.image =[UIImage imageNamed:@"box2"];
    else if(indexPath.row%4==2)
        ccell.boxImageView.image =[UIImage imageNamed:@"box3"];
    else if(indexPath.row%4==3)
        ccell.boxImageView.image =[UIImage imageNamed:@"box4"];
    
        return ccell;
    
    
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
        return CGSizeMake(collectionView.frame.size.width/2-20, 270);
        
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
   
//        PostedByVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"PostedByVC"];
//        [self.navigationController pushViewController:vc animated:YES];
//        
    
}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 10.0;
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 10.0;
//}

- (IBAction)backBtnAction:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];
}
@end
