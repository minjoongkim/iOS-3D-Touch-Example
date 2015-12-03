//
//  DetailImageViewController.h
//  QuickActionSample
//
//  Created by minjoonkim on 2015. 12. 3..
//  Copyright © 2015년 minjoongkim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DetailImageViewController : UIViewController

// protocol
@property (nonatomic, assign) id<protocolTestDelegate> _delegate;

@property (nonatomic, strong) IBOutlet UIImageView *mainImageView;
@property (nonatomic) int imageTag;
@end
