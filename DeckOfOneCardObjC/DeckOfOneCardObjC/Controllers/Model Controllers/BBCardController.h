//
//  BBCardController.h
//  DeckOfOneCardObjC
//
//  Created by Bethany Wride on 10/7/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBCard.h"
#import <UIKit/UIKit.h>

@interface BBCardController : NSObject

// Similar to singleton/static constant
+ (BBCardController *)sharedController;

// Return void, called drawNewCard, takes in type NSInt called numberOfCards and completions with block pointer
- (void)drawNewCard:(NSInteger)numberOfCards completion:(void (^) (NSArray <BBCard *> *))completion;

- (void)fetchImageFromCard:(BBCard *)card completion:(void (^)(UIImage *))completion;

@end

