//
//  ResaleVC.h
//  SNS
//
//  Created by Apple on 01/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface ResaleVC : BaseViewController
- (IBAction)backBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *resaleView;
@property (weak, nonatomic) IBOutlet UIView *commercialsView;
@property (weak, nonatomic) IBOutlet UIView *freshProjectsView;
- (IBAction)freshProjectsBtnAction:(id)sender;
- (IBAction)saleBtnAction:(id)sender;
- (IBAction)commericalBtnAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
