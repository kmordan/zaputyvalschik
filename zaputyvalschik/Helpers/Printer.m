//
//  Printer.m
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 08/03/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import "Printer.h"

@implementation Printer

+ (void)printObfuscatedKey:(unsigned char *)key
                    ofSize:(unsigned long)size
            usingSeparator:(NSString *)separator {
    NSMutableString *result = [NSMutableString new];
    
    for(NSUInteger i = 0u; i < size; i++) {
        [result appendFormat:@"0x%02x", key[i]];
        
        BOOL shouldAppendSeparator = (i < size - 1u);
        if (shouldAppendSeparator == YES) {
            [result appendString:separator];
        }
    }
    
    NSLog(@"Your obfuscated key: %@", result);
}

@end
