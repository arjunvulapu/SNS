//
//  RentItemCollectionViewCell.h
//  SNS
//
//  Created by Apple on 26/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RentItemCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *cat_image;
@property (weak, nonatomic) IBOutlet UILabel *cat_title;

@end

NS_ASSUME_NONNULL_END
