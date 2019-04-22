//
//  PostedBy2AVC.m
//  SNS
//
//  Created by Apple on 03/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "PostedBy2AVC.h"
@interface PostedBy2AVC ()

@end

@implementation PostedBy2AVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.totalAreaView.delegate = self;
    self.totalAreaView.minValue = 0;
    self.totalAreaView.maxValue = 10000;
     self.totalAreaView.from = @"speed";
    self.totalAreaView.selectedMinimum = [_areamin intValue]?[_areamin intValue]:0;
    self.totalAreaView.selectedMaximum = [_areamax intValue]?[_areamax intValue]:0;
    self.totalAreaView.handleImage = [UIImage imageNamed:@"fill_car_seek"];
    self.totalAreaView.selectedHandleDiameterMultiplier = 1;
    self.totalAreaView.tintColorBetweenHandles = THEME_COLOR;
    self.totalAreaView.tintColor = [UIColor  grayColor];
    self.totalAreaView.handleColor  = [UIColor  clearColor];
    
    self.totalAreaView.handleBorderWidth = 0;
    //self.customSlider.handleBorderColor = THEME_COLOR;
    NSNumberFormatter *customFormatter = [[NSNumberFormatter alloc] init];
    customFormatter.positiveSuffix = @"Sq.ft";
    self.totalAreaView.numberFormatterOverride = customFormatter;
    self.totalAreaView.lineHeight = 10;
    
}
-(void)rangeSlider:(TTRangeSlider *)sender didChangeSelectedMinimumValue:(float)selectedMinimum andMaximumValue:(float)selectedMaximum{
        _areamin=[NSString stringWithFormat:@"%f",selectedMinimum];
        _areamax=[NSString stringWithFormat:@"%f",selectedMaximum];
        NSLog(@"Currency slider updated. Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
    
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(collectionView==_genderCollectionView){
    _genderCollectionViewHeight.constant=_genderCollectionView.contentSize.height;
    }else if(collectionView==_bathroomsCollectionView){
        _bathroomsCollectionViewHeight.constant=_bathroomsCollectionView.contentSize.height;
    }else if(collectionView==_bikeParkingCollectionView){
    _bikeParkingCollectionViewHeight.constant=_bikeParkingCollectionView.contentSize.height;
    }else if(collectionView==_furnishedCollectionView){
        _furnishedCollectionViewHeight.constant=_furnishedCollectionView.contentSize.height;
    }else if(collectionView==_securitydepositCollectionView){
_securitydepositCollectionViewHeight.constant=_securitydepositCollectionView.contentSize.height;
    }
    UICollectionViewCell *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cvcell" forIndexPath:indexPath];
    return ccell;
}
- (IBAction)backBtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
