//
//  PokerHand.m
//  Texas Hold'em
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import "PokerHand.h"
#import "Card.h"

@interface PokerHand ()

@end

@implementation PokerHand

- (instancetype)initWithCards:(NSArray *)cards {
    NSAssert(cards.count == 5, @"Poker hands must be five cards");
    
    self.handType = [self checkPokerHandType:cards];
    return [super initWithCards:cards];
}



#pragma - Poker Hand Checking methods
- (PokerHandType)checkPokerHandType:(NSArray *)cards {
    // exception check
    if (cards.count!=5) {
        NSLog(@"Error: Illegal hand size");
        return -1;
    }
    
    // check hands from highest to lowest best hand
    // Straight flush - straight and flush
    if ([self isStraightFlush:cards]) {
        return PokerHandTypeStraightFlush;
    }
    // 4 of a kind - 4 of same rank
    else if ([self isNum:4 OfAKind:cards]) {
        NSLog(@"is 4 of a kind");
        return PokerHandTypeFourOfAKind;
    }
    // Full house - a pair of a rank and 3 of another rank
    else if ([self isFullHouse:cards]){
        return PokerHandTypeFullHouse;
    }
    // Flush - all same suit
    else if ([self isFlush:cards]) {
        return PokerHandTypeFlush;
        
    }
    // Straight - consecutive ranks
    else if ([self isStraight:cards]) {
        return PokerHandTypeStraight;
    }
    // 3 of a kind - 3 of same rank
    else if ([self isNum:3 OfAKind:cards]) {
        NSLog(@"is 3 of a kind");
        return PokerHandTypeThreeOfAKind;
    }
    // 2 pairs
    else if ([self isTwoPairs:cards]) {
        return PokerHandTypeTwoPair;
    }
    // Pair
    else if ([self isAPair:cards]) {
        return PokerHandTypeOnePair;
    }
    // High card
    else {
        return PokerHandTypeHighCard;
    }
}

- (BOOL)isStraightFlush:(NSArray *)cards {
    return ([self isStraight:cards] && [self isFlush:cards]);
}


- (BOOL)isNum:(int)cardRepeat OfAKind:(NSArray *)cards {
    int sameRankCards = 1;
    
    NSArray *sortedCards = [cards sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"rank" ascending:YES]]];
    
    for (Card *c in sortedCards) {
        sameRankCards=1;
        for (Card *c2 in sortedCards) {
            // if not the same card
            if (c2!=c) {
                // if same rank, increment
                if (c2.rank==c.rank) {
                    sameRankCards++;
                }
            }
        }
        if (sameRankCards==cardRepeat) {
            return YES;
        }
    }
    
    return sameRankCards==cardRepeat;
}

- (BOOL)isFullHouse:(NSArray *)cards {
    
    return ([self isNum:2 OfAKind:cards] && [self isNum:3 OfAKind:cards]);
}

- (BOOL)isFlush:(NSArray *)cards {
    int numOfClubs = 0;
    int numOfSpades = 0;
    int numOfHearts = 0;
    int numOfDiamonds = 0;
    for (Card *c in cards) {
        switch (c.suit) {
            case CardSuitClubs:
                numOfClubs++;
                break;
            case CardSuitSpades:
                numOfSpades++;
                break;
            case CardSuitHearts:
                numOfHearts++;
                break;
            case CardSuitDiamonds:
                numOfDiamonds++;
                break;
                
            default:
                break;
        }
    }
    
    return (numOfClubs==5 || numOfSpades==5 || numOfHearts==5 || numOfDiamonds==5);
}

- (BOOL)isStraight:(NSArray *)cards {
    
    int numConsCards = 1;
    NSArray *sortedCards = [cards sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"rank" ascending:YES]]];
    
    for (int i =0; i<sortedCards.count-1; i++) {
        Card *curCard = sortedCards[i];
        Card *nextCard = sortedCards[i+1];
        if(curCard.rank == nextCard.rank-1) {
            numConsCards++;
        }
        else{
            numConsCards=1;
        }
    }
    
    return numConsCards==5;
}

