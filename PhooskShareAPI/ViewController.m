//
//  ViewController.m
//  PhooskShareAPI
//
//  Created by APPLE'S iMac on 7/10/20.
//  Copyright © 2020 phoosk. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface ViewController () <FBSDKSharingDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)shareButtonPressed:(id)sender {
    UIImage *image = [UIImage imageNamed:@"puppy"];
    FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
    photo.image = image;
    
    FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
    content.photos = @[photo];
    
    [FBSDKShareAPI shareWithContent:content delegate:self];
}

#pragma mark - FBSDKSharingDelegate
- (void)sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:[error description] preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary<NSString *,id> *)results {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Success" message:@"Completed sharing" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)sharerDidCancel:(id<FBSDKSharing>)sharer {
    
}

@end
