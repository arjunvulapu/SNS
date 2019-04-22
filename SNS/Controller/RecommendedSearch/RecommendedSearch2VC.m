//
//  RecommendedSearch2VC.m
//  SNS
//
//  Created by Apple on 12/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "RecommendedSearch2VC.h"

@interface RecommendedSearch2VC ()

@end

@implementation RecommendedSearch2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
@end
