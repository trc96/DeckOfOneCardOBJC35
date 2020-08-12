//
//  DVMCard.h
//  DeckOfOneCardOBJC35
//
//  Created by Todd Crandall on 8/11/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMCard : NSObject

@property (nonatomic, copy) NSString * suit;
@property (nonatomic,copy) NSString * cardValue;
@property (nonatomic, copy) NSString * image;

-(instancetype) initWithSuit:(NSString *)suit
                   cardValue:(NSString *)cardvalue
                       image:(NSString *)image
NS_DESIGNATED_INITIALIZER;

@end

@interface DVMCard (JSONConvertable)

- (instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
