// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DKHelper.h"
%hook UIViewController

- (void)viewWillAppear:(BOOL)animated{
    %orig;
    NSLog(@"\n***********************************************\n\t%@ appear\n***********************************************\n",NSStringFromClass([(NSObject*)self class]));
    UILongPressGestureRecognizer *rec = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerQuadrupleTap:)];
    rec.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:rec];
     BOOL isHome = [[NSString stringWithFormat:@"%@",self] containsString:@"HomeView"];
     if (!isHome){return;}
     BOOL isShow = [NSUserDefaults.standardUserDefaults boolForKey:@"DKJone"];
     if (!isShow) {
         [NSUserDefaults.standardUserDefaults setBool:YES forKey:@"DKJone"];
         [NSUserDefaults.standardUserDefaults synchronize];
         [DKHelper.shared showDKJoneIn:self];
     }
}


%new
- (void)handleTwoFingerQuadrupleTap:(id *)tapRecognizer
{
    [DKHelper.shared showDKJoneIn:self];
}
%end


/// 地区
%hook BBPgcPhoneScheduleVM
- (id)area_id{
    return [NSUserDefaults.standardUserDefaults objectForKey: @"dkArea"];
}
%end


/// 大会员
%hook BFCUserVipModel
- (int)vipStatus{
    return 1;
}
- (BOOL)isValidYearVip{
    return YES;
}
- (BOOL)isValidVip{
    return YES;
}

- (int)vipType{
    return 2;
}

- (long long)vipDueDate{
    return 1490544000000 + 1000 * 24 * 3600 *365 * 2;
}
%end


%hook BiliAppDelegate

- (_Bool)handleOpenUrl:(id)arg1{
    NSLog(@"==================\n%@\n==================\n",arg1);
    return %orig();
}
- (_Bool)application:(id)arg1 openURL:(id)arg2 options:(id)arg3{
    NSLog(@"==================\n%@\n==================\n",arg2);
    return %orig();
}
- (_Bool)application:(id)arg1 openURL:(id)arg2 sourceApplication:(id)arg3 annotation:(id)arg4{
    NSLog(@"==================\n%@\n==================\n",arg2);
    return %orig();
}
- (_Bool)application:(id)arg1 handleOpenURL:(id)arg2{
    NSLog(@"==================\n%@\n==================\n",arg2);
    return %orig();
}

%end


%hook BBPgcMPMainVC

- (_Bool)isOpenVIP{
   return YES;
}

- (void)setParams:(id)arg1{
    NSLog(@"==================\n%@\n==================\n",arg1);
    %orig();
}
%end

%hook BBPhonePlayerTagViewController

- (void)jumpWithVideoInfo:(id)arg1{
    NSLog(@"==================\n%@\n==================\n",arg1);
    %orig();
}

%end
