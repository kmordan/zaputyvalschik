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
    unsigned long size = key.length * sizeof(unsigned char);
    unsigned long nullTerminatedStringSize = size + 1;
    
    const char *cStringKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char *obfuscatedKey = malloc(nullTerminatedStringSize);
    memcpy(obfuscatedKey, cStringKey, nullTerminatedStringSize);
    
    unsigned char *obfuscationTempResult = NULL;
    
    for (NSString *seed in seeds) {
        obfuscationTempResult = [Obfuscator mixKey:obfuscatedKey
                                            ofSize:size
                                          withSeed:seed];
        memcpy(obfuscatedKey, obfuscationTempResult, nullTerminatedStringSize);
        free(obfuscationTempResult);
    }
    
    return obfuscatedKey;
}

@end
