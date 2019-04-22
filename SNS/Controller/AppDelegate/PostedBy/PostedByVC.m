//
//  PostedByVC.m
//  SNS
//
//  Created by Apple on 27/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "PostedByVC.h"
#import "KxMenu.h"
#import "FTPopOverMenu.h"
#import "PostedBy2AVC.h"
@interface PostedByVC ()
{
    NSMutableArray *arryList;
    NSMutableArray *areasList;
    NSMutableArray *subareasList;

    NSMutableDictionary *selectedCity;
}
@end

@implementation PostedByVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    areasList=[[NSMutableArray alloc] init];
   subareasList=[[NSMutableArray alloc] init]; arryList=@[@"India",@"Swaziland",@"Africa",@"Australlia",@"Pakistan",@"Srilanka",@"Mexico",@"United Kingdom",@"United States",@"Portugal"];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)backBtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

}
- (IBAction)postedByBtnAction:(id)sender {

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
                           
                           //                           NSDictionary *LtypeDic=[leaveTypes objectAtIndex:selectedIndex];
                           //                           [self makePostCallForPage:HRLEAVEACTION withParams:@{@"employee_id":[Utils loggedInUserIdStr],@"leave_id":self->cancelStr,@"status":@"1",@"leave_type":[NSString stringWithFormat:@"%@",[LtypeDic valueForKey:@"id"]]} withRequestCode:11];
                           //
                           
                       } dismissBlock:^{
                           
                           NSLog(@"user canceled. do nothing.");
                           
                           //                           FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
                           //                           configuration.allowRoundedArrow = !configuration.allowRoundedArrow;
                           
                       }];
    
}
-(void)parseResult:(id)result withCode:(int)reqeustCode{
    if(reqeustCode==102){
        areasList =result;
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
        
            for(NSDictionary *LDic in areasList){
                [Item addObject:[LDic valueForKey:@"title"]];
            }
//        [Item addObject:@"t1"];
//        [Item addObject:@"t2"];
//        [Item addObject:@"t3"];
//        [Item addObject:@"t4"];
        
        [FTPopOverMenu showForSender:_cityTxtField
                       withMenuArray:Item
                           doneBlock:^(NSInteger selectedIndex) {
                               
                               NSLog(@"done block. do something. selectedIndex : %ld", (long)selectedIndex);
                               self->selectedCity =[self->areasList objectAtIndex:selectedIndex];
                               self->_cityTxtField.text =[self->selectedCity valueForKey:@"title"];
                               
                               //                           NSDictionary *LtypeDic=[leaveTypes objectAtIndex:selectedIndex];
                               //                           [self makePostCallForPage:HRLEAVEACTION withParams:@{@"employee_id":[Utils loggedInUserIdStr],@"leave_id":self->cancelStr,@"status":@"1",@"leave_type":[NSString stringWithFormat:@"%@",[LtypeDic valueForKey:@"id"]]} withRequestCode:11];
                               //
                               
                           } dismissBlock:^{
                               
                               NSLog(@"user canceled. do nothing.");
                               
                               //                           FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
                               //                           configuration.allowRoundedArrow = !configuration.allowRoundedArrow;
                               
                           }];
        
    }else if(reqeustCode==103){
        areasList =result;
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
        
        for(NSDictionary *LDic in areasList){
            [Item addObject:[LDic valueForKey:@"title"]];
        }
        //        [Item addObject:@"t1"];
        //        [Item addObject:@"t2"];
        //        [Item addObject:@"t3"];
        //        [Item addObject:@"t4"];
        
        [FTPopOverMenu showForSender:_cityTxtField
                       withMenuArray:Item
                           doneBlock:^(NSInteger selectedIndex) {
                               
                               NSLog(@"done block. do something. selectedIndex : %ld", (long)selectedIndex);
                              
                               //                           NSDictionary *LtypeDic=[leaveTypes objectAtIndex:selectedIndex];
                               //                           [self makePostCallForPage:HRLEAVEACTION withParams:@{@"employee_id":[Utils loggedInUserIdStr],@"leave_id":self->cancelStr,@"status":@"1",@"leave_type":[NSString stringWithFormat:@"%@",[LtypeDic valueForKey:@"id"]]} withRequestCode:11];
                               //
                               
                           } dismissBlock:^{
                               
                               NSLog(@"user canceled. do nothing.");
                               
                               //                           FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
                               //                           configuration.allowRoundedArrow = !configuration.allowRoundedArrow;
                               
                           }];
        
    }
}
- (IBAction)cityBtnAction:(id)sender {
   // if(areasList.count==0){
    [self makePostCallForPage:AREAS withParams:@{} withRequestCode:102];
//}

}

- (IBAction)locationBtnAction:(id)sender {
    if(_cityTxtField.text.length>0){
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
        NSMutableArray *locationList =[selectedCity valueForKey:@"areas"];
        subareasList=locationList;
    for(NSDictionary *LDic in locationList){
        [Item addObject:[LDic valueForKey:@"title"]];
    }
//    [Item addObject:@"t1"];
//    [Item addObject:@"t2"];
//    [Item addObject:@"t3"];
//    [Item addObject:@"t4"];

    [FTPopOverMenu showForSender:sender
                   withMenuArray:Item
                       doneBlock:^(NSInteger selectedIndex) {
                           
                           NSLog(@"done block. do something. selectedIndex : %ld", (long)selectedIndex);
                       
//                           NSDictionary *LtypeDic=[leaveTypes objectAtIndex:selectedIndex];
//                           [self makePostCallForPage:HRLEAVEACTION withParams:@{@"employee_id":[Utils loggedInUserIdStr],@"leave_id":self->cancelStr,@"status":@"1",@"leave_type":[NSString stringWithFormat:@"%@",[LtypeDic valueForKey:@"id"]]} withRequestCode:11];
//
                           _locationTxtField.text=[[subareasList objectAtIndex:selectedIndex] valueForKey:@"title"];
                           
                       } dismissBlock:^{
                           
                           NSLog(@"user canceled. do nothing.");
                           
                           //                           FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
                           //                           configuration.allowRoundedArrow = !configuration.allowRoundedArrow;
                           
                       }];
    }else{
        [self showErrorAlertWithMessage:@"Please Select City"];
    }
    
}

- (IBAction)nextBtnAction:(id)sender {
            PostedBy2AVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"PostedBy2AVC"];
            [self.navigationController pushViewController:vc animated:YES];
}
@end
