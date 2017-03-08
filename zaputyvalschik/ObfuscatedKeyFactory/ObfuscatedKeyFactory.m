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

+ (const char *)obfuscateKey:(NSString *)key
                   withSeeds:(NSArray<NSString *> *)seeds {
    const char *cStringKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    
    size_t nullTerminatedKeySize = strlen(cStringKey) + 1;
    
    char *obfuscatedKey = malloc(nullTerminatedKeySize);
    strcpy(obfuscatedKey, cStringKey);
    
    char *obfuscationTempResult = NULL;
    
    for (NSString *seed in seeds) {
        obfuscationTempResult = [Obfuscator mixKey:(const char *)obfuscatedKey
                                          withSeed:seed];
        strcpy(obfuscatedKey, obfuscationTempResult);
        free(obfuscationTempResult);
    }
    
    return (const char *)obfuscatedKey;
}

@end
