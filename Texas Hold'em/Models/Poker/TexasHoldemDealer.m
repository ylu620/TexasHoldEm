//
//  TexasHoldemDealer.m
//  Texas Hold'em
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import "TexasHoldemDealer.h"

#import "Deck.h"
#import "Card.h"
#import "Hand.h"
#import "TexasHoldemPlayer.h"

@interface TexasHoldemDealer ()

@property (nonatomic, strong) Deck *dealerDeck;
@property (nonatomic, strong) Hand *dealerBoard;

@end

@implementation TexasHoldemDealer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dealerDeck = [Deck new];
        self.dealerBoard = [[Hand alloc] initWithCards:@[]];
        [self.dealerDeck shuffle];
    }
    return self;
}

- (Deck *)deck {
    
    return self.dealerDeck;
}

- (Hand *)board {
    return self.dealerBoard;
}

- (void)dealToPlayers:(NSArray *)players{
    
    for (TexasHoldemPlayer *p in players) {
        [p.privateHand.cards addObject:self.dealerDeck.drawCard];
        [p.privateHand.cards addObject:self.dealerDeck.drawCard];
    }
}

- (void)flop {
    // burn 1 card and deal 3 cards to the board
    [self.dealerDeck.cards removeObject:self.dealerDeck.cards.firstObject];
    for (int i = 0 ; i<3; i++) {
        [self.dealerBoard.cards addObject:self.dealerDeck.drawCard];
    }
    
    
}
- (void)turn {
    [self.dealerDeck.cards removeObject:self.dealerDeck.cards.firstObject];
    [self.dealerBoard.cards addObject:self.dealerDeck.drawCard];
    
    
}
- (void)river {
    // not sure what the difference is between river and turn? Assumed they are the same
    [self.dealerDeck.cards removeObject:self.dealerDeck.cards.firstObject];
    [self.dealerBoard.cards addObject:self.dealerDeck.drawCard];
}

@end
