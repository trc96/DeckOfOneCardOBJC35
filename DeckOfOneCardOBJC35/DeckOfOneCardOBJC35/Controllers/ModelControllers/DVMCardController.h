//
//  DVMCardController.h
//  DeckOfOneCardOBJC35
//
//  Created by Todd Crandall on 8/11/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DVMCard;

NS_ASSUME_NONNULL_BEGIN

@interface DVMCardController : NSObject

+(instancetype)sharedController;

//-(void)drawANewCard:(NSNumber *)drawCount
//         completion:(void(^) (NSArray<DVMCard * > * cards))completion;
-(void)drawANewCard:(void(^) (NSArray<DVMCard * > * cards))completion;


-(void)fetchCardImage:(DVMCard *)card
           completion:(void(^)(UIImage * image))completion;

@end

NS_ASSUME_NONNULL_END
