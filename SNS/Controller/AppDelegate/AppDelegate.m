//
//  AppDelegate.m
//  SNS
//
//  Created by Apple on 19/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import "Utils.h"
#import "Common.h"

@implementation UILabel (Helper)

- (void)setSubstituteFontName:(NSString *)name UI_APPEARANCE_SELECTOR {
    // NSLog(@"%@",name);
    //NSLog(@"%@-%@",self.font.fontName,self.font.fontDescriptor.fontAttributes);
    if(isBold(self.font.fontDescriptor)){
        //  NSString *str =[NSString stringWithFormat:@"%@-Bold",name];
        self.font = [UIFont fontWithName:@"Oswald-Regular" size:self.font.pointSize];
        
    }else{
        self.font = [UIFont fontWithName:@"Oswald-Light" size:self.font.pointSize];
    }
    
}
BOOL isBold(UIFontDescriptor * fontDescriptor)
{
    return (fontDescriptor.symbolicTraits & UIFontDescriptorTraitBold) != 0;
}

@end
@implementation UITextView (Helper)
- (void)setSubstituteFontName:(NSString *)name UI_APPEARANCE_SELECTOR {
    // NSLog(@"%@",name);
    self.font = [UIFont fontWithName:name size:self.font.pointSize];
    
}
@end
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [GIDSignIn sharedInstance].clientID = @"756607348833-frm5rujovba5j71mtok3k26h645p9f8f.apps.googleusercontent.com";
    [GIDSignIn sharedInstance].delegate = self;
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    return YES;
}

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<NSString *, id> *)options {
    return [[GIDSignIn sharedInstance] handleURL:url
                               sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                      annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
    
   
}
//- (BOOL)application:(UIApplication *)application
//            openURL:(NSURL *)url
//  sourceApplication:(NSString *)sourceApplication
//         annotation:(id)annotation {
//    return [[GIDSignIn sharedInstance] handleURL:url
//                               sourceApplication:sourceApplication
//                                      annotation:annotation];
//}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    NSString* strDeviceToken = [[[[deviceToken description]
                                  stringByReplacingOccurrencesOfString: @"<" withString: @""]
                                 stringByReplacingOccurrencesOfString: @">" withString: @""]
                                stringByReplacingOccurrencesOfString: @" " withString: @""] ;
    NSLog(@"Device_Token     -----> %@\n", strDeviceToken);
    [[NSUserDefaults standardUserDefaults] setValue:strDeviceToken forKey:@"TOKEN"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"Called222");
}
//- (void)downloadStringsFile {
//    if (![Utils isOnline]) {
//        [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"internet_error"]];
//        return;
//    }
//    NSData *data2 = [NSData dataWithContentsOfURL:[Utils createURLForPage:WORDS withParameters:@{}]];
//    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data2 options:NSJSONReadingMutableContainers error:nil];
//    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
//    NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
//    NSURL *filePath = [documentsDirectoryURL URLByAppendingPathComponent:@"strings.json"];
//    NSLog(@"file: %@", filePath);
//    
//    [data writeToURL:filePath atomically:YES];
//    
//    [MCLocalization loadFromURL:filePath defaultLanguage:KEY_LANGUAGE_EN];
//    if ([[Utils getLanguage] length] != 0) {
//        [[MCLocalization sharedInstance] setLanguage:[Utils getLanguage]];
//        [[MCLocalization sharedInstance] reloadStrings];
//    }
//    [self downloadSettings];
//}
//- (void)downloadSettings {
//    if (![Utils isOnline]) {
//        [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"internet_error"]];
//        return;
//    }
//    NSData *data2 = [NSData dataWithContentsOfURL:[Utils createURLForPage:SETTINGS withParameters:@{}]];
//    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data2 options:NSJSONReadingMutableContainers error:nil];
//    //    [[NSUserDefaults standardUserDefaults] setValue:dictionary forKey:@"SETTINGS"];
//    //    [[NSUserDefaults standardUserDefaults] synchronize];
//    
//    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dictionary];
//    [currentDefaults setObject:data forKey:@"SETTINGS"];
//    
//}
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    if([[UIApplication sharedApplication] applicationState]!=UIApplicationStateActive){
        NSLog(@"application:didReceiveRemoteNotification:fetchCompletionHandler: %@", userInfo);
        //        _fromPushOrNot=@"Push";
        if([[[userInfo valueForKey:@"custom"] valueForKey:@"a"] valueForKey:@"type"]){
            self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
//            _fromPushNotification=@"YES";
//            _pushDict=[[userInfo valueForKey:@"custom"] valueForKey:@"a"];
            self.window.rootViewController = viewController;
            [self.window makeKeyAndVisible];
        }
    }
    
    completionHandler(nil);
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                  openURL:url
                                                        sourceApplication:sourceApplication
                                                               annotation:annotation
                    ];
    
    BOOL Ghandled = [[GIDSignIn sharedInstance] handleURL:url
                                        sourceApplication:sourceApplication
                                               annotation:annotation];
    // Add any custom logic here.
    return handled||Ghandled;
}

@end
