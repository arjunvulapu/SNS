//
//  AppartmentVC.m
//  SNS
//
//  Created by Apple on 28/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "AppartmentVC.h"
#import "AppartmentTableViewCell.h"
@interface AppartmentVC ()

@end

@implementation AppartmentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
-(void)viewDidAppear:(BOOL)animated{
    [_backgroundView setBackgroundColor:[UIColor clearColor]];
    CAGradientLayer *grad = [CAGradientLayer layer];
    grad.frame = _backgroundView.bounds;
    
    grad.colors = [NSArray arrayWithObjects:(id)[[UIColor darkGrayColor] CGColor], (id)[[UIColor blackColor] CGColor], nil];
    
    [_backgroundView.layer insertSublayer:grad atIndex:0];
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
    if(indexPath.row%4==1||indexPath.row%4==3){
        static NSString *MyIdentifier = @"Appartment2TableViewCell";

        AppartmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//        [cell.menuImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[menuImagesList objectAtIndex:indexPath.row]]]];
//        cell.menuTitle.text = [NSString stringWithFormat:@"%@",[menuList objectAtIndex:indexPath.row]];
        return cell;
    }else if(indexPath.row%4==2){
        static NSString *MyIdentifier = @"AppartmentTableViewCell";
        
        AppartmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        //        [cell.menuImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[menuImagesList objectAtIndex:indexPath.row]]]];
        //        cell.menuTitle.text = [NSString stringWithFormat:@"%@",[menuList objectAtIndex:indexPath.row]];
        cell.overlayImage.image=[UIImage imageNamed:@"overlay3"];
        return cell;
    }else{
    
        static NSString *MyIdentifier = @"AppartmentTableViewCell";
        
        AppartmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//        [cell.menuImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[menuImagesList objectAtIndex:indexPath.row]]]];
//        cell.menuTitle.text = [NSString stringWithFormat:@"%@",[menuList objectAtIndex:indexPath.row]];
        cell.overlayImage.image=[UIImage imageNamed:@"overlay1"];

        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.width/2;
}
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
