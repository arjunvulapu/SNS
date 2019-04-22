//
//  RecommendedSearchVC.h
//  SNS
//
//  Created by Apple on 11/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecommendedSearchVC : BaseViewController
- (IBAction)backBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *contentTxtView;
- (IBAction)nextBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UICollectionView *searchCollectionView;

@end

NS_ASSUME_NONNULL_END
