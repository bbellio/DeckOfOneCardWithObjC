//
//  BBCardControllerViewController.m
//  DeckOfOneCardObjC
//
//  Created by Bethany Wride on 10/7/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import "BBCardControllerViewController.h"
#import "BBCardController.h"
#import "BBCard.h"

@interface BBCardControllerViewController ()

@end

@implementation BBCardControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)DrawNewButtonTapped:(UIButton *)sender {
    [BBCardController.sharedController drawNewCard:1 completion:^(NSArray<BBCard *> * cardArray) {
        [BBCardController.sharedController fetchImageFromCard:cardArray[0] completion:^(UIImage * image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.cardImageView.image = image;
                BBCard * card = cardArray[0];
                self.suitLabel.text = card.suit;
            });
        }];
    }];
}
@end
