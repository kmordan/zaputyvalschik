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

+ (char *)mixKey:(const char *)key
              withSeed:(NSString *)seed {
    size_t keySize = strlen(key);
    size_t nullTerminatedKeySize = keySize + 1;
    
    char *result = malloc(nullTerminatedKeySize);
    unsigned char md[CC_SHA1_DIGEST_LENGTH] = {0};
    
    NSData *seedData = [seed dataUsingEncoding:NSUTF8StringEncoding];
    CC_SHA1(seedData.bytes, (CC_LONG)seedData.length, md);
    
    for (unsigned long i = 0; i < keySize; i++) {
        result[i] = key[i] ^ md[i % sizeof(md)];
    }
    
    return result;
}

@end
