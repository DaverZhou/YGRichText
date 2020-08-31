//
//  YGAttributedMaker.m
//  YGRichTextDemo
//
//  Created by DaverZhou on 2020/8/27.
//  Copyright © 2020 DaverZhou. All rights reserved.
//

#import "YGAttributedMaker.h"

@interface YGAttributedMaker ()
/// 字符串数组
@property (nonatomic, strong) NSMutableArray<NSString *> *strings;
/// 富文本数组
@property (nonatomic, strong) NSMutableArray<NSMutableAttributedString *> *attributedStrings;
/// 当前链的富文本
@property (nonatomic, strong) NSMutableDictionary<NSAttributedStringKey, id> *attributeds;
/// 段落
@property (nonatomic, strong) NSMutableParagraphStyle *style;

@end

@implementation YGAttributedMaker

- (instancetype)initWithString:(NSString *)string {
    self = [super init];
    if (self) {
        // 初始化
        self.strings = [NSMutableArray array];
        self.attributedStrings = [NSMutableArray array];
        self.attributeds = [NSMutableDictionary dictionary];
        
        // string
        [self.strings addObject:string];
        
        // 富文本
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
        [self.attributedStrings addObject:attributedString];

    }
    return self;
}

- (NSMutableAttributedString *)result {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    [self.attributedStrings enumerateObjectsUsingBlock:^(NSMutableAttributedString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [attributedString appendAttributedString:obj];
    }];
    return attributedString;
}

#pragma mark Public
/// 字体
- (YGAttributedMaker *(^)(UIFont *value))font {
    return ^id(UIFont *value) {
        [self addAttributedWithKey:NSFontAttributeName value:value];
        return self;
    };
}

/// 斜体
- (YGAttributedMaker *(^)(CGFloat value))italic {
    return ^id(CGFloat value) {
        [self addAttributedWithKey:NSObliquenessAttributeName value:@(value)];
        return self;
    };
}

/// 设置文字颜色
- (YGAttributedMaker *(^)(UIColor *value))foregroundColor {
    return ^id(UIColor *value) {
        [self addAttributedWithKey:NSForegroundColorAttributeName value:value];
        return self;
    };
}

/// 设置背景颜色
- (YGAttributedMaker *(^)(UIColor *value))backgroundColor {
    return ^id(UIColor *value) {
        [self addAttributedWithKey:NSBackgroundColorAttributeName value:value];
        return self;
    };
}

/// 删除线高度
- (YGAttributedMaker *(^)(NSInteger value))strikethroughStyle {
    return ^id(NSInteger value) {
        [self addAttributedWithKey:NSStrikethroughStyleAttributeName value:@(value)];
        return self;
    };
}

/// 删除线颜色
- (YGAttributedMaker *(^)(UIColor *value))strikethroughColor {
    return ^id(UIColor *value) {
        [self addAttributedWithKey:NSStrikethroughColorAttributeName value:value];
        return self;
    };
}

/// 下滑线粗度
- (YGAttributedMaker *(^)(NSInteger value))underlineStyle {
    return ^id(NSInteger value) {
        [self addAttributedWithKey:NSUnderlineStyleAttributeName value:@(value)];
        return self;
    };
}

/// 下滑线颜色
- (YGAttributedMaker *(^)(UIColor *value))underlineColor {
    return ^id(UIColor *value) {
        [self addAttributedWithKey:NSUnderlineColorAttributeName value:value];
        return self;
    };
}

/// 字体描边宽度
- (YGAttributedMaker *(^)(CGFloat value))strokeWidth {
    return ^id(CGFloat value) {
        [self addAttributedWithKey:NSStrokeWidthAttributeName value:@(value)];
        return self;
    };
}

/// 字体描边颜
- (YGAttributedMaker *(^)(UIColor *value))strokeColor {
    return ^id(UIColor *value) {
        [self addAttributedWithKey:NSStrokeColorAttributeName value:value];
        return self;
    };
}

/// 字体阴影
- (YGAttributedMaker *(^)(NSShadow *value))shadow {
    return ^id(NSShadow *value) {
        [self addAttributedWithKey:NSShadowAttributeName value:value];
        return self;
    };
}

/// 字间距
- (YGAttributedMaker *(^)(CGFloat value))kern {
    return ^id(CGFloat value) {
        [self addAttributedWithKey:NSKernAttributeName value:@(value)];
        return self;
    };
}

