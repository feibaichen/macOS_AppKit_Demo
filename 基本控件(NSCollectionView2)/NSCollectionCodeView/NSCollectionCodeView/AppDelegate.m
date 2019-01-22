//
//  AppDelegate.m
//  NSCollectionCodeView
//
//  Created by zhaojw on 15/8/28.
//  Copyright (c) 2015年 zhaojw. All rights reserved.
//

#import "AppDelegate.h"
#import "CollectionViewItem.h"
@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;



@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    NSCollectionView *collectionView = [[NSCollectionView alloc]initWithFrame:[self.window.contentView bounds]];
    [[self.window contentView]addSubview:collectionView];
    
    //是否自适应窗口大小
    [collectionView setAutoresizingMask:YES];
    [collectionView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    
    CollectionViewItem *itemPrototype = [[CollectionViewItem alloc]initWithNibName:@"CollectionViewItem" bundle:nil];
    collectionView.itemPrototype = itemPrototype;
    
    NSImage *computerimage = [NSImage imageNamed:NSImageNameComputer];
    NSImage *folderimage = [NSImage imageNamed:NSImageNameFolder];
    NSImage *homeimage = [NSImage imageNamed:NSImageNameHomeTemplate];
    NSImage *listimage = [NSImage imageNamed:NSImageNameListViewTemplate];
    NSImage *networkimage = [NSImage imageNamed:NSImageNameNetwork];
    NSImage *shareimage = [NSImage imageNamed:NSImageNameShareTemplate];
    

    NSArray *content = @[
                     
                         @{
                             @"title":@"computer",
                             @"image":computerimage
                             },
                         @{
                             @"title":@"folder",
                             @"image":folderimage
                             },
                         @{
                             @"title":@"home",
                             @"image":homeimage
                             },
                         @{
                             @"title":@"list",
                             @"image":listimage
                             },
                         @{
                             @"title":@"network",
                             @"image":networkimage
                             },
                         @{
                             @"title":@"share",
                             @"image":shareimage
                             }
                     
                     ];
    
    collectionView.content = content;

}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
