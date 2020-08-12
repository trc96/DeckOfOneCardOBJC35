//
//  DVMCardController.m
//  DeckOfOneCardOBJC35
//
//  Created by Todd Crandall on 8/11/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

#import "DVMCardController.h"
#import "DVMCard.h"

//https://deckofcardsapi.com/api/deck/new/draw/?count=1

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/draw/?count=1";
//static NSString * const countQuery = @"count";

@implementation DVMCardController

+(instancetype)sharedController
{
    static DVMCardController * sharedController = nil;
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken, ^{
        sharedController = [DVMCardController new];
    });
    
    return sharedController;
}

//-(void)drawANewCard:(NSNumber *)drawCount completion:(void (^)(NSArray<DVMCard * > *))completion
-(void)drawANewCard:(void (^)(NSArray<DVMCard * > *))completion
{
    NSURL * finalURL = [NSURL URLWithString:baseURLString];
//    NSURLComponents * components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
//
//    NSString * cardCount = [drawCount stringValue];
//    NSURLQueryItem * drawCardQuery = [NSURLQueryItem queryItemWithName:countQuery value:cardCount];
//    components.queryItems = @[drawCardQuery];
//    NSURL * finalURL = components.URL;
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching Card from draw count: %@", error);
            completion(nil); return;
        }
        
        if (!data) {
            NSLog(@"Error fetching Card DATA from draw count: %@", error);
            completion(nil); return;
        }
        
        NSDictionary * JSONDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (!JSONDictionary || ![JSONDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Error fetching and decoding the JSON Dictionary");
            completion(nil); return;
        }
        
        NSArray * cardDictionaryArray = JSONDictionary[@"cards"];
        NSMutableArray * cardsPlaceHolder = [NSMutableArray new];
        
        for (NSDictionary * cardDictionary in cardDictionaryArray) {
            DVMCard * newCard = [[DVMCard alloc] initWithDictionary:cardDictionary];
            [cardsPlaceHolder addObject:newCard];
        }
        completion(cardsPlaceHolder);
    }] resume];
}

-(void)fetchCardImage:(DVMCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL * imageURL = [NSURL URLWithString:card.image];
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching image for Card from draw count: %@", error);
            completion(nil); return;
        }
        
        if (!data) {
            NSLog(@"Error fetching Card image DATA from draw count: %@", error);
            completion(nil); return;
        }
        UIImage * cardImage = [UIImage imageWithData:data];
        completion(cardImage);
    }] resume];
}

@end
