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
    NSUInteger nullTerminatedStringLength = key.length + 1u;
    unsigned long size = nullTerminatedStringLength * sizeof(unsigned char);
    
    const char *cStringKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char *obfuscatedKey = malloc(size);
    memcpy(obfuscatedKey, cStringKey, size);
    
    unsigned char *obfuscationTempResult = NULL;
    
    for (NSString *seed in seeds) {
        obfuscationTempResult = [Obfuscator mixKey:obfuscatedKey
                                            ofSize:size
                                          withSeed:seed];
        memcpy(obfuscatedKey, obfuscationTempResult, size);
        free(obfuscationTempResult);
    }
    
    return obfuscatedKey;
}

@end
