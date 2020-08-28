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

    self.string = @"need append string";
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 50, self.view.bounds.size.width - 100, 300)];
    [self.view addSubview:textView];

    textView.attributedText = [self.string yg_makeAttributed:^(YGAttributedMaker *make) {
        make.font([UIFont systemFontOfSize:17]).allRange();
        make.foregroundColor(UIColor.redColor).allRange();
        make.strikethroughStyle(4).allRange();
        make.underlineStyle(4).underlineColor(UIColor.blueColor).allRange();
        make.strokeWidth(4).strokeColor(UIColor.blackColor).allRange();
        make.textAlignment(NSTextAlignmentCenter).kern(10).lineSpacing(10).lineBreakMode(NSLineBreakByCharWrapping).allRange();
        make.appendString(self.string);
    }];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(20, 20, 50, 30)];
    [backButton setTitleColor:UIColor.blackColor forState:0];
    [backButton setTitle:@"返回" forState:0];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}

- (void)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"释放了~~~~~");
}


@end
