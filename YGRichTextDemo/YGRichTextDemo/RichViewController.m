//
//  RichViewController.m
//  YGRichTextDemo
//
//  Created by 周永桂 on 2020/8/27.
//  Copyright © 2020 周永桂. All rights reserved.
//

#import "RichViewController.h"
#import "YGRichText.h"

@interface RichViewController ()
@property (nonatomic, strong) NSString *string;

@end

@implementation RichViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.whiteColor];

    self.string = @"How to use YGRichText, let it show attributed text in view. ";
            
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 100, 300, 300)];
    [textView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [textView setFont:[UIFont systemFontOfSize:15]];
    [textView setEditable:NO];
    [self.view addSubview:textView];

    textView.attributedText = [self.string yg_makeAttributed:^(YGAttributedMaker *make) {
        // 字体
        make.font([UIFont systemFontOfSize:17]).allRange();
        // 文字颜色
        make.foregroundColor(UIColor.redColor).allRange();
        // 删除线
        make.strikethroughStyle(4).yg_inRange(0, 3);
        // 下划线
        make.underlineStyle(4).underlineColor(UIColor.blueColor).allRange();
        // 字体描边
        make.strokeWidth(4).strokeColor(UIColor.blackColor).ofString(@"YGRichText");
        // 对齐方式
        make.textAlignment(NSTextAlignmentCenter).kern(10).lineSpacing(10).lineBreakMode(NSLineBreakByCharWrapping).allRange();
        // 插入图片
        make.insertLeadImage([UIImage imageNamed:@"image name"], CGRectMake(0, -2, 15, 15));
        // 尾部插入图片
        make.insertTrailImage([UIImage imageNamed:@"image name"], CGRectMake(0, -2, 15, 15));
        
        // 获取关键字区间
        NSArray *rangs = [self.string yg_getRangesInStringWithKeyworld:@"YGRichText"];
        [rangs enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSRange range = [obj yg_getRangeFromString];
            // 插入图片，则loc 加 1
            range = NSMakeRange(range.location + 1, range.length);
            make.foregroundColor([UIColor blackColor]).kern(0).inRange(range);
        }];
        
        // 拼接字符串
        make.appendString(@"need append string");

    }];
    
    // 根据富文本获取高度
    CGFloat maxHeight = [textView.attributedText yg_heightByMaxWidth:self.view.bounds.size.width - 40];
    textView.frame = CGRectMake(20, 100, self.view.bounds.size.width - 40, maxHeight);
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(20, 20, 50, 30)];
    [backButton setTitleColor:UIColor.blackColor forState:0];
    [backButton setTitle:@"返回" forState:0];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    
    NSString *titleString = @"中国人民aasjdklfajl啊再擦发热器要投入沪电股份不是大方";
    
    int num = [titleString yg_getCharacterNumWithMaxWidth:300 font:[UIFont systemFontOfSize:15]];
    NSLog(@"yg_getCharacterNumWithMaxWidth:%d", num);
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 500, 300, 20)];
    [titleLabel setBackgroundColor:UIColor.redColor];
    [titleLabel setFont:[UIFont systemFontOfSize:15]];
    [titleLabel setTextColor:[UIColor blackColor]];
    [titleLabel setText:[titleString substringToIndex:num]];
    [self.view addSubview:titleLabel];

}

- (void)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"释放了~~~~~");
}


@end
