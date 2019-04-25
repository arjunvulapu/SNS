//
//  HOMEVC.m
//  SNS
//
//  Created by Apple on 26/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "HOMEVC.h"
#import "HomeMenuTableViewCell.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "RentVC.h"
#import "BUYVC.h"
#import "ResaleVC.h"
#import "RecommendedSearchVC.h"
#import "SIgnUpViewController.h"
#import "MyListingsVC.h"
#import "MyProfileVC.h"
@interface HOMEVC ()
{
    NSMutableArray *menuList;
    NSMutableArray *menuImagesList;
    BOOL menuOrNot;

}
@end

@implementation HOMEVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _menuTableView.delegate=self;
    _menuTableView.dataSource=self;
    [self removeALlAddedViews];
    _emailTxtField.placeholder=@"Email ID/Mobile Number";
    _passwordTxtField.placeholder=@"Enter Password";
    [self.navigationController.navigationBar setHidden:YES];
//    self.fLoginBtn = [[FBSDKLoginButton alloc] init];
//    self.fLoginBtn.hidden = YES;
//    self.fLoginBtn.readPermissions = @[@"public_profile", @"email"];

}
-(void)viewWillAppear:(BOOL)animated{
    [self removeALlAddedViews];
}
- (IBAction)signupBtnAction:(id)sender {
    SIgnUpViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"SIgnUpViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)forgotBtnAction:(id)sender {
//    [self removeALlAddedViews];

}

- (IBAction)privacyBtnAction:(id)sender {
//    [self removeALlAddedViews];

}

//- (IBAction)loginbtnAction:(id)sender {
////    [self removeALlAddedViews];
//
//}

- (IBAction)buyBtnAction:(id)sender {
    [self removeALlAddedViews];
    BUYVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"BUYVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)lookingbtnAction:(id)sender {
    [self removeALlAddedViews];
    ResaleVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ResaleVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)postBtnAction:(id)sender {
    [self removeALlAddedViews];
    RentVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"RentVC"];
    [self.navigationController pushViewController:vc animated:YES];

}

- (IBAction)menuBtnAction:(id)sender {
    [self removeALlAddedViews];
    menuList = @[@"Submit Property",@"Property Gallery",@"Recommended Search",@"Property Expert",@"Packages",@"Privileges",@"About Us",@"Carrers",@"9346493464"];
    menuImagesList = @[@"submitproperty",@"propertygallery",@"recommendedsearch",@"propertyexpert",@"packages",@"privileges",@"aboutus",@"careers",@"support"];
    menuOrNot=true;
    [_menuTableView reloadData];
    [self setView:_menuTableView hidden:false];
    
}
-(void)removeALlAddedViews{
    if(!_menuTableView.isHidden){
        _menuTableView.hidden = YES;
    }
    BOOL doesContain = [self.view.subviews containsObject:_loginView];
    
    if(doesContain){
        [_loginView removeFromSuperview];
    }
}
- (IBAction)userBtnAction:(id)sender {
    [self removeALlAddedViews];

    if([Utils loggedInUserId] != -1){
        menuList = @[@"Edit Profile",@"My Listing",@"Log out"];
        menuImagesList = @[@"editprofile",@"mylisting",@"logout"];
        
        menuOrNot=false;
        [_menuTableView reloadData];
        [self setView:_menuTableView hidden:false];
    }else{
    
        _loginView.frame=CGRectMake(0, 0, self.view.frame.size.width-25, 286);
        
        [UIView transitionWithView:_loginView duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^(void){
            [self.view addSubview: _loginView];
        } completion:nil];
        _loginView.layer.cornerRadius=10;
        _loginView.clipsToBounds=YES;
        _loginView.center=self.view.center;
    }

}
//-(void)setView:(UIView *)view With:(BOOL)hidden{
//    [UIView transitionWithView:view
//                      duration:0.4
//                       options:UIViewAnimationOptionTransitionCrossDissolve
//                    animations:^{
//                        view.hidden = hidden;
//                    }
//                    completion:NULL];
//
//}
- (void)setView:(UIView*)view hidden:(BOOL)hidden {
    [UIView transitionWithView:view duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^(void){
        [view setHidden:hidden];
    } completion:nil];
}
- (void)removeView:(UIView*)view  {
    [UIView transitionWithView:view duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^(void){
        [view removeFromSuperview];
    } completion:nil];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches began");
    UITouch *touch = [touches anyObject];
    if(touch.view!=_menuTableView&&!_menuTableView.isHidden){
        _menuTableView.hidden = YES;
    }
    BOOL doesContain = [self.view.subviews containsObject:_loginView];

    if(touch.view!=_loginView&&doesContain){
        [_loginView removeFromSuperview];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return menuList.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==menuList.count-1){
        static NSString *MyIdentifier = @"HomeMenu3TableViewCell";
        
        HomeMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        [cell.menuImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[menuImagesList objectAtIndex:indexPath.row]]]];
        cell.menuTitle.text = [NSString stringWithFormat:@"%@",[menuList objectAtIndex:indexPath.row]];
        return cell;
    }else{
        
    static NSString *MyIdentifier = @"HomeMenuTableViewCell";
    
    HomeMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    [cell.menuImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[menuImagesList objectAtIndex:indexPath.row]]]];
    cell.menuTitle.text = [NSString stringWithFormat:@"%@",[menuList objectAtIndex:indexPath.row]];
    return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HomeMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeMenu2TableViewCell"];
    cell.backgroundColor=[UIColor cyanColor];
    if(menuOrNot){
        cell.menuTitle.text=@"Menu";
    }else{
        cell.menuTitle.text=@"User";

    }
    cell.menuTitle.textColor=THEME_COLOR;

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
{
    return 44;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
{
    _tableViewHeight.constant=_menuTableView.contentSize.height;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(menuOrNot){
        if(indexPath.row==2){
            
                RecommendedSearchVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"RecommendedSearchVC"];
                [self.navigationController pushViewController:vc animated:YES];
                }
        else if(indexPath.row==8){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:9848012345"]];
            
        }
    }
    else {
        if(indexPath.row==0){
        MyProfileVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"MyProfileVC"];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row==1){
        MyListingsVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"MyListingsVC"];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row==2){
        [Utils logoutUser];
        [self removeALlAddedViews];
        [_userImage setImage:[UIImage imageNamed:@"user.png"]];
        _userLbl.text=@"Login";
    }
    }
    [self removeALlAddedViews];
}
- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations on signed in user here.
    NSString *userId = user.userID;                  // For client-side use only!
    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    NSString *fullName = user.profile.name;
    NSString *givenName = user.profile.givenName;
    NSString *familyName = user.profile.familyName;
    NSString *email = user.profile.email;
    
    // ...
}
- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations when the user disconnects from app here.
    // ...
}
//- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {
//    //[myActivityIndicator stopAnimating];
//}
//
//// Present a view that prompts the user to sign in with Google
//- (void)signIn:(GIDSignIn *)signIn
//presentViewController:(UIViewController *)viewController {
//    [self presentViewController:viewController animated:YES completion:nil];
//}
//
//// Dismiss the "Sign in with Google" view
//- (void)signIn:(GIDSignIn *)signIn
//dismissViewController:(UIViewController *)viewController {
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
- (IBAction)didTapSignOut:(id)sender {
    [[GIDSignIn sharedInstance] signOut];
}

