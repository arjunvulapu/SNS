//
//  SIgnUpViewController.h
//  SNS
//
//  Created by Apple on 04/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "PECropViewController.h"
#import "Common.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "Utils.h"
NS_ASSUME_NONNULL_BEGIN

@interface SIgnUpViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIImageView *user_image;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *firstNameTxtFiled;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *lastNameTxtfield;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *emailTxtField;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *phoneTxtField;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *passwordTxtField;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *conformPasswordTxtField;
@property (weak, nonatomic) IBOutlet UIButton *signupBtn;
- (IBAction)signupBtnAction:(id)sender;
- (IBAction)backBtnAction:(id)sender;
- (IBAction)imageAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIImagePickerController *userPicker;

@end

NS_ASSUME_NONNULL_END
