//
//  ViewController.m
//  GoodnightMoon
//
//  Created by Sherrie Jones on 1/23/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "RootViewController.h"
#import "ImageCollectionViewCell.h"

@interface RootViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *shadeView;
@property NSMutableArray *moonImagesarray;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.moonImagesarray = [[NSMutableArray alloc] init];
    [self.moonImagesarray addObject:[UIImage imageNamed:@"moon_1"]];
    [self.moonImagesarray addObject:[UIImage imageNamed:@"moon_2"]];
    [self.moonImagesarray addObject:[UIImage imageNamed:@"moon_3"]];
    [self.moonImagesarray addObject:[UIImage imageNamed:@"moon_4"]];
    [self.moonImagesarray addObject:[UIImage imageNamed:@"moon_5"]];
    [self.moonImagesarray addObject:[UIImage imageNamed:@"moon_6"]];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.moonImagesarray.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    cell.imageView.image = [self.moonImagesarray objectAtIndex:indexPath.row];
    return cell;
}

-(IBAction)handlePan:(UIPanGestureRecognizer *)gesture {
    CGPoint point = [gesture translationInView:gesture.view];
    gesture.view.center = CGPointMake(gesture.view.center.x, gesture.view.center.y + point.y);
    [gesture setTranslation:CGPointMake(0, 0) inView:gesture.view];
}
@end
