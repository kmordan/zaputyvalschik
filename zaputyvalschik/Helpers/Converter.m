//
//  Converter.m
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 08/03/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import "Converter.h"

@implementation Converter

+ (NSString *)convertCharArray:(const unsigned char *)array
                        ofSize:(size_t)size
     toHexStringUsingSeparator:(NSString *)separator {
    
    NSMutableString *result = [NSMutableString new];
    
    for(NSUInteger i = 0u; i < size; i++) {
        [result appendFormat:@"0x%02x", array[i]];
        
        BOOL shouldAppendSeparator = (i < size - 1u);
        if (shouldAppendSeparator == YES) {
            [result appendString:separator];
        }
    }
    
    return [result copy];
}

@end
