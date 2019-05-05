//
//  JKCountDownButton.h
//  JKCountDownButton
//
//  Created by 李锴 on 2019/2/26.
//  Copyright © 2019 LiKai. All rights reserved.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN
@protocol JKCountDownButtonDelegate <NSObject>

@required-(void)countDownButtonDidCompleteCounting;

@end

IB_DESIGNABLE
@interface JKCountDownButton : UIButton

@property id<JKCountDownButtonDelegate> delegate;

/**for count down time postfix. example: 60 s    "s" is the count down postfix
   if not set, "s" is the default postfix
 **/
@property (nonatomic) IBInspectable NSString *postfix;
@property (nonatomic) IBInspectable NSString *mainTitle;
//total time to count down
@property (nonatomic, assign) IBInspectable int totalCountDownTime;
//layer corner radius
@property (nonatomic, assign) IBInspectable CGFloat  cornerRadius;
//for button background color
@property (nonatomic) IBInspectable UIColor *counting_bgColor;
@property (nonatomic) IBInspectable UIColor *disabled_bgColor;
@property (nonatomic) IBInspectable UIColor *normal_bgColor;
@property (nonatomic) IBInspectable UIColor *loading_bgColor;
//for button title label color
@property (nonatomic) IBInspectable UIColor *counting_text_color;
@property (nonatomic) IBInspectable UIColor *normal_text_color;

//init method
-(instancetype)initWithFrame:(CGRect)frame totalTime:(int)time defaultButtonTitle:(NSString *)title postfix:(NSString *)postfix;

//methods for loading mode (optional).
-(void)startLoading;
-(void)stopLoading;
//methods for counting mode (main).
-(void)startCounting;
-(void)reset;
//methods for status checking
-(BOOL)countDownIsInProgress;
-(BOOL)loadingIsInProgress;
@end

NS_ASSUME_NONNULL_END
