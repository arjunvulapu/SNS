//
//  RecommendedSearchCollectionViewCell.h
//  SNS
//
//  Created by Apple on 11/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecommendedSearchCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UIImageView *selectedImage;
@property (weak, nonatomic) IBOutlet UILabel *areaname;
- (IBAction)selectedBtnAction:(id)sender;
@property(nonatomic) void (^selectedCity)();
@end

NS_ASSUME_NONNULL_END
