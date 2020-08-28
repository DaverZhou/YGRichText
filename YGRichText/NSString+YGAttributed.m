//
//  NSString+YGAttributed.m
//  YGRichTextDemo
//
//  Created by DaverZhou on 2020/8/27.
//  Copyright © 2020 DaverZhou. All rights reserved.
//

#import "NSString+YGAttributed.h"
#import "YGAttributedMaker.h"

@implementation NSString (YGAttributed)

- (NSMutableAttributedString *)yg_makeAttributed:(void(^)(YGAttributedMaker *make))block {
    if (!self) {
        return nil;
    }
    YGAttributedMaker *maker = [[YGAttributedMaker alloc] initWithString:self];
    block(maker);
    return maker.result;
}


@end
