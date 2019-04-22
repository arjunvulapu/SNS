//
//  HOMEVC.h
//  SNS
//
//  Created by Apple on 26/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <JVFloatLabeledTextField/JVFloatLabeledTextField.h>
@import GoogleSignIn;
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HOMEVC : BaseViewController
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeight;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIScrollView *loginView;
@property (weak, nonatomic) IBOutlet UIImageView *menuImage;
@property (weak, nonatomic) IBOutlet UILabel *menuLbl;
@property (weak, nonatomic) IBOutlet UILabel *userLbl;
@property (weak, nonatomic) IBOutlet UIButton *signupBtn;
@property (weak, nonatomic) IBOutlet UIButton *privacyBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgotPasswordBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic)  FBSDKLoginButton *fLoginBtn;

@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *passwordTxtField;
- (IBAction)signupBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *emailTxtField;
- (IBAction)forgotBtnAction:(id)sender;
- (IBAction)privacyBtnAction:(id)sender;
- (IBAction)loginbtnAction:(id)sender;
- (IBAction)buyBtnAction:(id)sender;
- (IBAction)lookingbtnAction:(id)sender;
- (IBAction)postBtnAction:(id)sender;
- (IBAction)menuBtnAction:(id)sender;
- (IBAction)userBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *googleBtn;

- (IBAction)googleBtnAction:(id)sender;
- (IBAction)facebookBtnAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
