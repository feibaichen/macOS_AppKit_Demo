//
//  ViewController.m
//  基本控件
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewItem.h"

@interface ViewController ()

@property (nonatomic, strong) NSCollectionView *collectionView;
@property (nonatomic, strong) NSArray *content;
@property (nonatomic, strong) CustomCollectionViewItem *item;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSCollectionView *collectionView = [[NSCollectionView alloc] initWithFrame:self.view.bounds];
    [collectionView setAutoresizingMask:YES];
    [collectionView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    
    CustomCollectionViewItem *item = [[CustomCollectionViewItem alloc] initWithNibName:@"CustomCollectionViewItem" bundle:nil];
    
    //self.item = item;
    collectionView.itemPrototype = item;
    collectionView.content = self.content;
    
    [self.view addSubview:collectionView];
}

- (NSCollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[NSCollectionView alloc] initWithFrame:self.view.bounds];
        [_collectionView setAutoresizingMask:YES];
        [_collectionView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    }
    return _collectionView;
}

- (NSArray *)content {
    if (!_content) {
        _content = @[@{@"title": @"Computer", @"image": [NSImage imageNamed:NSImageNameComputer]},
                    @{@"title": @"Folder", @"image": [NSImage imageNamed:NSImageNameFolder]},
                     @{@"title": @"Network", @"image": [NSImage imageNamed:NSImageNameNetwork]},
                     @{@"title": @"ColorPanel", @"image": [NSImage imageNamed:NSImageNameColorPanel]},
                     @{@"title": @"FontPanel", @"image": [NSImage imageNamed:NSImageNameFontPanel]},
                     @{@"title": @"UserGroup", @"image": [NSImage imageNamed:NSImageNameUserGroup]}];
    }
    return _content;
}

@end













