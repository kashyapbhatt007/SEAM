//
//  FirstViewController.m
//  SEAMCodingChallenge
//
//  Created by Kashyap Bhatt on 31/05/19.
//  Copyright © 2019 Kashyap Bhatt. All rights reserved.
//

#import "FirstViewController.h"
@import Firebase;
#import "MyCollectionViewCell.h"
@interface FirstViewController ()

@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    
    self.mainCollectionView.transform = CGAffineTransformMakeRotation(M_PI);
    _collectionViewArray=[[NSMutableArray alloc]init];
    
    _ref= [[FIRDatabase database] reference];
    
    [[[_ref child:@"Chat"] child:@"119"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
     {
         if (![snapshot.value isKindOfClass:[NSNull class]])
         {
             NSMutableDictionary * oneDict=[[[NSMutableDictionary alloc]initWithDictionary:snapshot.value] mutableCopy];
             
             NSArray * allKeys=[oneDict allKeys];
             
             for (int k=0;k<allKeys.count;k++)
             {
                 NSMutableDictionary * oneDictToAdd=[[oneDict objectForKey:[allKeys objectAtIndex:k]] mutableCopy];
                 
                 [self->_collectionViewArray addObject:oneDictToAdd];
             }
             
             [self->_mainCollectionView reloadData];
         }
     }];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_collectionViewArray count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UILabel * mylabel=[[UILabel alloc]initWithFrame:CGRectZero];
    mylabel.text=[[_collectionViewArray objectAtIndex:indexPath.row]objectForKey:@"message"];
    [mylabel sizeToFit];
    
    NSLog(@"%f",mylabel.frame.size.width);
    
    return CGSizeMake(mylabel.frame.size.width+40, 42);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
        MyCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
        if (cell==nil)
        {
            cell=[[MyCollectionViewCell alloc]init];
        }
        
    cell.label1.text=[[NSString alloc]initWithFormat:@"%ld. %@",(long)indexPath.row+1,[[_collectionViewArray objectAtIndex:indexPath.row]objectForKey:@"message"]];
    
    cell.transform = CGAffineTransformMakeRotation(M_PI);
    
    cell.backVirew.layer.cornerRadius=10;
    cell.backVirew.clipsToBounds=YES;
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
