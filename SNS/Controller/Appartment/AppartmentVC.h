//
//  AppartmentVC.h
//  SNS
//
//  Created by Apple on 28/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface AppartmentVC : BaseViewController
- (IBAction)backBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *appartmentTableView;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@end

NS_ASSUME_NONNULL_END
