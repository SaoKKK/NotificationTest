//
//  NotifPoster.m
//  NotificationTest
//
//  Created by 河野 さおり on 2016/04/17.
//  Copyright © 2016年 河野 さおり. All rights reserved.
//

#import "NotifPoster.h"

@implementation NotifPoster
- (void)postNotif{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MyNotif4" object:self];
}
@end
