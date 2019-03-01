//
//  JKCountDownButton.m
//  JKCountDownButton
//
//  Created by 李锴 on 2019/2/26.
//  Copyright © 2019 LiKai. All rights reserved.
//

#import "JKCountDownButton.h"

@interface JKCountDownButton()

//Activity indicator view for loading view
@property (nonatomic) UIActivityIndicatorView *indicatorView;
//BOOL to indicate counting status
@property (nonatomic) BOOL isCounting;
//BOOL to indicate loading status
@property (nonatomic) BOOL isLoading;
//timestamp mark for counting start
@property (nonatomic) long startTimestamp;
//count timer that loops counting
@property (nonatomic) NSTimer *countTimer;
@end


@implementation JKCountDownButton

-(void)awakeFromNib{
    [super awakeFromNib];
    [self initUI];
}

//Init
-(instancetype)initWithFrame:(CGRect)frame totalTime:(int)time defaultButtonTitle:(NSString *)title postfix:(NSString *)postfix{
    if(self = [super initWithFrame:frame]){
        self.totalCountDownTime = time;
        self.mainTitle = title;
        self.postfix = postfix;
        [self initUI];
    }
    return self;
}

/**
 @method
 @abstract - initiated UI components
 */
-(void)initUI{
    if(!self.mainTitle)
        self.mainTitle = NSLocalizedString(self.currentTitle, nil);
    if(!self.normal_bgColor)
        self.normal_bgColor = self.backgroundColor;
    self.titleLabel.font = [UIFont fontWithName:@"Helvtica" size:15];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
}

/**
 @method
 @abstract - overide setter for corner radius
 */
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

/**
 @method
 @abstract - returns current counting status
 @return BOOL
 */
-(BOOL)countDownIsInProgress{
    return self.isCounting;
}

/**
 @method
 @abstract - returns current loading status
 @return BOOL
 */
-(BOOL)loadingIsInProgress{
    return self.isLoading;
}

/**
 @method
 @abstract - start counting time
 */
-(void)startCounting{
    if(self.counting_bgColor)
        [self setBackgroundColor:self.counting_bgColor];
    if(self.counting_text_color)
        [self setTitleColor:_counting_text_color forState:UIControlStateNormal];
    self.enabled = false;
    [self.countTimer invalidate];
    self.isCounting = true;
    self.countTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countTime) userInfo:nil repeats:true];
    self.startTimestamp = (long)[[NSDate date] timeIntervalSince1970];
}

/**
 @method
 @abstract - start to count time
 */
-(void)countTime{
    if(self.isCounting){
        //calculate time interval
        long currentTimestamp = (long)[[NSDate date] timeIntervalSince1970];
        long secondsToEnd = self.totalCountDownTime - (currentTimestamp - self.startTimestamp);
        if(secondsToEnd <= 0){
            [self reset];
            return;
        }
        
        self.postfix=(_postfix==nil)?@"s":_postfix;
        [self setTitle:[NSString stringWithFormat:@"%lu %@",secondsToEnd,self.postfix] forState:UIControlStateNormal];
        return;
    }
    
}

/**
 @method
 @abstract - called to perform loading animation: Default iOS activity indicator view
 */
-(void)startLoading{
    self.isLoading = true;
    [self setEnabled:false];
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:self.bounds];
    if(self.loading_bgColor)
        self.indicatorView.backgroundColor = self.loading_bgColor;
    else
        self.indicatorView.backgroundColor = UIColor.lightGrayColor;
    self.indicatorView.alpha = 0;
    [self addSubview:self.indicatorView];
    [UIView animateWithDuration:0.3 animations:^{
        self.indicatorView.alpha = 1;
    }];
    [self.indicatorView startAnimating];
}

/**
 @method
 @abstract - stop loading animation;
 */
-(void)stopLoading{
    self.isLoading = false;
    [self setEnabled:true];
    [self.indicatorView stopAnimating];
}

/**
 @method
 @abstract - complete counting for given time interval
 */
-(void)completeCounting{
    self.isCounting = false;
    [self.delegate countDownButtonDidCompleteCounting];
}

/**
 @method
 @abstract - recover button style to inital status
 */
-(void)recoverUI{
    if(self.normal_bgColor)
        [self setBackgroundColor:self.normal_bgColor];
    if(self.normal_text_color)
        [self setTitleColor:self.normal_text_color forState:UIControlStateNormal];
    if(self.mainTitle)
        [self setTitle:self.mainTitle forState:UIControlStateNormal];
}

/**
 @method
 @abstract - used to reset timer;
 */
-(void)reset{
    self.enabled = true;
    self.isCounting = false;
    [self.countTimer invalidate];
    [self recoverUI];
    
}

/**
 @method
 @abstract - overide setter for enabled
 */
-(void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    if(!self.enabled){
        if(self.disabled_bgColor)
            [self setBackgroundColor:_disabled_bgColor];
    }else{
        if(self.normal_bgColor)
            [self setBackgroundColor:_normal_bgColor];
    }
}


@end
