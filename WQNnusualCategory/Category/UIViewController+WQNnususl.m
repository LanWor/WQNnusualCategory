//
//  UIViewController+WCTeamNnususl.m
//  MGWorldCupTeam
//
//  Created by 王泉 on 2018/5/25.
//  Copyright © 2018年 com.wander.MGshipin. All rights reserved.
//

#import "UIViewController+WQNnususl.h"
#import <objc/runtime.h>
#import "Masonry.h"
#define kScreenHeight     [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth      [[UIScreen mainScreen] bounds].size.width
//是否是iPhoneX
#define isIphoneX  kScreenHeight == 812 ? 1 : 0
@interface UIViewController ()
@property (nonatomic, strong) UIView *unusualView;
@property (nonatomic, strong) UILabel *unusualLabel;
@property (nonatomic, strong) UIButton *unusualresetButton;
@property (nonatomic, strong) UIImageView *unusualImageView;
@end

@implementation UIViewController (WQNnususl)
- (void)showWQUnusualDefault {
    [self showWQUnusualMessage:@"加载失败，请点击重试" unusualImageName:@"MGPublicUI_noWifi"];
}

- (void)showWQUnusualMessage:(NSString *)message
              unusualImageName:(NSString *)imageName {
    [self showWQUnusualMessage:message
                unusualImageName:imageName
                       superView:self.view
                isNeedcontentSet:NO];
}

- (void)showWQUnusualMessage:(NSString *)message
              unusualImageName:(NSString *)imageName
                     superView:(UIView *)superView
              isNeedcontentSet:(BOOL)isNeedcontentSet{
    if (message == nil || message.length == 0) {
        message = @"加载失败，请点击重试";
    }
    if (imageName == nil || imageName.length == 0) {
        imageName = @"MGPublicUI_noWifi";
    }
    if (!superView) {
        superView = self.view;
    }
    self.unusualView.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1.0];
    [superView addSubview:self.unusualView];
    
    self.unusualLabel.text = message;
    self.unusualLabel.textAlignment = NSTextAlignmentCenter;
    self.unusualLabel.font = [UIFont systemFontOfSize:13];
    self.unusualLabel.textColor = [UIColor colorWithRed:76/255.0f green:76/255.0f blue:76/255.0f alpha:1.0];
    [self.unusualView addSubview:self.unusualLabel];
    
    self.unusualImageView.image = [UIImage imageNamed:imageName];
    [self.unusualView addSubview:self.unusualImageView];
    
    [self.unusualView addSubview:self.unusualresetButton];
    
    [self layoutTeamUI:superView isNeedcontentSet:isNeedcontentSet];
}

- (void)showWQUnusualMessage:(NSString *)message
         unusualImageNameArray:(nullable NSArray *)imageNameArray {
    if (message == nil || message.length == 0) {
        message = @"暂无数据";
    }
    if (imageNameArray == nil || imageNameArray.count == 0) {
        return;
    }
    
    NSMutableArray *imgArray = [NSMutableArray array];
    for (int i = 0; i < imageNameArray.count; i++) {
        UIImage *image = [UIImage imageNamed:imageNameArray[i]];
        [imgArray addObject:image];
    }
    //把存有UIImage的数组赋给动画图片数组
    self.unusualImageView.animationImages = imgArray;
    //设置执行一次完整动画的时长
    self.unusualImageView.animationDuration = imageNameArray.count * 0.15;
    //动画重复次数 （0为重复播放）
    self.unusualImageView.animationRepeatCount = 0;
    //开始播放动画
    [self.unusualImageView startAnimating];
}

- (UIView *)unusualView {
    UIView *view = objc_getAssociatedObject(self, _cmd);
    if (!view) {
        view = [[UIView alloc] init];
        self.unusualView = view;
    }
    return view;
}

- (void)setUnusualView:(UIView *)unusualyView {
    objc_setAssociatedObject(self, @selector(unusualView), unusualyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)unusualLabel {
    UILabel *label = objc_getAssociatedObject(self, _cmd);
    if (!label) {
        label = [[UILabel alloc] init];
        self.unusualLabel = label;
    }
    return label;
}

- (void)setUnusualLabel:(UILabel *)unusualyLabel {
    objc_setAssociatedObject(self, @selector(unusualLabel), unusualyLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIButton *)unusualresetButton {
    UIButton *btn = objc_getAssociatedObject(self, _cmd);
    if (!btn) {
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(teamClick) forControlEvents:UIControlEventTouchUpInside];
        self.unusualresetButton = btn;
    }
    return btn;
}

- (void)setUnusualresetButton:(UIButton *)resetButton {
    objc_setAssociatedObject(self, @selector(unusualresetButton), resetButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImageView *)unusualImageView {
    UIImageView *imageView = objc_getAssociatedObject(self, _cmd);
    if (!imageView) {
        imageView = [[UIImageView alloc] init];
        self.unusualImageView = imageView;
    }
    return imageView;
}

- (void)setUnusualImageView:(UIImageView *)unusualyImageView {
    objc_setAssociatedObject(self, @selector(unusualImageView), unusualyImageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (dispatch_block_t)unusualClickblock {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setUnusualClickblock:(dispatch_block_t)unusualyClickblock {
    objc_setAssociatedObject(self, @selector(unusualClickblock), unusualyClickblock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)layoutTeamUI:(UIView *)superView  isNeedcontentSet:(BOOL)isNeedcontentSet {
    CGSize size = self.unusualImageView.image.size;
    CGFloat topToStatus;
    if (isNeedcontentSet) {
        if (isIphoneX) {
            topToStatus = 88.0;
        } else {
            topToStatus = 64.0;
        }
    } else {
        topToStatus = 0;
    }
    self.unusualView.frame = CGRectMake(0, topToStatus, self.view.frame.size.width, self.view.frame.size.height - topToStatus);
    self.unusualLabel.frame = CGRectMake(0, 0, self.unusualView.frame.size.width, 21);
    self.unusualLabel.center = CGPointMake(self.unusualView.center.x, self.unusualView.center.y + 30);
    
    self.unusualImageView.frame = CGRectMake(0, 0, size.width, size.height);
    self.unusualImageView.center = CGPointMake(self.unusualView.center.x, self.unusualLabel.center.y - size.height/2 - 20);
    self.unusualresetButton.frame = self.unusualView.frame;
    
    //    [self.mg_pb_UI_TeamunusualView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(superView).offset(topToStatus);
    //        make.left.right.bottom.equalTo(superView);
    //    }];
    //
    //    [self.mg_pb_UI_TeamunusualLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerX.mas_equalTo(self.mg_pb_UI_TeamunusualView);
    //        make.centerY.mas_equalTo(self.mg_pb_UI_TeamunusualView.mas_centerY).with.offset(30);
    //    }];
    //
    //    [self.mg_pb_UI_TeamunusualImageView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerX.mas_equalTo(self.mg_pb_UI_TeamunusualLabel);
    //        make.centerY.mas_equalTo(self.mg_pb_UI_TeamunusualLabel.mas_centerY).with.offset(-(size.height/2 + 20));
    //    }];
    //
    //    [self.mg_pb_UI_TeamresetButton mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.equalTo(self.mg_pb_UI_TeamunusualView);
    //    }];
}

- (void)teamClick {
    if (self.unusualClickblock) {
        self.unusualClickblock();
    }
}

- (void)removeUnusualView {
    [self.unusualView removeFromSuperview];
    self.unusualView = nil;
    self.unusualLabel = nil;
    self.unusualImageView = nil;
    self.unusualresetButton = nil;
}
@end
