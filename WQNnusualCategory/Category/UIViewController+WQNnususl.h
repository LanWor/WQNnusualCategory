//
//  UIViewController+WCTeamNnususl.h
//  MGWorldCupTeam
//
//  Created by 王泉 on 2018/5/25.
//  Copyright © 2018年 com.wander.MGshipin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (WQNnususl)
/**
 点击重试后的回调
 */
@property (nonatomic, copy) dispatch_block_t unusualClickblock;

/**
 显示默认配置的信息（message：加载失败，请点击重试  image：wifi图标上面一个惊叹号）
 */
- (void)showWQUnusualDefault;

/**
 请求失败或者加载数据失败在controller.view上显示的提示界面
 
 @param message 可不传，默认：加载失败，请点击重试
 @param imageName 提示错误的对应图片,可不传，默认：wifi图标上面一个惊叹号
 */
- (void)showWQUnusualMessage:(NSString *)message
          unusualImageName:(NSString *)imageName;

/**
 @param superView unusualView依附的view
 */
- (void)showWQUnusualMessage:(NSString *)message
              unusualImageName:(NSString *)imageName
                     superView:(UIView *)superView
              isNeedcontentSet:(BOOL)isNeedcontentSet;

- (void)showWQUnusualMessage:(NSString *)message
         unusualImageNameArray:(nullable NSArray *)imageNameArray;
/**
 remove掉该提示界面
 */
- (void)removeUnusualView;
@end