/// 行间距
- (YGAttributedMaker *(^)(CGFloat value))lineSpacing {
    return ^id(CGFloat value) {
        if (!self.style) {
            self.style = [NSMutableParagraphStyle new];
        }
        self.style.lineSpacing = value;
        [self addAttributedWithKey:NSParagraphStyleAttributeName value:self.style];
        return self;
    };
}

/// 对齐方式
- (YGAttributedMaker *(^)(NSTextAlignment value))textAlignment {
    return ^id(NSTextAlignment value) {
        if (!self.style) {
            self.style = [NSMutableParagraphStyle new];
        }
        self.style.alignment = value;
        [self addAttributedWithKey:NSParagraphStyleAttributeName value:self.style];
        return self;
    };
}

/// 字符截断类型
- (YGAttributedMaker *(^)(NSLineBreakMode value))lineBreakMode {
    return ^id(NSLineBreakMode value) {
        if (!self.style) {
            self.style = [NSMutableParagraphStyle new];
        }
        self.style.lineBreakMode = value;
        [self addAttributedWithKey:NSParagraphStyleAttributeName value:self.style];
        return self;
    };
}

/// 设置URL跳转 UITextView才有效，UILabel和UITextField里面无效
- (YGAttributedMaker *(^)(NSString *value))link {
    return ^id(NSString *value) {
        [self addAttributedWithKey:NSLinkAttributeName value:[NSURL URLWithString:value]];
        return self;
    };
}

/// 插入图片
- (YGAttributedMaker *(^)(UIImage *image, CGRect bounds, NSInteger index))insertImage {
    return ^id(UIImage *image, CGRect bounds, NSInteger index) {
        // 图标
        NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
        textAttachment.image = image;
        textAttachment.bounds = bounds;
        //
        NSAttributedString *tempAttributed = [NSAttributedString attributedStringWithAttachment:textAttachment];
        NSMutableAttributedString *attributedString = self.attributedStrings.lastObject;
        [attributedString insertAttributedString:tempAttributed atIndex:index];

        return self;
    };
}

/// 拼接字符串
- (YGAttributedMaker *(^)(NSString *string))appendString {
    return ^id(NSString *string) {
        if (string) {
            [self.strings addObject:string];
            [self.attributedStrings addObject:[[NSMutableAttributedString alloc] initWithString:string]];
        }
        return self;
    };
}

/// 合并
- (YGAttributedMaker *)mergeStrings {
    __block  NSString *string = @"";
    [self.strings enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        string = [string stringByAppendingString:obj];
    }];
    [self.strings removeAllObjects];
    [self.strings addObject:string];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    [self.attributedStrings enumerateObjectsUsingBlock:^(NSMutableAttributedString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [attributedString appendAttributedString:obj];
    }];
    [self.attributedStrings removeAllObjects];
    [self.attributedStrings addObject:attributedString];
    return self;
}

/// 区间
- (YGAttributedMaker *(^)(NSUInteger loc, NSUInteger len))yg_inRange {
    return ^id(NSUInteger loc, NSUInteger len) {
        [self compositionToAttributedWithRange:NSMakeRange(loc, len)];
        return self;
    };
}

/// 区间
- (YGAttributedMaker *(^)(NSRange range))inRange {
    return ^id(NSRange range) {
        [self compositionToAttributedWithRange:range];
        return self;
    };
}

/// 总的区间
- (YGAttributedMaker *(^)(void))allRange {
    return ^id(void) {
        NSString *string = self.strings.lastObject;
        NSRange range = NSMakeRange(0, string.length);
        [self compositionToAttributedWithRange:range];
        return self;
    };
}

#pragma mark Private
- (void)addAttributedWithKey:(NSAttributedStringKey)attributedKey value:(id)value {
    if (attributedKey && value) {
        [self.attributeds setObject:value forKey:attributedKey];
    }
}

- (void)compositionToAttributedWithRange:(NSRange)range {
    NSMutableAttributedString *attributedString = self.attributedStrings.lastObject;
    NSAssert((range.location + range.length) <= attributedString.string.length, @"YGRichText set range can‘t beyond the string‘s length, you should check range!");
    [self.attributeds enumerateKeysAndObjectsUsingBlock:^(NSAttributedStringKey  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [attributedString addAttribute:key value:obj range:range];
    }];
    self.style = nil;
    [self.attributeds removeAllObjects];
}


@end
