//
//  NSTextField+Blank.m
//  URIParser
//
//  Created by Daniel Martin on 4/25/13.
//  Copyright (c) 2013 Daniel Martín. All rights reserved.
//

#import "NSTextField+Blank.h"

@implementation NSTextField (Blank)

- (BOOL)isBlank
{
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [self.stringValue stringByTrimmingCharactersInSet:whitespace];
    return ([trimmed length] <= 0);
}

@end
