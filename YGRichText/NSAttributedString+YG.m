//
//  NSAttributedString+YG.m
//  YGRichTextDemo
//
//  Created by DaverZhou on 2021/5/18.
//  Copyright © 2021 DaverZhou. All rights reserved.
//

#import "NSAttributedString+YG.h"

@implementation NSAttributedString (YG)
- (CGSize)yg_size {
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                              options:NSStringDrawingUsesLineFragmentOrigin
                              context:nil].size;
}

- (CGFloat)yg_widthByMaxHeight:(CGFloat)maxHeight {
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, maxHeight)
                              options:NSStringDrawingUsesLineFragmentOrigin
                              context:nil].size.width;
}

- (CGFloat)yg_heightByMaxWidth:(CGFloat)maxWidth {
    return [self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)
                              options:NSStringDrawingUsesLineFragmentOrigin
                              context:nil].size.height;
}

@end
