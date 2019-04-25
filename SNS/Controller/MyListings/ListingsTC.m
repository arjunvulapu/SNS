//
//  ListingsTC.m
//  SNS
//
//  Created by Apple on 24/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "ListingsTC.h"

@implementation ListingsTC

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _backView.layer.cornerRadius=10;
    _backView.clipsToBounds=YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
