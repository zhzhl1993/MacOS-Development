//
//  ViewController1.h
//  ChangeWindowAnimation
//
//  Created by zhuzhanlong on 11/30/18.
//  Copyright © 2018 Digiarty. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

@class ViewController;

@protocol ViewControllerDelegate <NSObject>

- (void)viewControllerWillClose:(ViewController *)ViewController;
@end

@interface ViewController : NSViewController

@property (nonatomic, weak) id delegate;

- (instancetype)initWithDelegate:(id)delegate;
@end