- (IBAction)googleBtnAction:(id)sender {
    [GIDSignIn sharedInstance].uiDelegate =self;
    [GIDSignIn sharedInstance].delegate =self;

    [[GIDSignIn sharedInstance] signIn];
}

- (IBAction)facebookBtnAction:(id)sender {
//    [self.fLoginBtn sendActionsForControlEvents: UIControlEventTouchUpInside];
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile", @"email", @"user_friends"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
             
             [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"email,name"}]
              startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                  if (!error) {
                      NSLog(@"fetched user:%@  and Email : %@", result,result[@"email"]);
                  }
              }];
         }
     }];
}


- (IBAction)loginbtnAction:(id)sender {
    if(_emailTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter EmailAddress")];
    }else if(_passwordTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Password")];
    }
    else{
        [self makePostCallForPage:LOGIN withParams:@{@"email":_emailTxtField.text,@"password":_passwordTxtField.text} withRequestCode:100];
    }
    
}

-(void)parseResult:(id)result withCode:(int)reqeustCode{
    NSLog(@"%@",result);
    if(reqeustCode == 101){
        NSLog(@"%@",result);
    
    }
    else  if (reqeustCode == 100) {
        if ([[result valueForKey:@"status"] isEqualToString:@"Failed"]) {
            NSString *str=[result valueForKey:@"message"];
            [self showErrorAlertWithMessage:Localized(str)];
        } else {
            [Utils loginUserWithMemberId:[NSString stringWithFormat:@"%@",[[result valueForKey:@"user"] valueForKey:@"id"]] withType:@"User"];
            //            [Utils loginUserWithMemberId:[result valueForKey:@"user"] withType:@"UserInfo"];
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            [defaults setObject:[result valueForKey:@"user"] forKey:@"USERINFO"];
            [defaults synchronize];
            [self removeALlAddedViews];
//            [_userImage setImageWithURL:[[result valueForKey:@"user"] valueForKey:@""]; usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            _userLbl.text=[NSString stringWithFormat:@"%@ %@",[result valueForKey:@"fname"],[result  valueForKey:@"lname"]];
          //  [APP_DELEGATE afterLoginSucess];
            
        }
    }
}
@end
