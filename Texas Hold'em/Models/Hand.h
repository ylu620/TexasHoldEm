//
//  Hand.h
//  Texas Hold'em
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Deck;

@interface Hand : NSObject

@property (nonatomic, strong) NSMutableArray *cards;

- (instancetype)initWithCards:(NSArray *)cards;

// returns number of cards that were drawn
- (NSUInteger)drawCards:(NSUInteger)numCards
               fromDeck:(Deck *)deck;

@end
