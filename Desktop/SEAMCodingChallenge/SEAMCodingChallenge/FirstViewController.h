//
//  FirstViewController.h
//  SEAMCodingChallenge
//
//  Created by Kashyap Bhatt on 31/05/19.
//  Copyright © 2019 Kashyap Bhatt. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;

@property NSMutableArray * collectionViewArray;
@end

NS_ASSUME_NONNULL_END
