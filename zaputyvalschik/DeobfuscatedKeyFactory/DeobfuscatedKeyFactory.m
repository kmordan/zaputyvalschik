//
//  DeobfuscatedKeyFactory.m
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 05/03/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import "DeobfuscatedKeyFactory.h"
#import "Obfuscator.h"

@implementation DeobfuscatedKeyFactory

+ (NSString *)deobfuscateKey:(const unsigned char *)key
                      ofSize:(size_t)size
                   withSeeds:(NSArray<NSString *> *)seeds {
    size_t nullTerminatedKeySize = size + 1;

    unsigned char *deobfuscatedKey = malloc(nullTerminatedKeySize);
    memcpy(deobfuscatedKey, key, nullTerminatedKeySize);
    
    unsigned char *deobfuscationTempResult = NULL;
    
    for (NSString *seed in seeds) {
        deobfuscationTempResult = [Obfuscator mixKey:(const unsigned char *)deobfuscatedKey
                                              ofSize:size
                                            withSeed:seed];
        memcpy(deobfuscatedKey, deobfuscationTempResult, nullTerminatedKeySize);
        
        free(deobfuscationTempResult);
    }

    NSString *result = [[NSString alloc] initWithBytes:deobfuscatedKey
                                                length:nullTerminatedKeySize
                                              encoding:NSUTF8StringEncoding];
    
    free(deobfuscatedKey);
    
    return result;
}

@end
