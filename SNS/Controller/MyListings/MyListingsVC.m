//
//  MyListingsVC.m
//  SNS
//
//  Created by Apple on 24/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "MyListingsVC.h"
#import "ListingsTC.h"
@interface MyListingsVC ()

@end

@implementation MyListingsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *MyIdentifier = @"ListingsTC";
        
        ListingsTC *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        //        [cell.menuImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[menuImagesList objectAtIndex:indexPath.row]]]];
        //        cell.menuTitle.text = [NSString stringWithFormat:@"%@",[menuList objectAtIndex:indexPath.row]];
        return cell;
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return self.view.frame.size.width/2;
//}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    HomeMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeMenu2TableViewCell"];
//    cell.backgroundColor=[UIColor cyanColor];
//    if(menuOrNot){
//        cell.menuTitle.text=@"Menu";
//    }else{
//        cell.menuTitle.text=@"User";
//
//    }
//    cell.menuTitle.textColor=THEME_COLOR;
//
//    return cell;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
//{
//    return 50;
//}

- (IBAction)backBtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
