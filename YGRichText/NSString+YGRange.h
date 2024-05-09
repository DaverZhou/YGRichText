//
//  NSString+YGRange.h
//  YGRichTextDemo
//
//  Created by DaverZhou on 2021/5/18.
//  Copyright © 2021 DaverZhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YGRange)

/// 根据关键字符串计算字符串中的 所有rangs 数组，
/// Get Rangs by key world in string. return [NSValue(Range), NSValue(Range)] array.
- (NSArray *)yg_getRangesInStringWithKeyworld:(NSString *)keyworld;

/// 根据固定长度计算可显示字符串中多少个字
/// Calculates how many words in a string can be displayed based on a fixed length
- (int)yg_getCharacterNumWithMaxWidth:(CGFloat)maxWidth font:(UIFont *)font;




@end

NS_ASSUME_NONNULL_END
