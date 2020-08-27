//
//  NSString+YGAttributed.h
//  YGRichTextDemo
//
//  Created by DaverZhou on 2020/8/27.
//  Copyright © 2020 DaverZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YGAttributedMaker;

@interface NSString (YGAttributed)

/// 富文本
/// @param block YGAttributedMaker
- (NSMutableAttributedString *)yg_makeAttributed:(void(^)(YGAttributedMaker *make))block;

@end

