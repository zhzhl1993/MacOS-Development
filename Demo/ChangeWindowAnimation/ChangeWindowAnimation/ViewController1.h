//
//  ViewController1.h
//  ChangeWindowAnimation
//
//  Created by zhuzhanlong on 11/30/18.
//  Copyright © 2018 Digiarty. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

@class ViewController1;

@protocol ViewController1Delegate <NSObject>

- (void)viewController1WillClose:(ViewController1 *)ViewController1;
@end

@interface ViewController1 : NSViewController

@property (nonatomic, weak) id delegate;

- (instancetype)initWithDelegate:(id)delegate;
@end
