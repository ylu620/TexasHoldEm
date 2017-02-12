//
//  TexasHoldemDealer.m
//  Texas Hold'em
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "TexasHoldemDealer.h"
#import "TexasHoldemPlayer.h"
#import "Deck.h"
#import "Hand.h"

@interface TexasHoldemDealerTests : XCTestCase
@property (nonatomic, strong) TexasHoldemDealer *dealer;
@property (nonatomic, strong) TexasHoldemPlayer *player1;
@property (nonatomic, strong) TexasHoldemPlayer *player2;
@end

@implementation TexasHoldemDealerTests

- (void)setUp {
  [super setUp];
  self.dealer = [[TexasHoldemDealer alloc] init];
  self.player1 = [[TexasHoldemPlayer alloc] init];
  self.player2 = [[TexasHoldemPlayer alloc] init];
}

- (void)testInit {
  // it should start them with a normal deck and an empty board
  XCTAssertEqual(self.dealer.board.cards.count, 0);
  XCTAssertEqual(self.dealer.deck.cards.count, 52);
}

- (void)testDeal {
  // it should be shuffled by the time it is dealing
  XCTAssertNotEqualObjects(self.dealer.deck.cards, [Deck new].cards);

  // it should deal two cards to each hand
  [self.dealer dealToPlayers:@[self.player1, self.player2]];
  XCTAssertEqual(self.player1.privateHand.cards.count, 2);
  XCTAssertEqual(self.player2.privateHand.cards.count, 2);
  XCTAssertEqual(self.dealer.deck.cards.count, 48);
}

- (void)testFlop {
  // it should burn a card then deal three cards to the board
  [self.dealer flop];
  XCTAssertEqual(self.dealer.board.cards.count, 3);
  XCTAssertEqual(self.dealer.deck.cards.count, 48);
}

- (void)testTurn {
  [self.dealer flop];

  // it should burn a card then deal a card to the board
  [self.dealer turn];
  XCTAssertEqual(self.dealer.board.cards.count, 4);
  XCTAssertEqual(self.dealer.deck.cards.count, 46);
}

- (void)testRiver {
  [self.dealer flop];
  [self.dealer turn];

  // it should burn a card then deal a card to the board
  [self.dealer river];
  XCTAssertEqual(self.dealer.board.cards.count, 5);
  XCTAssertEqual(self.dealer.deck.cards.count, 44);
}

@end
