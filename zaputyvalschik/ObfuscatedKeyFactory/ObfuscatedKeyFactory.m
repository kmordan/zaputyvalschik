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

+ (const unsigned char *)obfuscateKey:(NSString *)key
                            withSeeds:(NSArray<NSString *> *)seeds {
    const char *cStringKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    
    size_t nullTerminatedKeySize = strlen(cStringKey) + 1;

    unsigned char *obfuscatedKey = malloc(nullTerminatedKeySize);
    memcpy(obfuscatedKey, cStringKey, nullTerminatedKeySize);
    
    unsigned char *obfuscationTempResult = NULL;
    
    for (NSString *seed in seeds) {
        obfuscationTempResult = [Obfuscator mixKey:(const unsigned char *)obfuscatedKey
                                            ofSize:nullTerminatedKeySize - 1
                                          withSeed:seed];
        memcpy(obfuscatedKey, obfuscationTempResult, nullTerminatedKeySize);
        free(obfuscationTempResult);
    }
    
    return (const unsigned char *)obfuscatedKey;
}

@end
