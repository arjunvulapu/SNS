//
//  MyProfileVC.h
//  SNS
//
//  Created by Apple on 24/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyProfileVC : BaseViewController
- (IBAction)backBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)saveBtnAction:(id)sender;
@end

NS_ASSUME_NONNULL_END
