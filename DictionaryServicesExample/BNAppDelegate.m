//
//  BNAppDelegate.m
//  DictionaryServicesExample
//
//  Created by Tatsuya Tobioka on 13/02/02.
//  Copyright (c) 2013年 Tatsuya Tobioka. All rights reserved.
//

#import "BNAppDelegate.h"

NSArray *DCSGetActiveDictionaries();
NSArray *DCSCopyAvailableDictionaries();
NSString *DCSDictionaryGetName(DCSDictionaryRef dictID);
NSString *DCSDictionaryGetShortName(DCSDictionaryRef dictID);

@implementation BNAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void)textViewDidChangeSelection:(NSNotification *)notification {

    if (_srcTextView.selectedRange.length > 0) {
        NSString *q = [_srcTextView.string substringWithRange:_srcTextView.selectedRange];
        
        //NSLog(@"q: %@", q);

        switch (_modePopUp.indexOfSelectedItem) {
            case 0:
                [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"dict://%@", q]]];
                break;
            case 1: {

                DCSDictionaryRef dict = NULL;
                NSArray *dicts = DCSCopyAvailableDictionaries();
                for (NSObject *d in dicts) {
                    NSString *shortName = DCSDictionaryGetShortName((__bridge DCSDictionaryRef)d);
                    if ([shortName isEqualToString:@"Japanese-English"]) {
                        dict = (__bridge DCSDictionaryRef)d;
                    }
                }
                
                NSString *def = (__bridge NSString *)DCSCopyTextDefinition(dict, (__bridge CFStringRef)q, CFRangeMake(0, q.length));
                if (def) {
                    _defTextView.string = def;
                    //NSLog(@"def: %@", def);
                }
                
                break;
            }
            default:
                break;
        }
    }
}

@end
