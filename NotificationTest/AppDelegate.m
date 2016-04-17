//
//  AppDelegate.m
//  NotificationTest
//
//  Created by 河野 さおり on 2016/02/26.
//  Copyright © 2016年 河野 さおり. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate
@synthesize notifPoster;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self setUpNotification];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)pshNotificationTest:(id)sender {
    //ノーティフィケーション・メッセージを送信
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MyNotif1" object:self];
    for (int i = 0; i < 4; i++) {
        //ノーティフィケーション・メッセージを送信
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:i] forKey:@"loopCount"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MyNotif2" object:self userInfo:userInfo];
    }
    //ノーティフィケーション・メッセージを送信
    NSNotification *notif3 = [NSNotification notificationWithName:@"MyNotif3" object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notif3];
}

//ノーティフィケーションを受け取った
- (void)MyNotif1:(NSNotification*)notif {
    NSLog(@"Got notified: %@", notif.name);
}

- (void)MyNotif2:(NSNotification*)notif {
    NSLog(@"Got notified: %@ - %@", notif.name,[[notif userInfo] objectForKey:@"loopCount"]);
}

- (IBAction)pshFromOtherClass:(id)sender {
    notifPoster = [[NotifPoster alloc]init];
    [notifPoster postNotif];
}

//ノーティフィケーションを設定
- (void)setUpNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MyNotif1:) name:@"MyNotif1" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MyNotif2:) name:@"MyNotif2" object:nil];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"MyNotif3" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notif){
        NSLog(@"Got notified: %@", notif.name);
    }];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"MyNotif4" object:notifPoster queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notif){
        NSLog(@"Got notified: %@", notif.name);
    }];
}

@end
