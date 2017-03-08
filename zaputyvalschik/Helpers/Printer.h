//
//  Printer.h
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 08/03/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Printer : NSObject

+ (void)printObfuscatedKey:(const char *)key
            usingSeparator:(NSString *)separator;

@end
