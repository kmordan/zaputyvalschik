//
//  Printer.h
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 08/03/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Printer : NSObject

+ (void)printObfuscatedKey:(unsigned char *)key
                    ofSize:(unsigned long )size
            usingSeparator:(NSString *)separator;

@end
