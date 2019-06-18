//
//  DKHelper.m
//  bilibili_UnlockDylib
//
//  Created by 朱德坤 on 2019/6/14.
//  Copyright © 2019 DKJone. All rights reserved.
//

#import "DKHelper.h"
#import "FLEX.h"
@implementation DKHelper

+ (instancetype)shared {
    static DKHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[DKHelper alloc] init];
    });
    return helper;
}

- (void)showDKJoneIn:(UIViewController*)vc{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"插件作者提示" message:@"感谢支持，你可以通过以下任意方式" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* bilibiliAction = [UIAlertAction actionWithTitle:@"关注我的Bilibili" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [self showMyPage:@"bilibili://space/14520239"];
    }];
    UIAlertAction* githubAction = [UIAlertAction actionWithTitle:@"⭐️本项目" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [self showMyPage:@"https://github.com/DKJone/bilibili_Unlock"];
    }];
    UIAlertAction* jianshuAction = [UIAlertAction actionWithTitle:@"项目主页" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [self showMyPage:@"https://www.jianshu.com/p/0d2f529e4fb6"];
    }];
    UIAlertAction* changeAction = [UIAlertAction actionWithTitle:@"修改地区" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        NSString * text = ((UITextField *)alert.textFields.firstObject).text;
        [NSUserDefaults.standardUserDefaults setObject:text forKey:@"dkArea"];
        [NSUserDefaults.standardUserDefaults synchronize];
    }];
    UIAlertAction* debugAction = [UIAlertAction actionWithTitle:@"debug" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [FLEXManager.sharedManager showExplorer];
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入地区值";
        textField.text = [NSUserDefaults.standardUserDefaults objectForKey:@"dkArea"];
    }];
    [alert addAction:bilibiliAction];
    [alert addAction:githubAction];
    [alert addAction:jianshuAction];
    [alert addAction:changeAction];
    [alert addAction:debugAction];
    [vc presentViewController:alert animated:YES completion:nil];
//    UILongPressGestureRecognizer * reg;

}

- (void)showMyPage:(NSString *)urlStr{
    [UIApplication.sharedApplication openURL:[NSURL URLWithString:urlStr]];
   
}

@end
