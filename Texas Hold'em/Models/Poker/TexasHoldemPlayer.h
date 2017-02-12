//
//  TexasHoldemPlayer.h
//  Texas Hold'em
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Hand, PokerHand;

@interface TexasHoldemPlayer : NSObject;

@property (nonatomic, strong) Hand *privateHand;



- (instancetype)initWithName:(NSString *)name;
- (PokerHand *)bestHandWithBoardCards:(NSArray *)cards;

@end
