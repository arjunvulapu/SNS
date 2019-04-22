//
//  PropertyGalleryVC.h
//  SNS
//
//  Created by Apple on 27/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface PropertyGalleryVC : BaseViewController
@property (weak, nonatomic) IBOutlet UICollectionView *galleryCollectionView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
- (IBAction)backBtnAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
