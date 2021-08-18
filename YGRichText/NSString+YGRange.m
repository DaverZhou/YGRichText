//
//  NSString+YGRange.m
//  YGRichTextDemo
//
//  Created by DaverZhou on 2021/5/18.
//  Copyright © 2021 DaverZhou. All rights reserved.
//

#import "NSString+YGRange.h"

@implementation NSString (YGRange)
- (NSArray *)yg_getRangesInStringWithKeyworld:(NSString *)keyworld {
    if (!self || !keyworld) {
        return @[];
    }
    NSMutableArray *ranges = [NSMutableArray array];
    NSString *string = [self stringByAppendingString:keyworld];
    for(int i = 0; i < self.length; i ++) {
        NSString *tempString = [string substringWithRange:NSMakeRange(i, keyworld.length)];
        if ([tempString isEqualToString:keyworld]) {
            NSRange range = {i, keyworld.length};
            if (range.length + range.location > self.length) {
                range = NSMakeRange(i, self.length - i);
                [ranges addObject:[NSString stringWithFormat:@"%d,%d", (int)range.location, (int)range.length]];
                break;
            } else {
                [ranges addObject:[NSString stringWithFormat:@"%d,%d", (int)range.location, (int)range.length]];
            }
        }
    }
    return ranges;
}

- (NSRange)yg_getRangeFromString {
    if (!self) {
        return NSMakeRange(0, 0);
    }
    NSArray *temp = [self componentsSeparatedByString:@","];
    NSString *loc = temp.firstObject;
    NSString *len = temp.lastObject;
    return NSMakeRange(loc.integerValue, len.integerValue);
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
