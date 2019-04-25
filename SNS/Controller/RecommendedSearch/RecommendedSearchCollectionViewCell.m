//
//  RecommendedSearchCollectionViewCell.m
//  SNS
//
//  Created by Apple on 11/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "RecommendedSearchCollectionViewCell.h"

@implementation RecommendedSearchCollectionViewCell

- (IBAction)selectedBtnAction:(id)sender {
    if(self.selectedCity){
        self.selectedCity();
    }
}
@end
