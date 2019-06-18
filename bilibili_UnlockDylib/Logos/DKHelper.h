//
//  DKHelper.h
//  bilibili_UnlockDylib
//
//  Created by 朱德坤 on 2019/6/14.
//  Copyright © 2019 DKJone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface DKHelper : NSObject
+ (instancetype)shared;
- (void)showDKJoneIn:(UIViewController*)vc;
@end

NS_ASSUME_NONNULL_END
