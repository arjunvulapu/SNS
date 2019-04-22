//
//  ResaleListVC.m
//  SNS
//
//  Created by Apple on 01/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "ResaleListVC.h"
#import "ResalelistTableViewCell.h"
#import "PropertyDetailVC.h"
#import "SortByTableViewCell.h"
#import "FTPopOverMenu.h"

@interface ResaleListVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ResaleListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _backgroundLbl.layer.cornerRadius=5;
    _backgroundLbl.clipsToBounds=YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView==_sortTableView){
        return 6;
    }
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if(tableView==_sortTableView){
        return 44;
    }
    return 110;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_sortTableView){
        static NSString *MyIdentifier = @"SortByTableViewCell";
        
        SortByTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if(indexPath.row==0){
                [cell.selectedImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",@"radioon"]]];
        }else{
            [cell.selectedImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",@"radiooff"]]];

        }
//                cell.menuTitle.text = [NSString stringWithFormat:@"%@",[menuList objectAtIndex:indexPath.row]];
        return cell;
        
    }else{
        static NSString *MyIdentifier = @"ResalelistTableViewCell";
        
        ResalelistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        //        [cell.menuImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[menuImagesList objectAtIndex:indexPath.row]]]];
        //        cell.menuTitle.text = [NSString stringWithFormat:@"%@",[menuList objectAtIndex:indexPath.row]];
        return cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if(tableView==_sortTableView){
    }else{
    PropertyDetailVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"PropertyDetailVC"];
    [self.navigationController pushViewController:vc animated:YES];
    }
}
- (IBAction)backBtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)sortCloseAction:(id)sender {
//    BOOL doesContain = [self.view.subviews containsObject:_sortView];
//
//    if(doesContain){
//        [_sortView removeFromSuperview];
//    }
    [_sortView removeFromSuperview];
}
- (IBAction)mainSortBtnAction:(id)sender {
    _sortView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView transitionWithView:_sortView duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^(void){
        [self.view addSubview: self->_sortView];
    } completion:nil];
    _sortView.center=self.view.center;
}

- (IBAction)sortBtnAction:(id)sender {
}

- (IBAction)btn1Action:(id)sender {
    //    NSMutableArray *statusList=[NSMutableArray arrayWithObjects:@"Casual Leave",@"LOP",@"Sick Leave", nil];
    FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
    configuration.menuRowHeight = 40;
    configuration.menuWidth = self.view.frame.size.width-20;
    configuration.textColor = [UIColor blackColor];
    configuration.textFont = [UIFont boldSystemFontOfSize:14];
    configuration.tintColor = [UIColor whiteColor];
    configuration.borderColor = [UIColor lightGrayColor];
    configuration.borderWidth = 0.5;
    configuration.textAlignment = UITextAlignmentCenter;
    NSMutableArray *Item=[[NSMutableArray alloc] init];
    
    //    for(NSDictionary *LDic in leaveTypes){
    //        [Item addObject:[LDic valueForKey:@"title"]];
    //    }
    [Item addObject:@"t1"];
    [Item addObject:@"t2"];
    [Item addObject:@"t3"];
    [Item addObject:@"t4"];
    
    [FTPopOverMenu showForSender:sender
                   withMenuArray:Item
                       doneBlock:^(NSInteger selectedIndex) {
                           
                           NSLog(@"done block. do something. selectedIndex : %ld", (long)selectedIndex);
                           self->_label1.text=[Item objectAtIndex:selectedIndex];
                           
                           //                           NSDictionary *LtypeDic=[leaveTypes objectAtIndex:selectedIndex];
                           //                           [self makePostCallForPage:HRLEAVEACTION withParams:@{@"employee_id":[Utils loggedInUserIdStr],@"leave_id":self->cancelStr,@"status":@"1",@"leave_type":[NSString stringWithFormat:@"%@",[LtypeDic valueForKey:@"id"]]} withRequestCode:11];
                           //
                           
                       } dismissBlock:^{
                           
                           NSLog(@"user canceled. do nothing.");
                           
                           //                           FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
                           //                           configuration.allowRoundedArrow = !configuration.allowRoundedArrow;
                           
                       }];
    
}

- (IBAction)btn2Action:(id)sender {
    //    NSMutableArray *statusList=[NSMutableArray arrayWithObjects:@"Casual Leave",@"LOP",@"Sick Leave", nil];
    FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
    configuration.menuRowHeight = 40;
    configuration.menuWidth = self.view.frame.size.width-20;
    configuration.textColor = [UIColor blackColor];
    configuration.textFont = [UIFont boldSystemFontOfSize:14];
    configuration.tintColor = [UIColor whiteColor];
    configuration.borderColor = [UIColor lightGrayColor];
    configuration.borderWidth = 0.5;
    configuration.textAlignment = UITextAlignmentCenter;
    NSMutableArray *Item=[[NSMutableArray alloc] init];
    
    //    for(NSDictionary *LDic in leaveTypes){
    //        [Item addObject:[LDic valueForKey:@"title"]];
    //    }
    [Item addObject:@"t1"];
    [Item addObject:@"t2"];
    [Item addObject:@"t3"];
    [Item addObject:@"t4"];
    
    [FTPopOverMenu showForSender:sender
                   withMenuArray:Item
                       doneBlock:^(NSInteger selectedIndex) {
                           
                           NSLog(@"done block. do something. selectedIndex : %ld", (long)selectedIndex);
                           self->_label2.text=[Item objectAtIndex:selectedIndex];

                           //                           NSDictionary *LtypeDic=[leaveTypes objectAtIndex:selectedIndex];
                           //                           [self makePostCallForPage:HRLEAVEACTION withParams:@{@"employee_id":[Utils loggedInUserIdStr],@"leave_id":self->cancelStr,@"status":@"1",@"leave_type":[NSString stringWithFormat:@"%@",[LtypeDic valueForKey:@"id"]]} withRequestCode:11];
                           //
                           
                       } dismissBlock:^{
                           
                           NSLog(@"user canceled. do nothing.");
                           
                           //                           FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
                           //                           configuration.allowRoundedArrow = !configuration.allowRoundedArrow;
                           
                       }];
    
}
@end
