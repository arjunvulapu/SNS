//
//  SIgnUpViewController.m
//  SNS
//
//  Created by Apple on 04/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "SIgnUpViewController.h"

@interface SIgnUpViewController ()

@end

@implementation SIgnUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _emailTxtField.placeholder=@"Enter Email Address";
    _firstNameTxtFiled.placeholder=@"Enter FirstName";
    _lastNameTxtfield.placeholder=@"Enter LastName";
    _phoneTxtField.placeholder=@"Enter PhoneNumber";
    _passwordTxtField.placeholder=@"Enter Password";
    _conformPasswordTxtField.placeholder=@"Enter Conform Password";
    _emailTxtField.placeholderColor = [UIColor lightTextColor];
    _firstNameTxtFiled.placeholderColor = [UIColor lightTextColor];
    _lastNameTxtfield.placeholderColor = [UIColor lightTextColor];
    _phoneTxtField.placeholderColor = [UIColor lightTextColor];
    _passwordTxtField.placeholderColor = [UIColor lightTextColor];
    _conformPasswordTxtField.placeholderColor = [UIColor lightTextColor];
    _user_image.layer.cornerRadius=_user_image.frame.size.height/2;
    _user_image.clipsToBounds=YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signupBtnAction:(id)sender {
    if(_firstNameTxtFiled.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter FirstName")];
    }else if(_lastNameTxtfield.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter LastName")];
    }else if(_emailTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter EmailAddress")];
    }else if(_phoneTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter PhoneNumber")];
    }else if(_passwordTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Password")];
    }else if(_conformPasswordTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Conform Password")];
    }else if(_passwordTxtField.text != _conformPasswordTxtField.text){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Password & Conform Password to be same")];
    }
    else{
        [self makePostCallForPage:REGISTER withParams:@{@"fname":_firstNameTxtFiled.text,@"lname":_lastNameTxtfield.text,@"email":_emailTxtField.text,@"phone":_phoneTxtField.text,@"password":_passwordTxtField.text,} withRequestCode:100];
    }
    
}

- (IBAction)backBtnAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)imageAction:(id)sender {
      [self imageSelection:sender];
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
//            [Utils loginUserWithMemberId:[NSString stringWithFormat:@"%@",[[result valueForKey:@"user"] valueForKey:@"id"]] withType:@"User"];
//            //            [Utils loginUserWithMemberId:[result valueForKey:@"user"] withType:@"UserInfo"];
//            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//            [defaults setObject:[result valueForKey:@"user"] forKey:@"USERINFO"];
//            [defaults synchronize];
            //  [APP_DELEGATE afterLoginSucess];
            NSString *str=[result valueForKey:@"message"];
            [self showSuccessMessage:str];
            [self.navigationController popViewControllerAnimated:YES];
           
        }
    }
}

-(void)imageSelection:(id)sender{
    
    // if (!_userPicker) {
    _userPicker = [[UIImagePickerController alloc] init];
    _userPicker.delegate = self;
    //}
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:Localized(@"Select Image") message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"Camera") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _userPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:_userPicker animated:YES completion:nil];
    }]];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"Gallery") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _userPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:_userPicker animated:YES completion:nil];
    }]];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"Cancel") style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:controller animated:YES completion:nil];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker2 didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    PECropViewController *controller = [[PECropViewController alloc] init];
    controller.image = image;
    controller.delegate = self;
    controller.keepingCropAspectRatio = YES;
    controller.toolbarHidden = YES;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:navigationController animated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cropViewControllerDidCancel:(PECropViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:NULL];
}

- (void)cropViewController:(PECropViewController *)controller didFinishCroppingImage:(UIImage *)image {
    [controller dismissViewControllerAnimated:YES completion:NULL];
    
    if (image != nil) {
        self.user_image.image = image;
        user_uiimage = image;
        
        
    }
}
UIImage *user_uiimage;
- (void)uploadImagesWithProgressWithId:(NSString *)adId {
    
    //http://clients.yellowsoft.in/lawyers/api/add-member-image.php
    
    NSString *serverURL = [NSString stringWithFormat:@"%@/%@", SERVER_URL,@"EDIT_PROFILE_IMAGE"];
    
    NSDictionary *parameters = @{@"member_id":adId};
    
    
    //    UIImage *image = user_uiimage;
    UIImage *image = [UIImage imageWithCGImage:user_uiimage.CGImage scale:0.25 orientation:user_uiimage.imageOrientation];
    
    
    if (image == nil) {
        [self hideHUD];
        [Utils showAlertWithMessage:[MCLocalization stringForKey:@"SignUp Sucessfully"]];
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    
    
    // image = [image resizedImageToFitInSize:CGSizeMake(960, 640) scaleIfSmaller:NO];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:serverURL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:UIImagePNGRepresentation(image)
                                    name:@"file"
                                fileName:@"file.png"
                                mimeType:@"image/png"];
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask;
    
    uploadTask = [manager uploadTaskWithStreamedRequest:request
                                               progress:^(NSProgress * _Nonnull uploadProgress) {
                                                   dispatch_async(dispatch_get_main_queue(), ^{
                                                       [SVProgressHUD showProgress:uploadProgress.fractionCompleted];
                                                   });
                                               }
                                      completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                          if (error) {
                                              NSLog(@"Failure %@", error.description);
                                              [self hideHUD];
                                              [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"error_while_posting_ad"]];
                                              
                                          } else {
                                              
                                              NSLog(@"Success %@", responseObject);
                                              
                                              [self hideHUD];
                                              [Utils showAlertWithMessage:[MCLocalization stringForKey:@"SignUp Sucessfully"]];
                                              [self.navigationController popViewControllerAnimated:YES];
                                          }
                                      }];
    
    
    
    [uploadTask resume];
}

@end
