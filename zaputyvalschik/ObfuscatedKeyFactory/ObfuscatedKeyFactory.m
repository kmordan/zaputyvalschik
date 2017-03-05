//
//  ObfuscatedKeyFactory.m
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 26/02/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import "ObfuscatedKeyFactory.h"
#import "Obfuscator.h"

@implementation ObfuscatedKeyFactory

+ (unsigned char *)obfuscateKey:(NSString *)key
                      withSeeds:(NSArray<NSString *> *)seeds {
    NSUInteger length = key.length;
    unsigned long size = length * sizeof(unsigned char);
    
    const unsigned char *cStringKey = (const unsigned char *)[key cStringUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char *obfuscatedKey = (unsigned char *)cStringKey;
    unsigned char *obfuscationTempResult = NULL;
    
    for (NSString *seed in seeds) {
        obfuscationTempResult = [Obfuscator mixKey:obfuscatedKey
                                            ofSize:size
                                          withSeed:seed];
        obfuscatedKey = obfuscationTempResult;
        free(obfuscationTempResult);
    }
    
    return obfuscatedKey;
}

@end
