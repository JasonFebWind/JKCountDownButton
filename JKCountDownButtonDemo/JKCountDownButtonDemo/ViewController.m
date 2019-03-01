//
//  ViewController.m
//  JKCountDownButtonDemo
//
//  Created by 李锴 on 2019/3/1.
//  Copyright © 2019 李锴. All rights reserved.
//

#import "ViewController.h"
#import "JKCountDownButton.h"
@interface ViewController ()<JKCountDownButtonDelegate>

@property (weak, nonatomic) IBOutlet JKCountDownButton *countDownButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view, typically from a nib.
}

/**
 @method
 @abstract - initiate UI components
 */
-(void)initUI{
    [self.countDownButton addTarget:self action:@selector(triggerCountDown) forControlEvents:UIControlEventTouchUpInside];
    self.countDownButton.delegate = self;
}

//trigger count down button start counting
-(void)triggerCountDown{
    [self.countDownButton startCounting];
}
//trigger count down button loading
-(void)triggerLoading{
    [self.countDownButton startLoading];
}
//trigger count down button to stop loading
-(void)endLoading{
    [self.countDownButton stopLoading];
}
//trigger count down button to stop counting
-(void)endCountingDown{
    [self.countDownButton reset];
}


#pragma mark JKCountDownButtonDelegate method
-(void)countDownButtonDidCompleteCounting{
    NSLog(@"Counting has completed");
    //Do further actions ...
}

@end
