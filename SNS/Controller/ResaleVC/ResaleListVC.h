//
//  ResaleListVC.h
//  SNS
//
//  Created by Apple on 01/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResaleListVC : UIViewController
- (IBAction)backBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *appartmentTableView;
@property (weak, nonatomic) IBOutlet UILabel *backgroundLbl;
@property (strong, nonatomic) IBOutlet UIView *sortView;
- (IBAction)sortCloseAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *sortTableView;
- (IBAction)mainSortBtnAction:(id)sender;
- (IBAction)sortBtnAction:(id)sender;
- (IBAction)btn1Action:(id)sender;
- (IBAction)btn2Action:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@end

NS_ASSUME_NONNULL_END
