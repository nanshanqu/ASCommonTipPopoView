//
//  ViewController.m
//  ASCommonTipPopoView
//
//  Created by Mac on 2020/4/29.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "ASCommonTipPopoView.h"

@interface ViewController ()

/// 纯文本提示
@property (nonatomic, strong) UIButton * clickButton;

/// 提示信息icon
@property (nonatomic, strong) UIButton * clickTipButton;

/// 错误提示信息icon
@property (nonatomic, strong) UIButton * clickErrorButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)setupUI {
    
    CGSize buttonSize = CGSizeMake(200, 40);
    CGFloat marginY = 30;
    
    [self.view addSubview:self.clickButton];
    [self.clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(buttonSize);
    }];
    
    [self.view addSubview:self.clickTipButton];
    [self.clickTipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.clickButton.mas_bottom).offset(marginY);
        make.size.mas_equalTo(buttonSize);
    }];
    
    [self.view addSubview:self.clickErrorButton];
    [self.clickErrorButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.clickTipButton.mas_bottom).offset(marginY);
        make.size.mas_equalTo(buttonSize);
    }];
}

#pragma mark- function

- (void)clickButtonAction {
    
    [ASCommonTipPopoView showCommonTipPopoViewWithMessage:@"请输入您的昵称！"];
}

- (void)clickTipButtonAction {
    
    [ASCommonTipPopoView showCommonTipPopoViewWithTipMessage:@"请检查您的网络，谢谢！"];
}

- (void)clickErrorButtonAction {
    
    [ASCommonTipPopoView showCommonTipPopoViewWithErrorMessage:@"密码输入错误，请重新输入！密码输入错误，请重新输入！"];
}

#pragma mark- lazying

- (UIButton *)clickButton {
    if (!_clickButton) {
        _clickButton = [[UIButton alloc] init];
        [_clickButton setTitle:@"纯文本提示" forState:UIControlStateNormal];
        _clickButton.backgroundColor = [UIColor blueColor];
        [_clickButton addTarget:self action:@selector(clickButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clickButton;
}

- (UIButton *)clickTipButton {
    if (!_clickTipButton) {
        _clickTipButton = [[UIButton alloc] init];
        [_clickTipButton setTitle:@"带icon提示" forState:UIControlStateNormal];
        _clickTipButton.backgroundColor = [UIColor blueColor];
        [_clickTipButton addTarget:self action:@selector(clickTipButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clickTipButton;
}

- (UIButton *)clickErrorButton {
    if (!_clickErrorButton) {
        _clickErrorButton = [[UIButton alloc] init];
        [_clickErrorButton setTitle:@"带错误icon提示" forState:UIControlStateNormal];
        _clickErrorButton.backgroundColor = [UIColor blueColor];
        [_clickErrorButton addTarget:self action:@selector(clickErrorButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clickErrorButton;
}


@end
