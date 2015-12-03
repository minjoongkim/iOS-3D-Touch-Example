# [iOS]3D-Touch-Example
3D Touch Example

1. ShotCutItem Add
2. ForceTouch
3. ForceTouchPowerCheck

##1.ShotCutItem Add
![Screenshot](Screenshot1.PNG)

icon - https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIApplicationShortcutIcon_Class/index.html#//apple_ref/c/tdef/UIApplicationShortcutIconType

###1. Info.plist
```objective-c

<key>UIApplicationShortcutItems</key>
<array>
<dict>
<key>UIApplicationShortcutItemTitle</key>
<string>Action1</string>
<key>UIApplicationShortcutItemType</key>
<string>com.action1</string>
<key>UIApplicationShortcutItemIconType</key>
<string>UIApplicationShortcutIconTypeConfirmation</string>
</dict>
</array>

```


###2. Add Code
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //shortcutitem add
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"com.action2" localizedTitle:@"Action2" localizedSubtitle:@"title2" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove] userInfo:nil];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"com.action3" localizedTitle:@"Action3" localizedSubtitle:@"title3" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCloud] userInfo:nil];
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc] initWithType:@"com.action4" localizedTitle:@"Action4" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeTask] userInfo:nil];

    [[UIApplication sharedApplication] setShortcutItems: @[ item1, item2, item3 ]];

    return YES;
}
```


###3. ShortCutItem Start Delegate
```objective-c
//shortcutitem start delegate
- (void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler {
    NSLog(@"%@", [shortcutItem description]);
}

```


##2. ForceTouch
![Screenshot](Screenshot2.PNG)

###1. register for 3D Touch
```objective-c
if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
    [self registerForPreviewingWithDelegate:self sourceView:self.image1];
    [self registerForPreviewingWithDelegate:self sourceView:self.image2];
}
else {
    NSLog(@"ForceTouch not available. use LongPress...");
}
```

###2. implement UIViewControllerPreviewingDelegate

```objective-c
@interface ViewController : UIViewController <UIViewControllerPreviewingDelegate>
```

```objective-c
// forcetouch item peek
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    DetailImageViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailImageView"];
    vc.preferredContentSize = CGSizeMake(0, 300);
    vc._delegate = self;
    if(previewingContext.sourceView.tag == 1) {
    vc.imageTag = 1;
    }else if(previewingContext.sourceView.tag == 2) {
    vc.imageTag = 2;
    }
    previewingContext.sourceRect = CGRectMake(0, 0, previewingContext.sourceView.frame.size.width, previewingContext.sourceView.frame.size.height);
    return vc;
}
```

```objective-c
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self presentViewController:viewControllerToCommit animated:YES completion:nil];
}
```

###3. Preview Menu
DetailImageViewController.m

```objective-c
//add previewActionItem
- (NSArray <id <UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Soccer" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
    [self._delegate callParentControll:TRUE];
    }];
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"BasketBall" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
    [self._delegate callParentControll:FALSE];
    }];
    UIPreviewAction *action3_1 = [UIPreviewAction actionWithTitle:@"BaseBall" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
    [self._delegate callParentControll:FALSE];
    }];
    UIPreviewAction *action3_2 = [UIPreviewAction actionWithTitle:@"VolleyBall" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
    [self._delegate callParentControll:FALSE];
    }];
    UIPreviewActionGroup *action3 = [UIPreviewActionGroup actionGroupWithTitle:@"More" style:UIPreviewActionStyleDestructive actions:@[action3_1, action3_2]];

    return @[action1, action2, action3];
}

```


##3. ForceTouchPowerCheck

###Source
```objective-c
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *t = touches.anyObject;

    NSLog(@"touchesBegan : %f / %f", t.force, t.maximumPossibleForce);
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *t = touches.anyObject;

    NSLog(@"touchesMoved : %f / %f", t.force, t.maximumPossibleForce);
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *t = touches.anyObject;

    NSLog(@"touchesEnded : %f / %f", t.force, t.maximumPossibleForce);
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *t = touches.anyObject;

    NSLog(@"touchesCancelled : %f / %f", t.force, t.maximumPossibleForce);
}


```