//
//  MyCollectionViewCell.h
//  SEAMCodingChallenge
//
//  Created by Kashyap Bhatt on 31/05/19.
//  Copyright © 2019 Kashyap Bhatt. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UIView *backVirew;

@end

NS_ASSUME_NONNULL_END
