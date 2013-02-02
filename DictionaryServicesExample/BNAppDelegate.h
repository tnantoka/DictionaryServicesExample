//
//  BNAppDelegate.h
//  DictionaryServicesExample
//
//  Created by Tatsuya Tobioka on 13/02/02.
//  Copyright (c) 2013年 Tatsuya Tobioka. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BNAppDelegate : NSObject <NSApplicationDelegate, NSTextViewDelegate>

@property (assign) IBOutlet NSWindow *window;


@property (unsafe_unretained) IBOutlet NSTextView *srcTextView;
@property (unsafe_unretained) IBOutlet NSTextView *defTextView;
@property (weak) IBOutlet NSPopUpButton *modePopUp;

@end
