//
//  DetailImageViewController.m
//  QuickActionSample
//
//  Created by minjoonkim on 2015. 12. 3..
//  Copyright © 2015년 minjoongkim. All rights reserved.
//

#import "DetailImageViewController.h"
#import "ViewController.h"
@interface DetailImageViewController ()

@end

@implementation DetailImageViewController

@synthesize mainImageView, imageTag;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [mainImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", imageTag]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//add previewActionItem
- (NSArray <id <UIPreviewActionItem>> *)previewActionItems
{
    if(imageTag == 1) {
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
    } else if(imageTag == 2) {
        UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Soccer" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
            [self._delegate callParentControll:FALSE];
        }];
        UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"BasketBall" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
            [self._delegate callParentControll:FALSE];
        }];
        UIPreviewAction *action3_1 = [UIPreviewAction actionWithTitle:@"BaseBall" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
            [self._delegate callParentControll:TRUE];
        }];
        UIPreviewAction *action3_2 = [UIPreviewAction actionWithTitle:@"VolleyBall" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
            [self._delegate callParentControll:FALSE];
        }];
        UIPreviewActionGroup *action3 = [UIPreviewActionGroup actionGroupWithTitle:@"More" style:UIPreviewActionStyleDestructive actions:@[action3_1, action3_2]];
        
        return @[action1, action2, action3];
    }
    
    return nil;
    
}

@end
