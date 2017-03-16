//
//  Converter.h
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 08/03/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Converter : NSObject

+ (NSString *)convertCharArray:(const unsigned char *)array
                        ofSize:(size_t)size
     toHexStringUsingSeparator:(NSString *)separator;

@end
