//
//  BBCardControllerViewController.h
//  DeckOfOneCardObjC
//
//  Created by Bethany Wride on 10/7/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBCardControllerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *suitLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;
- (IBAction)DrawNewButtonTapped:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
