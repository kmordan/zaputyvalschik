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
    
    size_t cStringKeySize = strlen(cStringKey);

    unsigned char *obfuscatedKey = malloc(cStringKeySize);
    memcpy(obfuscatedKey, cStringKey, cStringKeySize);
    
    unsigned char *obfuscationTempResult = NULL;
    
    for (NSString *seed in seeds) {
        obfuscationTempResult = [Obfuscator mixKey:(const unsigned char *)obfuscatedKey
                                            ofSize:cStringKeySize
                                          withSeed:seed];
        memcpy(obfuscatedKey, obfuscationTempResult, cStringKeySize);
        free(obfuscationTempResult);
    }
    
    return (const unsigned char *)obfuscatedKey;
}

@end
