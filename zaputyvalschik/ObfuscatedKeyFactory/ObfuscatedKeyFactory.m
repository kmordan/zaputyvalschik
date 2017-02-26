//
//  ObfuscatedKeyFactory.m
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 26/02/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import "ObfuscatedKeyFactory.h"

#import <CommonCrypto/CommonDigest.h>

@implementation ObfuscatedKeyFactory

+ (unsigned char *)obfuscateKey:(NSString *)key
                      withSeeds:(NSArray<NSString *> *)seeds {
    NSUInteger length = key.length;
    unsigned long size = length * sizeof(unsigned char);
    
    const unsigned char *cStringKey = (const unsigned char *)[key cStringUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char *obfuscatedKey = (unsigned char *)cStringKey;
    unsigned char *xorResult = NULL;
    
    for (NSString *seed in seeds) {
        xorResult = performXorOnKeyAndSeed(obfuscatedKey, seed, size);
        obfuscatedKey = xorResult;
        free(xorResult);
    }
    
    return obfuscatedKey;
}

unsigned char * performXorOnKeyAndSeed(unsigned char key[], NSString *seed, unsigned long size) {
    unsigned char *result = malloc(size);
    unsigned char md[CC_SHA1_DIGEST_LENGTH];
    
    NSData *seedData = [seed dataUsingEncoding:NSUTF8StringEncoding];
    CC_SHA1(seedData.bytes, (CC_LONG)seedData.length, md);
    
    for (unsigned long i = 0; i < size; i++) {
        result[i] = key[i] ^ md[i % sizeof(md)];
    }
    
    return result;
}

@end
