//
//  TexasHoldemDealer.h
//  Texas Hold'em
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Deck, Hand;

@interface TexasHoldemDealer : NSObject

@property (readonly) Deck *deck;
@property (readonly) Hand *board;

- (void)dealToPlayers:(NSArray *)players;

- (void)flop;
- (void)turn;
- (void)river;

@end
