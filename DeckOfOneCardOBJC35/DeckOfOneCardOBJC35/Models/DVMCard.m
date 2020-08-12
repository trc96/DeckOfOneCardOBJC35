//
//  DVMCard.m
//  DeckOfOneCardOBJC35
//
//  Created by Todd Crandall on 8/11/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

#import "DVMCard.h"

@implementation DVMCard

- (instancetype)initWithSuit:(NSString *)suit cardValue:(NSString *)cardvalue image:(NSString *)image
{
    if (self = [super init]) {
        _suit = suit;
        _cardValue = cardvalue;
        _image = image;
    }
    return self;
}
- (instancetype)init
{
    return [self initWithSuit:@"" cardValue:@"" image:@""];
}

@end


@implementation DVMCard (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * suit = dictionary[@"suit"];
    NSString * cardValue = dictionary[@"value"];
    NSString * image = dictionary[@"image"];
    
    return [self initWithSuit:suit cardValue:cardValue image:image];
}

@end
