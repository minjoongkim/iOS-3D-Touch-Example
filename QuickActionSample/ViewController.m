//
//  ViewController.m
//  QuickActionSample
//
//  Created by minjoonkim on 2015. 12. 3..
//  Copyright © 2015년 minjoongkim. All rights reserved.
//

#import "ViewController.h"
#import "DetailImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize image1;

- (void)viewDidLoad {
    [super viewDidLoad]; 
    
    //forcetouch add.
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self registerForPreviewingWithDelegate:self sourceView:self.image1];
        [self registerForPreviewingWithDelegate:self sourceView:self.image2];
    }
    else {
        NSLog(@"ForceTouch not available. use LongPress...");
    }
    
}

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

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self presentViewController:viewControllerToCommit animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)pressButton1:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"Actioin1View"];
    
    [self presentViewController:view animated:TRUE completion:nil];
}


// protocol method
- (void)callParentControll:(BOOL)question
{
    
    //CREATE AN ALERT DIALOG WITH ACTIONS
    if(question) {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Quiz"
                                      message:@"Right answer."
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        [alert addAction:ok]; // add action to uialertcontroller
        
        [self presentViewController:alert animated:YES completion:nil];
    }else {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Quiz"
                                      message:@"It is wrong answer."
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        [alert addAction:ok]; // add action to uialertcontroller
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

/*
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
*/
@end
