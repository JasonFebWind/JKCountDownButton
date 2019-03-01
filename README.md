# JKCountDownButton
This is a customized count down button class for time counting down<br>

To import source code:<br>
Directly drag `JKCountDownButton.h` and `JKCountDownButton.m` fils into your project<br>

To initiate the button: <br>
* 1. you can either drag a default UI button in view controller in storyboard, then customize button through attributes inspector after set the button class to JKCountDownButton<br>
* 2. you can initiated button through codes as well. Simply calls `initWithFrame` or `initWithFrame: totalTime: defaultButtonTitle: postfix:` to add the button to your view from code.<br><br>

## Property description
* `totalCountDownTime` : total seconds to count down.<br>
* `postfix` : string appended after time. (e.g. '30 s', 's' is postfix for count down button. By default, 's' is postfix)<br>
* `counting_bgColor` : button background color when counting started.<br>
* `disabled_bgColor` : button disabled status background color.<br>
* `normal_bgColor` : button normal status color.<br>
* `loading_bgColor` : button' background color when enters loading status.<br>
* `counting_text_color` : button's titleLabel text color when in counting progress.<br>
* `normal_text_color` : button's titleLabel text color when in normal status.<br>

## Public methods (besides UIButton general methods)
* `-(void)startLoading` : trigger count down button to enter loading mode. It can be used to indicate things like waiting for sever response.
* `-(void)stopLoading` : trigger count down button to stop loading. (e.g. Called when client receive server response)
* `-(void)startCounting` : trigger count down button to enter counting mode.
* `-(void)reset` : reset count down button.
* `-(BOOL)countDownIsInProgress` : query for button count down status. true if it is in progress of counting.
* `-(BOOL)loadingIsInProgress` : query for button loading status. True if it is in loading mode.

## Callback (Delegate)
A delegate method will be called as a callback when counting progress completes. `-(void)countDownButtonDidCompleteCounting`<br>

```Object c
import JKCountDownButton.h
```
