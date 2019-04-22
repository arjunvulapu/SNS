//
//  PostedByVC.h
//  SNS
//
//  Created by Apple on 27/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface PostedByVC : BaseViewController
- (IBAction)backBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *propertyTitleTxtField;
@property (weak, nonatomic) IBOutlet UITextField *propertyByTxtField;
@property (weak, nonatomic) IBOutlet UITextField *nameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *contactNumberTxtField;
@property (weak, nonatomic) IBOutlet UITextField *cityTxtField;
@property (weak, nonatomic) IBOutlet UITextField *locationTxtField;
@property (weak, nonatomic) IBOutlet UITextField *landmarkTxtField;
- (IBAction)postedByBtnAction:(id)sender;
- (IBAction)cityBtnAction:(id)sender;
- (IBAction)locationBtnAction:(id)sender;
- (IBAction)nextBtnAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
