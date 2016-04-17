//
//  AppDelegate.h
//  NotificationTest
//
//  Created by 河野 さおり on 2016/02/26.
//  Copyright © 2016年 河野 さおり. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NotifPoster.h"

@class NotifPoster;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong)NotifPoster* notifPoster;

@end

