//
//  Deck.h
//  Texas Hold'em
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;

@interface Deck : NSObject

@property (nonatomic, strong) NSMutableArray *cards;
@property (readonly) BOOL isEmpty;

- (void)shuffle;

- (Card *)drawCard;

@end
