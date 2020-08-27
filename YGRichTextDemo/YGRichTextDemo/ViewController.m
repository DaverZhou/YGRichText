//
//  ViewController.m
//  YGRichTextDemo
//
//  Created by DaverZhou on 2020/8/27.
//  Copyright © 2020 DaverZhou. All rights reserved.
//

#import "ViewController.h"
#import "YGRichText.h"
#import "RichViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)goToRichViewController:(id)sender {
    RichViewController *rich = [[RichViewController alloc] init];
    rich.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:rich animated:YES completion:nil];
}

@end
