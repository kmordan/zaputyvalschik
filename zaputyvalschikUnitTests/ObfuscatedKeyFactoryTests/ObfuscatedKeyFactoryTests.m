//
//  ObfuscatedKeyFactoryTests.m
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 26/02/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ObfuscatedKeyFactory.h"

@interface ObfuscatedKeyFactoryTests : XCTestCase

@end

@implementation ObfuscatedKeyFactoryTests

#pragma mark - Lifecycle

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Tests

- (void)testObfuscateKeyWithSeeds_returnsCorrectObfuscatedKey {
    // given
    NSString *key = @"sensitive_key";
    NSArray<NSString *> *seeds = @[@"firstKey", @"secondKey"];
    
    unsigned char expectedObfuscatedKey[] = {0xf0, 0x39, 0xae, 0x87, 0xd8, 0x17, 0x86,
                                             0x56, 0xa3, 0x0e, 0xfd, 0xd4, 0xba};
    
    // when
    unsigned char *obfuscatedKey = [ObfuscatedKeyFactory obfuscateKey:key
                                                            withSeeds:seeds];
    
    // then
    int cmpResult = memcmp(obfuscatedKey, expectedObfuscatedKey, sizeof(expectedObfuscatedKey));
    
    free(obfuscatedKey);
    
    XCTAssertTrue(cmpResult == 0);
}

@end
