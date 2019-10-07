//
//  BBCard.m
//  DeckOfOneCardObjC
//
//  Created by Bethany Wride on 10/7/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import "BBCard.h"

@implementation BBCard

- (instancetype)initWithCardSuit:(NSString *)suit image:(NSString *)image
{
    // Initialize the superclass; close ] autocomplete, opening ( autocomplete
    self = [super init];
    if (self)
    {
        _suit = suit;
        _image = image;
    }
    // Return a card initialized
    return self;
}

@end

@implementation BBCard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    // Initialize card with dictionary
    NSString * suit = dictionary[@"suit"];
    NSString * image = dictionary[@"image"];
    
    // Return the initailized card from passed in dictionary
    return [self initWithCardSuit:suit image:image];
}

@end
