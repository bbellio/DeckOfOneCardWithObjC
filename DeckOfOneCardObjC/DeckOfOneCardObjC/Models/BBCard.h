//
//  BBCard.h
//  DeckOfOneCardObjC
//
//  Created by Bethany Wride on 10/7/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBCard : NSObject

// Declare a property
// Readonly = let; nonmutable
// NSString is the type
// * is pointer in memory (for classes); if it's a primitive type instead, it doesn't get a pointer in memory
// after * is name
@property (nonatomic, copy, readonly) NSString * suit;
@property (nonatomic, copy, readonly) NSString * image;

// Hyphen/minus a regular function, + is a static func
// (return) inside of paranethesis
// extenralName; (type *) internalName
- (instancetype)initWithCardSuit:(NSString *) suit
                           image:(NSString *) image;

@end

@ interface BBCard (JSONConvertable)

// id is primitive type without pointer, dictionary requries pointer
- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *) dictionary;

@end

NS_ASSUME_NONNULL_END
