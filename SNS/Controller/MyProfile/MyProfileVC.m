//
//  MyProfileVC.m
//  SNS
//
//  Created by Apple on 24/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "MyProfileVC.h"

@interface MyProfileVC ()

@end

@implementation MyProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _userImage.layer.cornerRadius=_userImage.frame.size.width/2;
    _userImage.clipsToBounds=YES;
    
    _backGroundImage.layer.cornerRadius=10;
    _backGroundImage.clipsToBounds=YES;
    
    _idLabel.layer.cornerRadius=10;
    _idLabel.clipsToBounds=YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backBtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)saveBtnAction:(id)sender {
}
@end
