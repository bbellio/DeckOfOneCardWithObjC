//
//  BBCardController.m
//  DeckOfOneCardObjC
//
//  Created by Bethany Wride on 10/7/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import "BBCardController.h"

@implementation BBCardController

// Returns a single instance of BBCardController in memory called sharedController - singleton
+ (BBCardController *)sharedController
{
    // Creates the singleton - create it one time and never create it again
    // Checks to make sure the sharedController doesn't exist
    static BBCardController * sharedController = nil;
    // Calls the dispatchOnceThread
    static dispatch_once_t onceToken;
    // Dipspatches once with the onceToken; onceToken will receive a value once it runs - ensures it only runs once; block is the completion handler
    dispatch_once(&onceToken, ^{
        // Assignes new BBCardController allocated in memory and initialized
        sharedController = [BBCardController new];
    });
    return sharedController;
}

// BaseURL
static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new";

- (void)drawNewCard:(NSInteger)numberOfCards completion:(void (^)(NSArray<BBCard *> *))completion
{
    // Setting URL to baseURL
    NSURL * url = [NSURL URLWithString:baseURLString];
    // String value for query
    NSString * cardCount = [@(numberOfCards) stringValue];
    // Need to use a name
    NSURL * drawURl = [url URLByAppendingPathComponent:@"draw/"];
    NSURLComponents * urlComponents = [NSURLComponents componentsWithURL:drawURl resolvingAgainstBaseURL:true];
    NSURLQueryItem * queryItem = [NSURLQueryItem queryItemWithName:@"count" value:cardCount];
    urlComponents.queryItems = @[queryItem];
    // No need to unwrap components or finalURL because a non-optional URL is returned
    NSURL * finalURL = urlComponents.URL;
    
    // dataTask and JSON Serialization
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            // %@ is a placeholder for the things following the end of the string literal - i.e. string interpolation; pretty function (readable printed) is the function where the crash happened
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            
        }
        if (response)
        {
            // Prints response
            NSLog(@"%@", response);
        }
        if (data)
        {
            // 2 is like .allowfragments; &error references the same place in memory
            NSDictionary * topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing JSON %@", error);
                completion(nil);
                return;
            }
            
            NSArray * cardsArray = topLevelDictionary[@"cards"];
            NSMutableArray * cardPlaceholder = [NSMutableArray new];
            
            for (NSDictionary * dictionary in cardsArray)
            {
                BBCard * card = [[BBCard alloc] initWithDictionary:dictionary];
                [cardPlaceholder addObject:card];
            }
            completion(cardPlaceholder);
        }
    }]resume];
}

- (void)fetchImageFromCard:(BBCard *)card completion:(void (^)(UIImage *))completion
{
    NSURL * imageURL = [NSURL URLWithString:card.image];
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error: %@, %@", error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            UIImage * image = [UIImage imageWithData:data];
            completion(image);
        }
    }] resume];
}
@end
