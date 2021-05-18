//
//  NSAttributedString+YG.h
//  YGRichTextDemo
//
//  Created by DaverZhou on 2021/5/18.
//  Copyright © 2021 DaverZhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (YG)

/// 计算富文本size
/// Calculate the size
- (CGSize)yg_size;

/// 根据传入的高度计算富文本所需的最大宽度
/// Calculates the width of the attributedString based on its maximum height
- (CGFloat)yg_widthByMaxHeight:(CGFloat)maxHeight;

/// 根据传入的宽度计算富文本所需的最大高度
/// Calculates the height of the attributedString based on its maximum width
- (CGFloat)yg_heightByMaxWidth:(CGFloat)maxWidth;


@end

