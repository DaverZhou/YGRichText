//
//  YGAttributedMaker.h
//  YGRichTextDemo
//
//  Created by DaverZhou on 2020/8/27.
//  Copyright © 2020 DaverZhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGAttributedMaker : NSObject
/// 初始化
/// @param string 字符串
- (instancetype)initWithString:(NSString *)string;
/// 富文本
- (NSMutableAttributedString *)result;


#pragma mark 链式调用后必须调用区间
/// 字体
- (YGAttributedMaker *(^)(UIFont *value))font;

/// 斜体
- (YGAttributedMaker *(^)(CGFloat value))italic;

/// 文字颜色
- (YGAttributedMaker *(^)(UIColor *value))foregroundColor;

/// 设置背景颜色
- (YGAttributedMaker *(^)(UIColor *value))backgroundColor;

/// 删除线高度
- (YGAttributedMaker *(^)(NSInteger value))strikethroughStyle;

/// 删除线颜色
- (YGAttributedMaker *(^)(UIColor *value))strikethroughColor;

/// 下滑线粗度
- (YGAttributedMaker *(^)(NSInteger value))underlineStyle;

/// 下滑线颜色
- (YGAttributedMaker *(^)(UIColor *value))underlineColor;

/// 字体描边宽度
- (YGAttributedMaker *(^)(CGFloat value))strokeWidth;

/// 字体描边颜
- (YGAttributedMaker *(^)(UIColor *value))strokeColor;

/// 字体阴影
- (YGAttributedMaker *(^)(NSShadow *value))shadow;

/// 字间距
- (YGAttributedMaker *(^)(CGFloat value))kern;

/// 行间距：同个range在调用range后，再设置lineBreakMode、textAlignment 会互相覆盖
- (YGAttributedMaker *(^)(CGFloat value))lineSpacing;

/// 对齐方式：同个range在调用range后，再设置lineBreakMode、lineSpacing 会互相覆盖
- (YGAttributedMaker *(^)(NSTextAlignment value))textAlignment;

/// 字符截断类型：同个range在调用range后，再设置textAlignment、lineSpacing 会互相覆盖
- (YGAttributedMaker *(^)(NSLineBreakMode value))lineBreakMode;

/// 设置URL跳转 UITextView才有效，UILabel和UITextField里面无效
- (YGAttributedMaker *(^)(NSString *value))link;


#pragma mark Insert Image
/// 起始插入图片(图片，尺寸，位置)
- (YGAttributedMaker *(^)(UIImage *image, CGRect bounds))insertLeadImage;

/// 尾部插入图片(图片，尺寸，位置)
- (YGAttributedMaker *(^)(UIImage *image, CGRect bounds))insertTrailImage;

/// 插入图片(图片，尺寸，位置)
- (YGAttributedMaker *(^)(UIImage *image, CGRect bounds, NSInteger index))insertImage;


#pragma mark append string
/// 拼接string
- (YGAttributedMaker *(^)(NSString *string))appendString;

/// 合并
- (YGAttributedMaker *)mergeStrings;


#pragma mark 区间
/// 区间
- (YGAttributedMaker *(^)(NSUInteger loc, NSUInteger len))yg_inRange;

/// 区间
- (YGAttributedMaker *(^)(NSString *value))ofString;

/// 区间
- (YGAttributedMaker *(^)(NSRange range))inRange;

/// 区间
- (YGAttributedMaker *(^)(void))allRange;


@end

NS_ASSUME_NONNULL_END
