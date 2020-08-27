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
/// 富文本
/// @param block YGAttributedMaker
- (NSMutableAttributedString *)yg_makeAttributed:(void(^)(YGAttributedMaker *make))block {
    YGAttributedMaker *maker = [[YGAttributedMaker alloc] initWithString:self];
    block(maker);
    return maker.result;
}


@end
