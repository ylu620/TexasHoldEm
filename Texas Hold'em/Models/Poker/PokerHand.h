//
//  PokerHand.h
//  Texas Hold'em
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import "Hand.h"

typedef NS_ENUM(NSInteger, PokerHandType)
{
  PokerHandTypeHighCard = 0,
  PokerHandTypeOnePair = 1,
  PokerHandTypeTwoPair = 2,
  PokerHandTypeThreeOfAKind = 3,
  PokerHandTypeStraight = 4,
  PokerHandTypeFlush = 5,
  PokerHandTypeFullHouse = 6,
  PokerHandTypeFourOfAKind = 7,
  PokerHandTypeStraightFlush = 8
};

@interface PokerHand : Hand

@property (nonatomic, assign) PokerHandType handType;

- (PokerHandType)checkPokerHandType:(NSArray *)cards;
    
- (NSComparisonResult)compare:(PokerHand *)other;

@end
