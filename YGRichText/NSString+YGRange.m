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
    if (!self || !keyworld || self.length == 0 || keyworld.length == 0) {
        return @[];
    }
    
    NSMutableArray *ranges = [NSMutableArray array];
    NSRange searchRange = NSMakeRange(0, self.length);
    NSRange foundRange;
    
    while ((foundRange = [self rangeOfString:keyworld options:0 range:searchRange]).location != NSNotFound) {
        [ranges addObject:[NSValue valueWithRange:foundRange]];
        searchRange.location = NSMaxRange(foundRange);
        searchRange.length = self.length - searchRange.location;
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
