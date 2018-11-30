//
//  AppDelegate.m
//  ChangeWindowAnimation
//
//  Created by zhuzhanlong on 11/30/18.
//  Copyright © 2018 Digiarty. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()<ViewControllerDelegate> {
    
    ViewController *_viewController1;
}

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSView *windowBackView;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    self.window.contentView.wantsLayer = YES;
    self.window.contentView.layer.backgroundColor = [[NSColor blueColor] CGColor];
    
    _viewController1 = [[ViewController alloc] initWithDelegate:self];
    _viewController1.delegate = self;
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    
}

- (IBAction)showViewController1:(id)sender {
    NSLog(@"LOG_showViewController1");
    
    //控制main Window中页面动画退出
    NSRect windowFrame = [self.window contentView].frame;
    NSRect rect = NSMakeRect(-windowFrame.size.width, 0, windowFrame.size.width, windowFrame.size.height);
    [self moveAnimationWithView:self.windowBackView location:rect];
    
    //控制viewController的view页面进入
    NSRect viewFrame = NSMakeRect(windowFrame.size.width, 0, windowFrame.size.width, windowFrame.size.height);
    [[self.window contentView] addSubview:_viewController1.view];
    [_viewController1.view setFrame:viewFrame];
    [self moveAnimationWithView:_viewController1.view location:windowFrame];
}

- (IBAction)showViewController2:(id)sender {
    NSLog(@"LOG_showViewController2");
    
}

- (void)moveAnimationWithView:(NSView *)view location:(NSRect)rect{
    [[NSAnimationContext currentContext] setDuration:0.75];
    [[view animator] setFrame:rect];
    [NSAnimationContext endGrouping];
}

#pragma mark - ViewController1Delegate
- (void)viewControllerWillClose:(ViewController *)viewController {
    NSLog(@"LOG_viewController1WillClose");
    NSRect windowFrame =self.window.contentView.frame;
    NSRect viewNewFrame = NSMakeRect(windowFrame.size.width, 0, windowFrame.size.width, windowFrame.size.height);
    [self moveAnimationWithView:_viewController1.view location:viewNewFrame];
    [self moveAnimationWithView:self.windowBackView location:windowFrame];
}
@end
