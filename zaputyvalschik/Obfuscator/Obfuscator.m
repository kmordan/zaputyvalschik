//
//  Obfuscator.m
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 05/03/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import "Obfuscator.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Obfuscator

+ (unsigned char *)mixKey:(unsigned char *)key
                   ofSize:(unsigned long)size
                 withSeed:(NSString *)seed {
    unsigned long nullTerminatedResultSize = size + 1;
    
    unsigned char *result = malloc(nullTerminatedResultSize);
    unsigned char md[CC_SHA1_DIGEST_LENGTH] = {0};
    
    NSData *seedData = [seed dataUsingEncoding:NSUTF8StringEncoding];
    CC_SHA1(seedData.bytes, (CC_LONG)seedData.length, md);
    
    for (unsigned long i = 0; i < size; i++) {
        result[i] = key[i] ^ md[i % sizeof(md)];
    }
    
    return result;
}

@end
