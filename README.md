# JKCountDownButton
This is a customized count down button class for time counting down<br>

To import source code:<br>
Directly drag `JKCountDownButton.h` and `JKCountDownButton.m` fils into your project<br>

To initiate the button: <br>
* 1. you can either drag a default UI button in view controller in storyboard, then customize button through attributes inspector after set the button class to JKCountDownButton<br>
* 2. you can initiated button through codes as well. Simply calls `initWithFrame` or `initWithFrame: totalTime: defaultButtonTitle: postfix:` to add the button to your view from code.<br><br>

Property description:<br>
* `totalCountDownTime` : Total seconds to count down<br>
* `postfix` : String appended after time. (e.g. '30 s', 's' is postfix for count down button. By default, 's' is postfix)<br>

```Object c
[button startcounting]
```