- (BOOL)isTwoPairs:(NSArray *)cards {
    int countingRank = 1;
    int sameRankCards = 0;
    int numOfPairs=0;
    
    NSArray *sortedCards = [cards sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"rank" ascending:YES]]];
    for (Card *c in sortedCards) {
        if (countingRank!=c.rank) {
            countingRank=c.rank;
            sameRankCards=0;
            for (Card *c2 in cards) {
                // if not the same card
                if (c2!=c) {
                    // if same rank, increment
                    if (c2.rank==c.rank) {
                        sameRankCards++;
                        if (sameRankCards==2) {
                            numOfPairs++;
                            sameRankCards=0;
                        }
                    }
                }
            }
        }
        else {
            sameRankCards++;
            if (sameRankCards==2) {
                numOfPairs++;
                sameRankCards=0;
            }
            
        }
        
    }
    
    return numOfPairs==2;
    
}

- (BOOL)isAPair:(NSArray *)cards {
    return [self isNum:2 OfAKind:cards];
}

#pragma - other private methods
- (NSComparisonResult)compare:(PokerHand *)other {
    if (other.handType>self.handType) {
        return NSOrderedAscending;
    }
    else if (other.handType<self.handType){
        return NSOrderedDescending;
    }
    else{
        NSArray *sortedSelf = [self.cards sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"rank" ascending:NO]]];
        NSArray *sortedOther =[other.cards sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"rank" ascending:NO]]];
        
        
        if ((self.handType == PokerHandTypeFourOfAKind) || (self.handType == PokerHandTypeThreeOfAKind) || (self.handType == PokerHandTypeOnePair)|| (self.handType == PokerHandTypeFullHouse) || (self.handType == PokerHandTypeTwoPair)) {
            
            
            // put rank into countedSet to get frequency of occurence of cards
            NSCountedSet *csSelf = [NSCountedSet new];
            NSMutableDictionary *selfCardFreqDict = [[NSMutableDictionary alloc] init];
            for (Card *c in self.cards) {
                [csSelf addObject:[Card rankToString:c.rank]];
            }
            for (Card *c in self.cards) {
                int newCount = [csSelf countForObject:[Card rankToString:c.rank]];
                [selfCardFreqDict setObject:c forKey:[NSString stringWithFormat:@"%i", newCount]];
            }
            
            NSCountedSet *csOther = [NSCountedSet new];
            NSMutableDictionary *otherCardFreqDict = [[NSMutableDictionary alloc] init];
            for (Card *c in other.cards) {
                [csOther addObject:[Card rankToString:c.rank]];
            }
            for (Card *c in other.cards) {
                int newCount = [csOther countForObject:[Card rankToString:c.rank]];
                [otherCardFreqDict setObject:c forKey:[NSString stringWithFormat:@"%i", newCount]];
            }
            
            
            
            // sort frequency dict
            NSArray *keys = [selfCardFreqDict allKeys];
            NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(localizedCompare:)];
            NSArray *sortedKeys = [keys sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
            
            
            
            
            
            // compare based on highest frequency cards -> lowest frequency cards
            for (NSString* key in sortedKeys) {
                NSLog(@"key: %@", key);
                Card *selfCard = [selfCardFreqDict objectForKey:key];
                Card *otherCard =[otherCardFreqDict objectForKey:key];
                if(otherCard.rank>selfCard.rank)
                    return NSOrderedAscending;
                else if (otherCard.rank<selfCard.rank)
                    return NSOrderedDescending;
                else {
                    
                }
            }
            
            
        }
        else {
            for (int i = 0; i<self.cards.count; i++) {
                Card *selfCard = [sortedSelf objectAtIndex:i];
                Card *otherCard = [sortedOther objectAtIndex:i];
                if(otherCard.rank>selfCard.rank)
                    return NSOrderedAscending;
                else if (otherCard.rank<selfCard.rank)
                    return NSOrderedDescending;
            }
        }
        return NSOrderedSame;
    }
}

@end
