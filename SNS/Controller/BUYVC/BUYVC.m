//
//  BUYVC.m
//  SNS
//
//  Created by Apple on 27/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "BUYVC.h"
#import "PropertyGalleryVC.h"
#import "AppartmentVC.h"
#import "ResaleListVC.h"
@interface BUYVC ()

@end

@implementation BUYVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _freshProjectsView.layer.cornerRadius=5;
    _freshProjectsView.clipsToBounds=YES;
    _commercialsView.layer.cornerRadius=5;
    _commercialsView.clipsToBounds=YES;
    _resaleView.layer.cornerRadius=5;
    _resaleView.clipsToBounds=YES;
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
- (IBAction)freshProjectsBtnAction:(id)sender {
    PropertyGalleryVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"PropertyGalleryVC"];
        [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)saleBtnAction:(id)sender {
    AppartmentVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"AppartmentVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)commericalBtnAction:(id)sender {
    ResaleListVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ResaleListVC"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
