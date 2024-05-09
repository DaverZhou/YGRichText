//
//  NSString+YGRange.m
//  YGRichTextDemo
//
//  Created by DaverZhou on 2021/5/18.
//  Copyright © 2021 DaverZhou. All rights reserved.
//

#import "NSString+YGRange.h"

@implementation NSString (YGRange)
- (NSArray<NSValue *> *)yg_getRangesInStringWithKeyworld:(NSString *)keyworld {
    if (!self || !keyworld) {
        return @[];
    }
    NSInteger textLength = keyworld.length;
    NSMutableArray<NSValue *> *ranges = [NSMutableArray array];
    NSString *string = [self stringByAppendingString:keyworld];
    for (int i = 0; i < self.length; i ++) {
        if (i + textLength <= self.length) {
            NSString *tempString = [string substringWithRange:NSMakeRange(i, textLength)];
            if ([tempString isEqualToString:keyworld]) {
                NSRange range = NSMakeRange(i, textLength);
                [ranges addObject:[NSValue valueWithRange:range]];
            }
        } else {
            break;
        }
    }
    return ranges;
}

- (int)yg_getCharacterNumWithMaxWidth:(CGFloat)maxWidth font:(UIFont *)font {
    if (!self) {
        return 0;
    }
    CGFloat width = 0;
    int result = (int)self.length;
    NSDictionary *dic = @{NSFontAttributeName:font};
    for (int i = 0; i < self.length; i++) {
        NSString *character = [self substringWithRange:NSMakeRange(i, 1)];
        CGFloat characterWidth = [character sizeWithAttributes:dic].width;
        width += characterWidth;
        if (width > maxWidth) {
            result = i;
            break;
        }
    }
    return result;
}


@end
