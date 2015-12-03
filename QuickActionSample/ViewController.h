//
//  ViewController.h
//  QuickActionSample
//
//  Created by minjoonkim on 2015. 12. 3..
//  Copyright © 2015년 minjoongkim. All rights reserved.
//

#import <UIKit/UIKit.h>

// protocol
@protocol protocolTestDelegate <NSObject>

- (void)callParentControll:(BOOL)question;

@end


@interface ViewController : UIViewController <UIViewControllerPreviewingDelegate, protocolTestDelegate>

@property (nonatomic, strong) IBOutlet UIImageView *image1;
@property (nonatomic, strong) IBOutlet UIImageView *image2;

@end

