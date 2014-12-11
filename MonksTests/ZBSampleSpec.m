//
//  ZBSampleSpec.m
//  Monks
//
//  Created by Zuri Biringer on 12/10/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "Kiwi.h"

SPEC_BEGIN(MathSpec)

describe(@"Math", ^{
    it(@"is pretty cool", ^{
        NSUInteger a = 16;
        NSUInteger b = 26;
        [[theValue(a + b) should] equal:theValue(43)];
    });
});

SPEC_END